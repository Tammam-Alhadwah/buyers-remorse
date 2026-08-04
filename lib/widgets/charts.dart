// ===========================================================================
// charts.dart  -  the two charts used by the reports screen.
//
// WHY WE DRAW THEM OURSELVES INSTEAD OF ADDING A CHART PACKAGE
// The project must run completely offline on the phone, and every extra
// package is extra weight plus one more thing that can break on a Flutter
// upgrade. A bar chart is a row of rectangles, and a donut is a few arcs -
// Flutter can draw both with widgets we already have.
//
// Both charts are "dumb": they receive a list of values with labels and
// colors, and draw it. They never touch the database and never format money,
// so the same widgets could show anything.
// ===========================================================================

import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../utils/constants.dart';

// ===========================================================================
// ONE BAR / ONE SLICE
// ===========================================================================
class ChartValue {
  final String label; // shown under the bar or in the legend
  final double value; // must not be negative
  final Color color;

  const ChartValue({
    required this.label,
    required this.value,
    this.color = kPrimaryColor,
  });
}

// ===========================================================================
// BAR CHART  -  "how much per day" or "how much per month"
// ===========================================================================
class SimpleBarChart extends StatelessWidget {
  final List<ChartValue> values;
  final double height; // height of the bars area, without the labels
  final bool showValues; // print the number above each bar

  const SimpleBarChart({
    super.key,
    required this.values,
    this.height = 160,
    this.showValues = false,
  });

  @override
  Widget build(BuildContext context) {
    if (values.isEmpty) {
      return SizedBox(
        height: height,
        child: const Center(
          child: Text('Nothing to chart', style: TextStyle(color: Colors.grey)),
        ),
      );
    }

    // The tallest bar defines the scale: it becomes 100% of the height and
    // every other bar is drawn relative to it. fold() walks the list and
    // keeps the biggest value it has seen.
    final maxValue = values.fold<double>(
      0,
          (biggest, item) => item.value > biggest ? item.value : biggest,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height,
          child: Row(
            // Bars grow from the bottom, so they are aligned to the bottom
            // edge and not stretched to fill the row.
            crossAxisAlignment: CrossAxisAlignment.end,
            children: values.map((item) {
              // If every value is 0 (a month with no expenses) we must not
              // divide by zero: NaN would make Flutter throw while painting.
              final factor = maxValue <= 0 ? 0.0 : item.value / maxValue;

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (showValues && item.value > 0)
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            item.value.round().toString(),
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      const SizedBox(height: 2),
                      // A bar of exactly 0 would be invisible, and an empty
                      // gap looks like a bug. 3 pixels keep the day visible
                      // as "nothing spent" instead of "missing".
                      Container(
                        height: math.max(3.0, factor * (height - 24)),
                        decoration: BoxDecoration(
                          color: item.value > 0
                              ? item.color
                              : Colors.grey.shade300,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 6),

        // The labels sit in their own Row using the same Expanded widths, so
        // every label stays exactly under its bar.
        Row(
          children: values.map((item) {
            return Expanded(
              child: Text(
                item.label,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: const TextStyle(fontSize: 9, color: Colors.grey),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// ===========================================================================
// DONUT CHART  -  "which categories ate the money"
// ===========================================================================
class DonutChart extends StatelessWidget {
  final List<ChartValue> values;
  final double size; // width and height of the circle
  final String? centerTitle; // small word inside the ring
  final String? centerValue; // big number inside the ring

  const DonutChart({
    super.key,
    required this.values,
    this.size = 170,
    this.centerTitle,
    this.centerValue,
  });

  @override
  Widget build(BuildContext context) {
    final total = values.fold<double>(0, (sum, item) => sum + item.value);

    return SizedBox(
      width: size,
      height: size,
      // Stack puts the text on top of the painted ring.
      child: Stack(
        alignment: Alignment.center,
        children: [
          // CustomPaint hands a canvas to our painter and fills this box.
          CustomPaint(
            size: Size(size, size),
            painter: _DonutPainter(values: values, total: total),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (centerTitle != null)
                Text(
                  centerTitle!,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              if (centerValue != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      centerValue!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// The class that actually draws. A CustomPainter gets a canvas and must
// implement paint() (draw here) and shouldOldDelegate (should Flutter redraw?).
class _DonutPainter extends CustomPainter {
  final List<ChartValue> values;
  final double total;

  _DonutPainter({required this.values, required this.total});

  @override
  void paint(Canvas canvas, Size size) {
    // How thick the ring is. The arcs are drawn ON the circle line, half the
    // thickness inside and half outside, so the rectangle is shrunk by half
    // the stroke to keep the ring inside the box.
    final stroke = size.width * 0.22;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height)
        .deflate(stroke / 2);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;

    // Nothing to show: draw a plain grey ring so the screen still looks
    // finished instead of showing an empty hole.
    if (total <= 0 || values.isEmpty) {
      paint.color = Colors.grey.shade300;
      canvas.drawArc(rect, 0, 2 * math.pi, false, paint);
      return;
    }

    // Angles in Flutter are in radians and start at 3 o'clock. Subtracting a
    // quarter turn moves the start to 12 o'clock, where a reader expects it.
    double start = -math.pi / 2;

    for (final item in values) {
      if (item.value <= 0) continue;

      final sweep = (item.value / total) * 2 * math.pi;
      paint.color = item.color;

      // false = do not draw the lines back to the centre; that is what makes
      // it a ring instead of a pie with slices.
      canvas.drawArc(rect, start, sweep, false, paint);
      start += sweep;
    }
  }

  // Flutter asks this before repainting. Comparing the data avoids redrawing
  // the same picture on every frame.
  @override
  bool shouldRepaint(_DonutPainter oldDelegate) {
    return oldDelegate.total != total || oldDelegate.values != values;
  }
}

// ===========================================================================
// LEGEND  -  the coloured list that explains the donut
// ===========================================================================
class ChartLegend extends StatelessWidget {
  final List<ChartValue> values;
  final String Function(double) formatValue; // how to print the amount

  const ChartLegend({
    super.key,
    required this.values,
    required this.formatValue,
  });

  @override
  Widget build(BuildContext context) {
    final total = values.fold<double>(0, (sum, item) => sum + item.value);

    return Column(
      children: values.map((item) {
        final percent = total <= 0 ? 0.0 : (item.value / total) * 100;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: item.color,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  item.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${percent.toStringAsFixed(0)}%',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(width: 10),
              Text(
                formatValue(item.value),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}