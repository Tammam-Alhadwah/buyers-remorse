# FLUTTER PROJECT EXPORT

This file was automatically generated.
It contains the Flutter project structure and source code.

# PROJECT STRUCTURE

/
    .flutter-plugins-dependencies
    .gitignore
    .metadata
    PROJECT_CONTEXT.md
    README.md
    analysis_options.yaml
    pubspec.lock
    pubspec.yaml
    python script.py
    lib/
        main.dart
        lib/providers/
            expense_provider.dart
            income_provider.dart
        lib/theme/
            app_theme.dart
        lib/utils/
            category_style.dart
            constants.dart
            date_ranges.dart
            formatters.dart
            validators.dart
        lib/reports/
            reports_screen.dart
        lib/screens/
            change_password_screen.dart
            dashboard_screen.dart
            login_screen.dart
            register_screen.dart
        lib/widgets/
            app_drawer.dart
            category_form_sheet.dart
            charts.dart
            custom_button.dart
            dashboard_card.dart
            expense_card.dart
            expense_form.dart
            income_card.dart
            income_form.dart
        lib/expenses/
            add_expense_screen.dart
            edit_expense_screen.dart
            expense_details_screen.dart
            expenses_list_screen.dart
            search_expenses_screen.dart
        lib/database/
            database_helper.dart
        lib/incomes/
            add_income_screen.dart
            edit_income_screen.dart
            incomes_screen.dart
        lib/categories/
            categories_screen.dart
        lib/models/
            category.dart
            expense.dart
            income.dart
            user.dart
    test/
        widget_test.dart
    android/
        .gitignore
        build.gradle.kts
        gradle.properties
        gradlew
        gradlew.bat
        local.properties
        settings.gradle.kts
        android/.kotlin/
            android/.kotlin/sessions/
        android/app/
            build.gradle.kts
            android/app/src/
                android/app/src/debug/
                    AndroidManifest.xml
                android/app/src/profile/
                    AndroidManifest.xml
                android/app/src/main/
                    AndroidManifest.xml
                    android/app/src/main/java/
                        android/app/src/main/java/io/
                            android/app/src/main/java/io/flutter/
                                android/app/src/main/java/io/flutter/plugins/
                                    GeneratedPluginRegistrant.java
                    android/app/src/main/res/
                        android/app/src/main/res/mipmap-hdpi/
                        android/app/src/main/res/mipmap-xxxhdpi/
                        android/app/src/main/res/mipmap-xxhdpi/
                        android/app/src/main/res/mipmap-mdpi/
                        android/app/src/main/res/drawable/
                            launch_background.xml
                        android/app/src/main/res/drawable-v21/
                            launch_background.xml
                        android/app/src/main/res/mipmap-xhdpi/
                        android/app/src/main/res/values/
                            styles.xml
                        android/app/src/main/res/values-night/
                            styles.xml
                    android/app/src/main/kotlin/
                        android/app/src/main/kotlin/com/
                            android/app/src/main/kotlin/com/example/
                                android/app/src/main/kotlin/com/example/final_project/
                                    MainActivity.kt
        android/gradle/
            android/gradle/wrapper/
                gradle-wrapper.jar
                gradle-wrapper.properties
        android/.gradle/
            file-system.probe
            android/.gradle/buildOutputCleanup/
                buildOutputCleanup.lock
                cache.properties
                outputFiles.bin
            android/.gradle/9.1.0/
                gc.properties
                android/.gradle/9.1.0/vcsMetadata/
                android/.gradle/9.1.0/expanded/
                android/.gradle/9.1.0/executionHistory/
                    executionHistory.bin
                    executionHistory.lock
                android/.gradle/9.1.0/fileChanges/
                    last-build.bin
                android/.gradle/9.1.0/fileHashes/
                    fileHashes.bin
                    fileHashes.lock
                    resourceHashesCache.bin
                android/.gradle/9.1.0/checksums/
                    checksums.lock
            android/.gradle/noVersion/
                buildLogic.lock
            android/.gradle/vcs-1/
                gc.properties
    web/
        index.html
        manifest.json
        web/icons/
    macos/
        .gitignore
        macos/Flutter/
            Flutter-Debug.xcconfig
            Flutter-Release.xcconfig
            GeneratedPluginRegistrant.swift
            macos/Flutter/ephemeral/
                Flutter-Generated.xcconfig
                flutter_export_environment.sh
                flutter_native_integration.env
                macos/Flutter/ephemeral/Packages/
                    macos/Flutter/ephemeral/Packages/.packages/
                    macos/Flutter/ephemeral/Packages/FlutterGeneratedPluginSwiftPackage/
                        Package.swift
                        macos/Flutter/ephemeral/Packages/FlutterGeneratedPluginSwiftPackage/Sources/
                            macos/Flutter/ephemeral/Packages/FlutterGeneratedPluginSwiftPackage/Sources/FlutterGeneratedPluginSwiftPackage/
                                FlutterGeneratedPluginSwiftPackage.swift
        macos/RunnerTests/
            RunnerTests.swift
        macos/Runner/
            AppDelegate.swift
            DebugProfile.entitlements
            Info.plist
            MainFlutterWindow.swift
            Release.entitlements
            macos/Runner/Base.lproj/
                MainMenu.xib
            macos/Runner/Assets.xcassets/
                macos/Runner/Assets.xcassets/AppIcon.appiconset/
                    Contents.json
            macos/Runner/Configs/
                AppInfo.xcconfig
                Debug.xcconfig
                Release.xcconfig
                Warnings.xcconfig
        macos/Runner.xcworkspace/
            contents.xcworkspacedata
            macos/Runner.xcworkspace/xcshareddata/
                IDEWorkspaceChecks.plist
        macos/Runner.xcodeproj/
            project.pbxproj
            macos/Runner.xcodeproj/project.xcworkspace/
                macos/Runner.xcodeproj/project.xcworkspace/xcshareddata/
                    IDEWorkspaceChecks.plist
            macos/Runner.xcodeproj/xcshareddata/
                macos/Runner.xcodeproj/xcshareddata/xcschemes/
                    Runner.xcscheme
    linux/
        .gitignore
        CMakeLists.txt
        linux/runner/
            CMakeLists.txt
            main.cc
            my_application.cc
            my_application.h
        linux/flutter/
            CMakeLists.txt
            generated_plugin_registrant.cc
            generated_plugin_registrant.h
            generated_plugins.cmake
            linux/flutter/ephemeral/
                linux/flutter/ephemeral/.plugin_symlinks/
    windows/
        .gitignore
        CMakeLists.txt
        windows/runner/
            CMakeLists.txt
            Runner.rc
            flutter_window.cpp
            flutter_window.h
            main.cpp
            resource.h
            runner.exe.manifest
            utils.cpp
            utils.h
            win32_window.cpp
            win32_window.h
            windows/runner/resources/
        windows/flutter/
            CMakeLists.txt
            generated_plugin_registrant.cc
            generated_plugin_registrant.h
            generated_plugins.cmake
            windows/flutter/ephemeral/
                windows/flutter/ephemeral/.plugin_symlinks/
    ios/
        .gitignore
        ios/Flutter/
            AppFrameworkInfo.plist
            Debug.xcconfig
            Generated.xcconfig
            Release.xcconfig
            flutter_export_environment.sh
            ios/Flutter/ephemeral/
                flutter_lldb_helper.py
                flutter_lldbinit
                flutter_native_integration.env
                ios/Flutter/ephemeral/Packages/
                    ios/Flutter/ephemeral/Packages/.packages/
                    ios/Flutter/ephemeral/Packages/FlutterGeneratedPluginSwiftPackage/
                        Package.swift
                        ios/Flutter/ephemeral/Packages/FlutterGeneratedPluginSwiftPackage/Sources/
                            ios/Flutter/ephemeral/Packages/FlutterGeneratedPluginSwiftPackage/Sources/FlutterGeneratedPluginSwiftPackage/
                                FlutterGeneratedPluginSwiftPackage.swift
        ios/RunnerTests/
            RunnerTests.swift
        ios/Runner/
            AppDelegate.swift
            GeneratedPluginRegistrant.h
            GeneratedPluginRegistrant.m
            Info.plist
            Runner-Bridging-Header.h
            SceneDelegate.swift
            ios/Runner/Base.lproj/
                LaunchScreen.storyboard
                Main.storyboard
            ios/Runner/Assets.xcassets/
                ios/Runner/Assets.xcassets/AppIcon.appiconset/
                    Contents.json
                ios/Runner/Assets.xcassets/LaunchImage.imageset/
                    Contents.json
                    README.md
        ios/Runner.xcworkspace/
            contents.xcworkspacedata
            ios/Runner.xcworkspace/xcshareddata/
                IDEWorkspaceChecks.plist
                WorkspaceSettings.xcsettings
        ios/Runner.xcodeproj/
            project.pbxproj
            ios/Runner.xcodeproj/project.xcworkspace/
                contents.xcworkspacedata
                ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/
                    IDEWorkspaceChecks.plist
                    WorkspaceSettings.xcsettings
            ios/Runner.xcodeproj/xcshareddata/
                ios/Runner.xcodeproj/xcshareddata/xcschemes/
                    Runner.xcscheme


# PROJECT FILES

================================================================================
FILE: pubspec.yaml
================================================================================

```yaml
name: final_project
description: "A new Flutter project."
# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
# In Windows, build-name is used as the major, minor, and patch parts
# of the product and file versions while build-number is used as the build suffix.
version: 1.0.0+1

environment:
  sdk: ^3.12.2

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
  flutter:
    sdk: flutter

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.8
  sqflite: ^2.3.0
  path: ^1.8.3
  intl: ^0.20.3

dev_dependencies:
  flutter_test:
    sdk: flutter

  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^6.0.0

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter packages.
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  # assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/to/resolution-aware-images

  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/to/asset-from-package

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/to/font-from-package

```

================================================================================
FILE: pubspec.lock
================================================================================

```
# Generated by pub
# See https://dart.dev/tools/pub/glossary#lockfile
packages:
  async:
    dependency: transitive
    description:
      name: async
      sha256: e2eb0491ba5ddb6177742d2da23904574082139b07c1e33b8503b9f46f3e1a37
      url: "https://pub.dev"
    source: hosted
    version: "2.13.1"
  boolean_selector:
    dependency: transitive
    description:
      name: boolean_selector
      sha256: "8aab1771e1243a5063b8b0ff68042d67334e3feab9e95b9490f9a6ebf73b42ea"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.2"
  characters:
    dependency: transitive
    description:
      name: characters
      sha256: faf38497bda5ead2a8c7615f4f7939df04333478bf32e4173fcb06d428b5716b
      url: "https://pub.dev"
    source: hosted
    version: "1.4.1"
  clock:
    dependency: transitive
    description:
      name: clock
      sha256: fddb70d9b5277016c77a80201021d40a2247104d9f4aa7bab7157b7e3f05b84b
      url: "https://pub.dev"
    source: hosted
    version: "1.1.2"
  collection:
    dependency: transitive
    description:
      name: collection
      sha256: "2f5709ae4d3d59dd8f7cd309b4e023046b57d8a6c82130785d2b0e5868084e76"
      url: "https://pub.dev"
    source: hosted
    version: "1.19.1"
  cupertino_icons:
    dependency: "direct main"
    description:
      name: cupertino_icons
      sha256: "41e005c33bd814be4d3096aff55b1908d419fde52ca656c8c47719ec745873cd"
      url: "https://pub.dev"
    source: hosted
    version: "1.0.9"
  fake_async:
    dependency: transitive
    description:
      name: fake_async
      sha256: "5368f224a74523e8d2e7399ea1638b37aecfca824a3cc4dfdf77bf1fa905ac44"
      url: "https://pub.dev"
    source: hosted
    version: "1.3.3"
  flutter:
    dependency: "direct main"
    description: flutter
    source: sdk
    version: "0.0.0"
  flutter_lints:
    dependency: "direct dev"
    description:
      name: flutter_lints
      sha256: "3105dc8492f6183fb076ccf1f351ac3d60564bff92e20bfc4af9cc1651f4e7e1"
      url: "https://pub.dev"
    source: hosted
    version: "6.0.0"
  flutter_test:
    dependency: "direct dev"
    description: flutter
    source: sdk
    version: "0.0.0"
  intl:
    dependency: "direct main"
    description:
      name: intl
      sha256: "1ca20c894b1717686a2319b8548763d812bc0aabdac580420a44c5178c57a867"
      url: "https://pub.dev"
    source: hosted
    version: "0.20.3"
  leak_tracker:
    dependency: transitive
    description:
      name: leak_tracker
      sha256: "33e2e26bdd85a0112ec15400c8cbffea70d0f9c3407491f672a2fad47915e2de"
      url: "https://pub.dev"
    source: hosted
    version: "11.0.2"
  leak_tracker_flutter_testing:
    dependency: transitive
    description:
      name: leak_tracker_flutter_testing
      sha256: "1dbc140bb5a23c75ea9c4811222756104fbcd1a27173f0c34ca01e16bea473c1"
      url: "https://pub.dev"
    source: hosted
    version: "3.0.10"
  leak_tracker_testing:
    dependency: transitive
    description:
      name: leak_tracker_testing
      sha256: "8d5a2d49f4a66b49744b23b018848400d23e54caf9463f4eb20df3eb8acb2eb1"
      url: "https://pub.dev"
    source: hosted
    version: "3.0.2"
  lints:
    dependency: transitive
    description:
      name: lints
      sha256: "12f842a479589fea194fe5c5a3095abc7be0c1f2ddfa9a0e76aed1dbd26a87df"
      url: "https://pub.dev"
    source: hosted
    version: "6.1.0"
  matcher:
    dependency: transitive
    description:
      name: matcher
      sha256: dc0b7dc7651697ea4ff3e69ef44b0407ea32c487a39fff6a4004fa585e901861
      url: "https://pub.dev"
    source: hosted
    version: "0.12.19"
  material_color_utilities:
    dependency: transitive
    description:
      name: material_color_utilities
      sha256: "9c337007e82b1889149c82ed242ed1cb24a66044e30979c44912381e9be4c48b"
      url: "https://pub.dev"
    source: hosted
    version: "0.13.0"
  meta:
    dependency: transitive
    description:
      name: meta
      sha256: "1741988757a65eb6b36abe716829688cf01910bbf91c34354ff7ec1c3de2b349"
      url: "https://pub.dev"
    source: hosted
    version: "1.18.0"
  path:
    dependency: "direct main"
    description:
      name: path
      sha256: "75cca69d1490965be98c73ceaea117e8a04dd21217b37b292c9ddbec0d955bc5"
      url: "https://pub.dev"
    source: hosted
    version: "1.9.1"
  platform:
    dependency: transitive
    description:
      name: platform
      sha256: "5d6b1b0036a5f331ebc77c850ebc8506cbc1e9416c27e59b439f917a902a4984"
      url: "https://pub.dev"
    source: hosted
    version: "3.1.6"
  plugin_platform_interface:
    dependency: transitive
    description:
      name: plugin_platform_interface
      sha256: "4820fbfdb9478b1ebae27888254d445073732dae3d6ea81f0b7e06d5dedc3f02"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.8"
  sky_engine:
    dependency: transitive
    description: flutter
    source: sdk
    version: "0.0.0"
  source_span:
    dependency: transitive
    description:
      name: source_span
      sha256: "56a02f1f4cd1a2d96303c0144c93bd6d909eea6bee6bf5a0e0b685edbd4c47ab"
      url: "https://pub.dev"
    source: hosted
    version: "1.10.2"
  sqflite:
    dependency: "direct main"
    description:
      name: sqflite
      sha256: "58a799e6ac17dd32fbab93813d39ed835a75ccc0f8f85b8955fe318c6712b082"
      url: "https://pub.dev"
    source: hosted
    version: "2.4.3"
  sqflite_android:
    dependency: transitive
    description:
      name: sqflite_android
      sha256: d0548f9d7422a2dae99ec6f8b0a3074463b132d216fa5ba0d230eeefc901983b
      url: "https://pub.dev"
    source: hosted
    version: "2.4.3"
  sqflite_common:
    dependency: transitive
    description:
      name: sqflite_common
      sha256: "5bf6a55c166e73bf651ba7ec3ed486e577620e3dc8f3a9c6a258a8031b624590"
      url: "https://pub.dev"
    source: hosted
    version: "2.5.11"
  sqflite_darwin:
    dependency: transitive
    description:
      name: sqflite_darwin
      sha256: c86ca18b8f666bbf903924687fe21cc16fc385d086005067e26619ca530bef9f
      url: "https://pub.dev"
    source: hosted
    version: "2.4.3+1"
  sqflite_platform_interface:
    dependency: transitive
    description:
      name: sqflite_platform_interface
      sha256: f84939f84350d92d04416f8bc4dc52d3896aec7716cc9e80cf0146342139dc50
      url: "https://pub.dev"
    source: hosted
    version: "2.4.1"
  stack_trace:
    dependency: transitive
    description:
      name: stack_trace
      sha256: "8b27215b45d22309b5cddda1aa2b19bdfec9df0e765f2de506401c071d38d1b1"
      url: "https://pub.dev"
    source: hosted
    version: "1.12.1"
  stream_channel:
    dependency: transitive
    description:
      name: stream_channel
      sha256: "969e04c80b8bcdf826f8f16579c7b14d780458bd97f56d107d3950fdbeef059d"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.4"
  string_scanner:
    dependency: transitive
    description:
      name: string_scanner
      sha256: "921cd31725b72fe181906c6a94d987c78e3b98c2e205b397ea399d4054872b43"
      url: "https://pub.dev"
    source: hosted
    version: "1.4.1"
  synchronized:
    dependency: transitive
    description:
      name: synchronized
      sha256: "61894a1956de6b4fc1aefd0892e109514a1a706cbece3ac59decd90ff5a7a423"
      url: "https://pub.dev"
    source: hosted
    version: "3.4.1+1"
  term_glyph:
    dependency: transitive
    description:
      name: term_glyph
      sha256: "7f554798625ea768a7518313e58f83891c7f5024f88e46e7182a4558850a4b8e"
      url: "https://pub.dev"
    source: hosted
    version: "1.2.2"
  test_api:
    dependency: transitive
    description:
      name: test_api
      sha256: "949a932224383300f01be9221c39180316445ecb8e7547f70a41a35bf421fb9e"
      url: "https://pub.dev"
    source: hosted
    version: "0.7.11"
  vector_math:
    dependency: transitive
    description:
      name: vector_math
      sha256: d530bd74fea330e6e364cda7a85019c434070188383e1cd8d9777ee586914c5b
      url: "https://pub.dev"
    source: hosted
    version: "2.2.0"
  vm_service:
    dependency: transitive
    description:
      name: vm_service
      sha256: "0016aef94fc66495ac78af5859181e3f3bf2026bd8eecc72b9565601e19ab360"
      url: "https://pub.dev"
    source: hosted
    version: "15.2.0"
sdks:
  dart: ">=3.12.2 <4.0.0"
  flutter: ">=3.44.0"

```

================================================================================
FILE: analysis_options.yaml
================================================================================

```yaml
# This file configures the analyzer, which statically analyzes Dart code to
# check for errors, warnings, and lints.
#
# The issues identified by the analyzer are surfaced in the UI of Dart-enabled
# IDEs (https://dart.dev/tools#ides-and-editors). The analyzer can also be
# invoked from the command line by running `flutter analyze`.

# The following line activates a set of recommended lints for Flutter apps,
# packages, and plugins designed to encourage good coding practices.
include: package:flutter_lints/flutter.yaml

linter:
  # The lint rules applied to this project can be customized in the
  # section below to disable rules from the `package:flutter_lints/flutter.yaml`
  # included above or to enable additional rules. A list of all available lints
  # and their documentation is published at https://dart.dev/lints.
  #
  # Instead of disabling a lint rule for the entire project in the
  # section below, it can also be suppressed for a single line of code
  # or a specific dart file by using the `// ignore: name_of_lint` and
  # `// ignore_for_file: name_of_lint` syntax on the line or in the file
  # producing the lint.
  rules:
    # avoid_print: false  # Uncomment to disable the `avoid_print` rule
    # prefer_single_quotes: true  # Uncomment to enable the `prefer_single_quotes` rule

# Additional information about this file can be found at
# https://dart.dev/guides/language/analysis-options

```

================================================================================
FILE: .metadata
================================================================================

```
# This file tracks properties of this Flutter project.
# Used by Flutter tool to assess capabilities and perform upgrades etc.
#
# This file should be version controlled and should not be manually edited.

version:
  revision: "ad70ec4617166f1c38e5d2bfd388af71fda14f06"
  channel: "stable"

project_type: app

# Tracks metadata for the flutter migrate command
migration:
  platforms:
    - platform: root
      create_revision: ad70ec4617166f1c38e5d2bfd388af71fda14f06
      base_revision: ad70ec4617166f1c38e5d2bfd388af71fda14f06
    - platform: android
      create_revision: ad70ec4617166f1c38e5d2bfd388af71fda14f06
      base_revision: ad70ec4617166f1c38e5d2bfd388af71fda14f06
    - platform: ios
      create_revision: ad70ec4617166f1c38e5d2bfd388af71fda14f06
      base_revision: ad70ec4617166f1c38e5d2bfd388af71fda14f06
    - platform: linux
      create_revision: ad70ec4617166f1c38e5d2bfd388af71fda14f06
      base_revision: ad70ec4617166f1c38e5d2bfd388af71fda14f06
    - platform: macos
      create_revision: ad70ec4617166f1c38e5d2bfd388af71fda14f06
      base_revision: ad70ec4617166f1c38e5d2bfd388af71fda14f06
    - platform: web
      create_revision: ad70ec4617166f1c38e5d2bfd388af71fda14f06
      base_revision: ad70ec4617166f1c38e5d2bfd388af71fda14f06
    - platform: windows
      create_revision: ad70ec4617166f1c38e5d2bfd388af71fda14f06
      base_revision: ad70ec4617166f1c38e5d2bfd388af71fda14f06

  # User provided section

  # List of Local paths (relative to this file) that should be
  # ignored by the migrate tool.
  #
  # Files that are not part of the templates will be ignored by default.
  unmanaged_files:
    - 'lib/main.dart'
    - 'ios/Runner.xcodeproj/project.pbxproj'

```

================================================================================
FILE: lib/main.dart
================================================================================

```dart
// ===========================================================================
// main.dart  -  the file Flutter runs first.
//
// It does almost nothing on purpose: it just starts the app, applies the
// theme, and shows the login screen. All the real work lives in the other
// files inside lib/.
// ===========================================================================

import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'utils/constants.dart';
import 'screens/login_screen.dart';

// main() = where every Dart program starts.
// runApp() puts our app on the screen.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp = the root of the app: gives Material Design + settings.
    return MaterialApp(
      title: kAppName,
      debugShowCheckedModeBanner: false, // hide the red DEBUG ribbon
      theme: AppTheme.light, // the style we defined in app_theme.dart
      home: const LoginScreen(), // the first screen
    );
  }
}

```

================================================================================
FILE: lib/providers/expense_provider.dart
================================================================================

```dart
// ===========================================================================
// expense_provider.dart  -  holds the list of expenses in memory and tells
// the screens to refresh when it changes.
//
// THE PROBLEM IT SOLVES
// Without it, every screen loads from the database on its own and keeps its
// own copy. Add an expense on one screen and the dashboard behind it is
// already wrong - it only fixes itself if that screen remembers to reload.
//
// With it: ONE provider owns the list. Screens listen to it. When the list
// changes, notifyListeners() redraws every screen that is showing it, at the
// same moment, with the same data.
//
// WHY THERE IS NO "provider" PACKAGE IMPORT
// The specification allows Flutter, Dart and SQLite. ChangeNotifier is part
// of Flutter itself, and Flutter's own ListenableBuilder can listen to it, so
// the pattern works with nothing added to pubspec.yaml. The provider package
// only adds a nicer way to find this object from the widget tree - here the
// object is a singleton, so any screen can simply write ExpenseProvider().
//
// WHERE THE NUMBERS COME FROM
// The dashboard and the reports do NOT query the database again. Everything
// they show (totals, category breakdown, charts) is calculated from the list
// that is already in memory, by the getters at the bottom of this file. The
// database is asked once; the statistics follow from that answer.
// ===========================================================================

import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/expense.dart';
import '../database/database_helper.dart';
import '../utils/date_ranges.dart';
import '../utils/formatters.dart';

// ---------------------------------------------------------------------------
// One line of the "where did the money go?" report: a category and its total.
//
// It lives here, not in models/, because it is not a table. models/ mirrors
// the four tables of the database; this is a result the provider calculates.
// ---------------------------------------------------------------------------
class CategoryTotal {
  final int? categoryId; // null = the category was deleted
  final String name;
  final String? icon; // key for utils/category_style.dart
  final String? color; // '#RRGGBB'
  final double total;

  const CategoryTotal({
    required this.categoryId,
    required this.name,
    required this.total,
    this.icon,
    this.color,
  });

  // This category's share of a grand total, as 0.0 -> 1.0.
  // Dividing by zero in Dart gives NaN instead of an error, which would
  // silently paint a broken chart, so the guard lives here once.
  double shareOf(double grandTotal) {
    if (grandTotal <= 0) return 0.0;
    return total / grandTotal;
  }
}

// ChangeNotifier = a class that can shout "I changed!" to anyone listening.
class ExpenseProvider extends ChangeNotifier {
  // -------------------------------------------------------------------------
  // SINGLETON - the same three lines as DatabaseHelper, for the same reason.
  // Two ExpenseProvider objects would mean two lists, and a screen listening
  // to the wrong one would never refresh. Writing ExpenseProvider() anywhere
  // in the app always returns this one object.
  // -------------------------------------------------------------------------
  static final ExpenseProvider _instance = ExpenseProvider._internal();
  factory ExpenseProvider() => _instance;
  ExpenseProvider._internal();

  final DatabaseHelper _db = DatabaseHelper();

  // ---- the state ----
  // Private, so no screen can add a row to the list behind the provider's
  // back (that would change the data without redrawing anybody).
  List<Expense> _expenses = [];
  bool _isLoading = false;
  String? _errorMessage;
  bool _hasLoadedOnce = false;

  // ---- read-only views for the screens ----
  // List.unmodifiable: the screens may read the list, never edit it.
  List<Expense> get expenses => List.unmodifiable(_expenses);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasLoadedOnce => _hasLoadedOnce;
  bool get isEmpty => _expenses.isEmpty;

  // =========================================================================
  // LOADING AND CRUD
  // =========================================================================
  // Every write goes through here rather than through DatabaseHelper directly.
  // That is what keeps the promise above: after any change the list is read
  // again and every listening screen is told.

  Future<void> loadExpenses() async {
    _isLoading = true;
    _errorMessage = null;

    // WHY scheduleMicrotask AND NOT A PLAIN notifyListeners()
    // This is the only notify that happens synchronously, before any await.
    // If a screen calls loadExpenses() from initState, a plain notify would ask
    // Flutter to redraw a widget it is still building, which throws. A
    // microtask runs as soon as the current work finishes - after the build -
    // so screens can call this from anywhere without thinking about it.
    scheduleMicrotask(notifyListeners); // screens show their spinner

    try {
      _expenses = await _db.getAllExpenses(); // newest first, category JOINed
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Could not load your expenses.';
      _expenses = [];
    }

    _isLoading = false;
    _hasLoadedOnce = true;
    notifyListeners(); // screens redraw with the result
  }

  // Loads only the first time. A screen that opens second should show the
  // data immediately instead of blinking a spinner over a list we already
  // have.
  Future<void> ensureLoaded() async {
    if (_hasLoadedOnce || _isLoading) return;
    await loadExpenses();
  }

  // FR5. Reloading afterwards costs one cheap local query and gives us the
  // new row WITH its category columns filled in by the JOIN - cheaper to do
  // than to rebuild that row correctly by hand.
  Future<void> addExpense(Expense expense) async {
    await _db.addExpense(expense);
    await loadExpenses();
  }

  // FR6. Returns false when 0 rows changed, which means the expense was
  // deleted from somewhere else while this screen was open.
  Future<bool> updateExpense(Expense expense) async {
    final changed = await _db.updateExpense(expense);
    await loadExpenses();
    return changed > 0;
  }

  // FR7.
  Future<void> deleteExpense(int id) async {
    await _db.deleteExpense(id);
    await loadExpenses();
  }

  // FR9: one fresh row, read straight from the database so a details screen
  // never shows values that were edited meanwhile.
  Future<Expense?> getById(int id) => _db.getExpenseById(id);

  // FR16 - FR20. This one does NOT touch _expenses on purpose.
  //
  // The full list is STATE: many screens share it and must agree on it.
  // A search result is a one-off ANSWER to a question the user just asked,
  // and it is answered by SQLite with a WHERE clause - which is exactly what
  // a database is for, and far better than filtering thousands of rows in
  // Dart.
  Future<List<Expense>> search({
    String? text,
    DateRange? range,
    int? categoryId,
    double? minAmount,
    double? maxAmount,
  }) {
    return _db.searchExpenses(
      text: text,
      range: range,
      categoryId: categoryId,
      minAmount: minAmount,
      maxAmount: maxAmount,
    );
  }

  // =========================================================================
  // STATISTICS  -  all calculated from the list already in memory
  // =========================================================================
  // These are plain getters, not Futures: the data is here, so the answer is
  // immediate and a screen can use it directly inside build().

  // The expenses of one period (FR21 day, FR22 week, FR23 month, FR24 year -
  // all four are just different ranges).
  List<Expense> inRange(DateRange range) {
    return _expenses
        .where((expense) => range.contains(expense.expenseDate))
        .toList();
  }

  // Total spent. No range = all time.
  double totalIn([DateRange? range]) {
    final list = range == null ? _expenses : inRange(range);
    // fold walks the list carrying a running sum.
    return list.fold<double>(0.0, (sum, expense) => sum + expense.amount);
  }

  double get total => totalIn();

  // Sum per category, biggest first.
  //
  // A Map is used as the accumulator: the category id is the key, so every
  // expense finds its group in one step instead of searching the list again
  // for each category.
  List<CategoryTotal> byCategory({DateRange? range}) {
    final list = range == null ? _expenses : inRange(range);

    final groups = <int?, CategoryTotal>{};
    for (final expense in list) {
      final existing = groups[expense.categoryId];
      groups[expense.categoryId] = CategoryTotal(
        categoryId: expense.categoryId,
        // The name, icon and colour travel with the expense already, because
        // getAllExpenses() LEFT JOINs the categories table. Deleting a
        // category leaves its expenses with no name, so they are grouped
        // under a readable label instead of vanishing from the report.
        name: expense.categoryName ?? 'Uncategorized',
        icon: expense.categoryIcon,
        color: expense.categoryColor,
        total: (existing?.total ?? 0.0) + expense.amount,
      );
    }

    final result = groups.values.toList();
    result.sort((a, b) => b.total.compareTo(a.total)); // biggest first
    return result;
  }

  // The dashboard's "biggest spending category". Null when nothing was spent.
  CategoryTotal? topCategory({DateRange? range}) {
    final totals = byCategory(range: range);
    return totals.isEmpty ? null : totals.first;
  }

  // {'2026-08-03': 12500.0, ...} for the daily bar chart. Days with nothing
  // spent are simply absent; the chart draws them as zero.
  Map<String, double> dailyTotals(DateRange range) {
    final result = <String, double>{};
    for (final expense in inRange(range)) {
      final key = toDbDate(expense.expenseDate);
      result[key] = (result[key] ?? 0.0) + expense.amount;
    }
    return result;
  }

  // Twelve numbers, January -> December, for the yearly bar chart. Starting
  // from twelve zeros means a year with three active months still draws a
  // twelve-bar chart.
  List<double> monthlyTotals(int year) {
    final months = List<double>.filled(12, 0.0);
    for (final expense in _expenses) {
      if (expense.expenseDate.year != year) continue;
      months[expense.expenseDate.month - 1] += expense.amount;
    }
    return months;
  }

  // The newest few, for the dashboard. The list arrives sorted by the SQL
  // ORDER BY, so "newest" is simply the front of it.
  List<Expense> recent(int count) {
    return _expenses.take(count).toList();
  }
}
```

================================================================================
FILE: lib/providers/income_provider.dart
================================================================================

```dart
// ===========================================================================
// income_provider.dart  -  holds the list of incomes in memory and tells the
// screens to refresh when it changes.
//
// Same idea, same shape and same rules as expense_provider.dart, minus the
// categories: income is not classified in this project, so there is no
// grouping and no JOIN.
//
// The two providers stay separate rather than becoming one "money provider"
// because they own two different tables. The dashboard is the only place that
// needs both, and it simply listens to both.
// ===========================================================================

import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/income.dart';
import '../database/database_helper.dart';
import '../utils/date_ranges.dart';
import '../utils/formatters.dart';

class IncomeProvider extends ChangeNotifier {
  // -------------------------------------------------------------------------
  // SINGLETON - one list for the whole app. See expense_provider.dart.
  // -------------------------------------------------------------------------
  static final IncomeProvider _instance = IncomeProvider._internal();
  factory IncomeProvider() => _instance;
  IncomeProvider._internal();

  final DatabaseHelper _db = DatabaseHelper();

  List<Income> _incomes = [];
  bool _isLoading = false;
  String? _errorMessage;
  bool _hasLoadedOnce = false;

  List<Income> get incomes => List.unmodifiable(_incomes);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasLoadedOnce => _hasLoadedOnce;
  bool get isEmpty => _incomes.isEmpty;

  // =========================================================================
  // LOADING AND CRUD
  // =========================================================================

  Future<void> loadIncomes() async {
    _isLoading = true;
    _errorMessage = null;

    // scheduleMicrotask, not a plain notifyListeners(): this is the only
    // notification that happens before an await, and a screen calling
    // loadIncomes() from initState would otherwise ask Flutter to redraw a
    // widget it is still building. See expense_provider.dart.
    scheduleMicrotask(notifyListeners);

    try {
      _incomes = await _db.getAllIncomes(); // newest first
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Could not load your incomes.';
      _incomes = [];
    }

    _isLoading = false;
    _hasLoadedOnce = true;
    notifyListeners();
  }

  Future<void> ensureLoaded() async {
    if (_hasLoadedOnce || _isLoading) return;
    await loadIncomes();
  }

  // FR10.
  Future<void> addIncome(Income income) async {
    await _db.addIncome(income);
    await loadIncomes();
  }

  // FR11. false = 0 rows changed, so the income no longer exists.
  Future<bool> updateIncome(Income income) async {
    final changed = await _db.updateIncome(income);
    await loadIncomes();
    return changed > 0;
  }

  // FR12.
  Future<void> deleteIncome(int id) async {
    await _db.deleteIncome(id);
    await loadIncomes();
  }

  Future<Income?> getById(int id) => _db.getIncomeById(id);

  // =========================================================================
  // STATISTICS  -  calculated from the list already in memory
  // =========================================================================

  List<Income> inRange(DateRange range) {
    return _incomes.where((income) => range.contains(income.incomeDate)).toList();
  }

  // Total earned. No range = all time.
  double totalIn([DateRange? range]) {
    final list = range == null ? _incomes : inRange(range);
    return list.fold<double>(0.0, (sum, income) => sum + income.amount);
  }

  double get total => totalIn();

  // {'2026-08-01': 500000.0, ...} - the income side of the daily chart.
  Map<String, double> dailyTotals(DateRange range) {
    final result = <String, double>{};
    for (final income in inRange(range)) {
      final key = toDbDate(income.incomeDate);
      result[key] = (result[key] ?? 0.0) + income.amount;
    }
    return result;
  }

  // Twelve numbers, January -> December.
  List<double> monthlyTotals(int year) {
    final months = List<double>.filled(12, 0.0);
    for (final income in _incomes) {
      if (income.incomeDate.year != year) continue;
      months[income.incomeDate.month - 1] += income.amount;
    }
    return months;
  }

  List<Income> recent(int count) {
    return _incomes.take(count).toList();
  }
}
```

================================================================================
FILE: lib/theme/app_theme.dart
================================================================================

```dart
// ===========================================================================
// app_theme.dart  -  the visual style of the whole app.
//
// Instead of styling every button and app bar by hand, we set the style ONCE
// here. MaterialApp uses it, and every widget inherits it automatically.
// ===========================================================================

import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AppTheme {
  // A "static" value belongs to the class itself, so we can write
  // AppTheme.light without creating an object first.
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true, // use the modern Material 3 look
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: const Color(0xFFF3F6F8), // light grey page

      // ---- APP BAR (top bar) default look ----
      appBarTheme: const AppBarTheme(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white, // white title + icons
        centerTitle: true,
        elevation: 0,
      ),

      // ---- ELEVATED BUTTON default look ----
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(50), // full-width, 50 tall
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // ---- TEXT FIELD default look ----
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(), // box around every text field
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

```

================================================================================
FILE: lib/utils/category_style.dart
================================================================================

```dart
// ===========================================================================
// category_style.dart  -  turns the TEXT stored in the categories table into
// real Flutter objects (an IconData and a Color).
//
// The database can only hold text, but the UI needs Icons.restaurant and
// Color(0xFFD2544F). This file is the bridge, and it is the only place that
// knows the list of allowed icons - the category screens will reuse it.
// ===========================================================================

import 'package:flutter/material.dart';

import 'constants.dart';

// -------------------------------------------------------------------------
// ICONS
// -------------------------------------------------------------------------
// key (stored in the database)  ->  icon (shown on screen).
// Everything here is const, so Flutter can safely keep these icons in the
// release build. Add a new pair to support a new icon.
const Map<String, IconData> kCategoryIcons = {
  'food': Icons.restaurant,
  'transport': Icons.directions_bus,
  'bills': Icons.receipt_long,
  'entertainment': Icons.movie,
  'health': Icons.local_hospital,
  'education': Icons.school,
  'shopping': Icons.shopping_bag,
  'home': Icons.home,
  'other': Icons.category,
};

// Never throws: an unknown or missing key falls back to a neutral icon.
IconData categoryIcon(String? key) {
  return kCategoryIcons[key] ?? Icons.category;
}

// -------------------------------------------------------------------------
// COLORS
// -------------------------------------------------------------------------
// '#RRGGBB' -> Color. We add 0xFF000000 to make the color fully opaque,
// because a Color needs 8 hex digits (alpha + red + green + blue) and we
// only store 6.
Color categoryColor(String? hex) {
  if (hex == null) return kPrimaryColor;

  final cleaned = hex.replaceAll('#', '').trim();
  if (cleaned.length != 6) return kPrimaryColor;

  final value = int.tryParse(cleaned, radix: 16);
  if (value == null) return kPrimaryColor;

  return Color(value | 0xFF000000);
}

// The choices offered by the category form. Keeping them next to the map
// above means a new icon is added in exactly one place.
List<String> get kCategoryIconKeys => kCategoryIcons.keys.toList();

// A small, deliberately limited palette. A free colour picker would let a
// user choose white on white; a fixed set always looks right with the theme.
const List<String> kCategoryColorOptions = [
  '#E4572E', // orange red
  '#D2544F', // red
  '#F2A65A', // amber
  '#3BA776', // green
  '#1E5F8C', // primary blue
  '#4FA3C4', // light blue
  '#6C5B7B', // purple
  '#8E44AD', // violet
  '#2C3E50', // dark slate
  '#7A8B99', // grey
];

```

================================================================================
FILE: lib/utils/constants.dart
================================================================================

```dart
// ===========================================================================
// constants.dart  -  values used all over the app, kept in ONE place.
// Change something here and it changes everywhere. No magic numbers scattered
// around the code.
// ===========================================================================

import 'package:flutter/material.dart';

// -------- TEXT --------
const String kAppName = "Buyer's Remorse";

// -------- COLORS --------
// 0xFF means "fully visible", then the 6-digit hex color.
const Color kPrimaryColor = Color(0xFF1E5F8C); // dark blue (main color)
const Color kAccentColor = Color(0xFF4FA3C4); // light blue
const Color kExpenseColor = Color(0xFFD2544F); // red   (money going out)
const Color kIncomeColor = Color(0xFF3BA776); // green (money coming in)

// -------- SPACING --------
// Standard gaps so all screens breathe the same way.
const double kPadding = 16.0;
const double kRadius = 16.0; // corner rounding for cards and buttons

```

================================================================================
FILE: lib/utils/date_ranges.dart
================================================================================

```dart
// ===========================================================================
// date_ranges.dart  -  a start date + an end date, and the four ranges the
// reports need (FR21 daily, FR22 weekly, FR23 monthly, FR24 yearly).
//
// WHY A CLASS INSTEAD OF TWO LOOSE DateTime VARIABLES?
// Every report query needs a pair of dates that belong together. Passing them
// separately invites the classic bug of swapping them by accident. One object
// also means the "what is this week?" rule is written ONCE, here, instead of
// being re-invented in every screen.
//
// Both ends are INCLUSIVE: an expense dated exactly on `end` is inside the
// range. That matches how the SQL uses it (BETWEEN ? AND ? is inclusive too).
//
// No Flutter imports here on purpose - this is pure logic, so the database
// layer can use it without dragging the UI in.
// ===========================================================================

import 'package:intl/intl.dart';

import 'formatters.dart';

class DateRange {
  final DateTime start; // first day, included
  final DateTime end; // last day, included

  const DateRange(this.start, this.end);

  // ---- FR21: one single day ----
  factory DateRange.day(DateTime value) {
    final day = dateOnly(value);
    return DateRange(day, day);
  }

  // ---- FR22: the week that contains `value`, Monday -> Sunday ----
  //
  // weekday is 1 for Monday ... 7 for Sunday, so subtracting (weekday - 1)
  // days always lands on the Monday of that week.
  //
  // We rebuild the date with DateTime(y, m, d - n) instead of
  // subtract(Duration(days: n)). Duration counts HOURS, so on the night the
  // clock changes (daylight saving) it can land on the wrong day. Asking for
  // "day number 3 minus 5" has no such problem: Dart rolls the month back for
  // us, and day 0 means "the last day of the previous month".
  factory DateRange.week(DateTime value) {
    final day = dateOnly(value);
    final start = DateTime(day.year, day.month, day.day - (day.weekday - 1));
    final end = DateTime(start.year, start.month, start.day + 6);
    return DateRange(start, end);
  }

  // ---- FR23: the whole month that contains `value` ----
  //
  // The trick in the second line: day 0 of the NEXT month is the last day of
  // THIS month, so we never have to remember which months have 30 or 31 days,
  // and February works in leap years for free.
  factory DateRange.month(DateTime value) {
    return DateRange(
      DateTime(value.year, value.month, 1),
      DateTime(value.year, value.month + 1, 0),
    );
  }

  // ---- FR24: the whole year that contains `value` ----
  factory DateRange.year(DateTime value) {
    return DateRange(DateTime(value.year, 1, 1), DateTime(value.year, 12, 31));
  }

  // Is one date inside the range? (Used by screens, not by SQL.)
  bool contains(DateTime value) {
    final day = dateOnly(value);
    return !day.isBefore(start) && !day.isAfter(end);
  }

  // How many days the range covers, including both ends.
  int get days => end.difference(start).inDays + 1;

  // A short title for the report header, e.g.
  //   'Today'  /  '03 - 09 Aug 2026'  /  'August 2026'  /  '2026'
  String get label {
    if (start == end) {
      final today = dateOnly(DateTime.now());
      if (start == today) return 'Today';
      return formatDate(start);
    }

    // A full calendar year.
    if (start.month == 1 && start.day == 1 && end.month == 12 && end.day == 31) {
      return DateFormat('yyyy').format(start);
    }

    // A full calendar month.
    if (start.day == 1 && end.day == DateTime(end.year, end.month + 1, 0).day &&
        start.month == end.month && start.year == end.year) {
      return DateFormat('MMMM yyyy').format(start);
    }

    // Anything else (a week, or a range the user picked by hand).
    return '${formatDate(start)} - ${formatDate(end)}';
  }
}
```

================================================================================
FILE: lib/utils/formatters.dart
================================================================================

```dart
// ===========================================================================
// formatters.dart  -  turning values into text, in ONE place.
//
// Two different jobs live here, and mixing them up is a classic bug:
//
//   1. DATABASE format  (toDbDate / parseDbDate)
//      Always 'yyyy-MM-dd'. SQLite has no real DATE type - it stores text -
//      and this format is the only one where sorting the TEXT also sorts the
//      dates correctly ('2026-01-09' < '2026-02-01'). It also makes the
//      monthly / yearly reports later a simple LIKE '2026-02%'.
//      NEVER show this format to the user.
//
//   2. SCREEN format  (formatDate / formatAmount)
//      Pretty text for humans. NEVER save this to the database.
//
// This file imports intl only (no Flutter), so models can use it too.
// ===========================================================================

import 'package:intl/intl.dart';

// -------- DATES: database side --------

// Throws away the time part. An expense happens on a DAY; keeping
// hours/minutes would break "is this the same date?" comparisons.
DateTime dateOnly(DateTime value) {
  return DateTime(value.year, value.month, value.day);
}

// DateTime -> '2026-08-03'   (what we store)
String toDbDate(DateTime value) {
  return DateFormat('yyyy-MM-dd').format(value);
}

// '2026-08-03' -> DateTime   (what we read)
// Defensive on purpose: a row written by hand, or an older row, must not
// crash the whole list. If the text is unusable we fall back to today.
DateTime parseDbDate(String? text) {
  if (text == null || text.isEmpty) return dateOnly(DateTime.now());
  final parsed = DateTime.tryParse(text);
  return parsed == null ? dateOnly(DateTime.now()) : dateOnly(parsed);
}

// -------- DATES: screen side --------

// DateTime -> '03 Aug 2026'
String formatDate(DateTime value) {
  return DateFormat('dd MMM yyyy').format(value);
}

// -------- MONEY --------

// 1234.5 -> '1,234.50'
// Always two decimals, so a column of amounts lines up neatly.
String formatAmount(double value) {
  return NumberFormat('#,##0.00').format(value);
}

```

================================================================================
FILE: lib/utils/validators.dart
================================================================================

```dart
// ===========================================================================
// validators.dart  -  all the input rules of the app, kept in ONE place.
//
// WHY A SEPARATE FILE?
// A Flutter TextFormField asks a question: "is this text acceptable?".
// The answer must be:
//    null            -> the value is GOOD
//    "some message"  -> the value is BAD, show this message under the field
//
// If every screen wrote its own rules, the same rule would be copy-pasted
// (and would slowly drift apart). Here we write each rule once and reuse it:
//
//    TextFormField(validator: Validators.username)
//
// Every function below has the same shape: it takes String? and returns
// String? , because that is exactly the shape Flutter expects.
// ===========================================================================

class Validators {
  // -------------------------------------------------------------------------
  // SANITIZING (cleaning) INPUT
  // -------------------------------------------------------------------------
  // Users type messy text: leading spaces, double spaces, a newline pasted
  // from somewhere. We clean it BEFORE validating and BEFORE saving, so the
  // database never stores "  ali  " next to "ali".
  static String sanitize(String value) {
    return value
        .trim() // remove spaces at the start and the end
        .replaceAll(RegExp(r'\s+'), ' '); // collapse inner spaces into one
  }

  // -------------------------------------------------------------------------
  // USERNAME
  // -------------------------------------------------------------------------
  // Rules:
  //   - not empty
  //   - 3 to 20 characters (short names are easy to guess / clash)
  //   - letters, digits and underscore only  -> no spaces, no symbols
  // NOTE: "is this username already taken?" is NOT checked here, because that
  // question needs the database (an async call) and validators must answer
  // instantly. The register screen asks the database separately.
  static String? username(String? value) {
    final text = (value ?? '').trim();

    if (text.isEmpty) return 'Username is required';
    if (text.length < 3) return 'Username must be at least 3 characters';
    if (text.length > 20) return 'Username must be at most 20 characters';

    // ^ = start, $ = end, so the WHOLE text must match the allowed set.
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(text)) {
      return 'Use letters, numbers and _ only (no spaces)';
    }
    return null;
  }

  // -------------------------------------------------------------------------
  // PASSWORD
  // -------------------------------------------------------------------------
  // Rules:
  //   - not empty
  //   - at least 6 characters
  //   - contains at least one letter AND one digit
  // The two demo accounts created in database_helper.dart already follow
  // these rules, so old accounts keep working.
  static String? password(String? value) {
    final text = value ?? '';

    if (text.isEmpty) return 'Password is required';
    if (text.length < 6) return 'Password must be at least 6 characters';
    if (!RegExp(r'[A-Za-z]').hasMatch(text)) {
      return 'Password must contain at least one letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(text)) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  // -------------------------------------------------------------------------
  // PASSWORD USED ONLY TO LOG IN
  // -------------------------------------------------------------------------
  // On the LOGIN screen we must NOT apply the strength rules above: an old
  // account might have a weak password, and telling a stranger "your password
  // needs a digit" leaks information. Empty is the only invalid case here.
  static String? loginPassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    return null;
  }

  // -------------------------------------------------------------------------
  // CONFIRM PASSWORD
  // -------------------------------------------------------------------------
  // Needs the first password to compare with, so it takes a second argument.
  // In the screen we call it inside a small closure:
  //    validator: (v) => Validators.confirmPassword(v, passwordController.text)
  static String? confirmPassword(String? value, String original) {
    if (value == null || value.isEmpty) return 'Please confirm the password';
    if (value != original) return 'Passwords do not match';
    return null;
  }

  // -------------------------------------------------------------------------
  // FULL NAME
  // -------------------------------------------------------------------------
  // Rules:
  //   - not empty
  //   - at least 3 characters
  //   - no digits (a name is not "Ali 123")
  // We deliberately do NOT restrict the alphabet, because the app must accept
  // Arabic names as well as English ones.
  static String? fullName(String? value) {
    final text = sanitize(value ?? '');

    if (text.isEmpty) return 'Full name is required';
    if (text.length < 3) return 'Full name must be at least 3 characters';
    if (RegExp(r'[0-9]').hasMatch(text)) {
      return 'Full name cannot contain numbers';
    }
    return null;
  }

  // -------------------------------------------------------------------------
  // TITLE  (expenses, incomes)
  // -------------------------------------------------------------------------
  // The specification requires NOT NULL columns to be filled in. A title is
  // what the user recognises the row by, so an empty one is useless.
  static String? title(String? value) {
    final text = sanitize(value ?? '');

    if (text.isEmpty) return 'Title is required';
    if (text.length < 2) return 'Title must be at least 2 characters';
    if (text.length > 60) return 'Title must be at most 60 characters';
    return null;
  }

  // -------------------------------------------------------------------------
  // AMOUNT  (money)
  // -------------------------------------------------------------------------
  // Rules from the specification: required, a real number, and POSITIVE
  // ("the value must be positive"). Zero is refused too - saving an expense
  // of 0 is always a mistake.
  static String? amount(String? value) {
    final text = (value ?? '').trim();

    if (text.isEmpty) return 'Amount is required';

    // tryParse returns null instead of throwing when the text is not a
    // number, which is exactly what a validator wants.
    final parsed = double.tryParse(text);
    if (parsed == null) return 'Enter a valid number';

    if (parsed <= 0) return 'The value must be positive';
    if (parsed > 1000000000) return 'This amount is too large';

    // 12.345 would be silently rounded when displayed, so refuse it here.
    final dot = text.indexOf('.');
    if (dot != -1 && text.length - dot - 1 > 2) {
      return 'Use at most 2 decimals';
    }
    return null;
  }

  // -------------------------------------------------------------------------
  // NOTES  (optional field)
  // -------------------------------------------------------------------------
  // Empty is valid here - that is the whole point of an optional field. We
  // only guard the length so one row cannot hold a whole essay.
  static String? notes(String? value) {
    final text = sanitize(value ?? '');
    if (text.length > 200) return 'Notes must be at most 200 characters';
    return null;
  }

  // -------------------------------------------------------------------------
  // DATE
  // -------------------------------------------------------------------------
  // The date picker already blocks impossible dates, but a validator is the
  // safety net if a screen ever sets the date in code.
  // A daily expense/income is something that HAPPENED, so the future is out.
  static String? pastOrToday(DateTime? value) {
    if (value == null) return 'Date is required';

    final today = DateTime.now();
    final endOfToday = DateTime(today.year, today.month, today.day, 23, 59, 59);

    if (value.isAfter(endOfToday)) return 'The date cannot be in the future';
    if (value.year < 2000) return 'The date is too far in the past';
    return null;
  }
  // -------------------------------------------------------------------------
  // CATEGORY NAME
  // -------------------------------------------------------------------------
  // The categories table declares  name TEXT NOT NULL , so empty is refused
  // here too. "Already exists" is NOT checked here: that question needs the
  // database, and a validator must answer instantly - the categories screen
  // asks separately.
  static String? categoryName(String? value) {
    final text = sanitize(value ?? '');

    if (text.isEmpty) return 'Name is required';
    if (text.length < 2) return 'Name must be at least 2 characters';
    if (text.length > 30) return 'Name must be at most 30 characters';

    // At least one letter or digit, so " -- " cannot become a category.
    if (!RegExp(r'[A-Za-z0-9\u0600-\u06FF]').hasMatch(text)) {
      return 'Name must contain letters or numbers';
    }
    return null;
  }
}

```

================================================================================
FILE: lib/reports/reports_screen.dart
================================================================================

```dart
// ===========================================================================
// reports_screen.dart  -  the statistics module (FR21 - FR25).
//
//    FR21 daily report    FR22 weekly report    FR23 monthly report
//    FR24 yearly report   FR25 current balance
//
// THE IDEA THAT KEEPS THIS SCREEN SHORT
// Those four reports are not four different screens. They are the SAME
// report over four different date ranges. So the screen holds two pieces of
// state - which period is selected, and which date we are looking at - turns
// them into one DateRange, and asks the providers for the totals of that
// range. Adding a fifth period later would be one more entry in the enum.
//
// AND WHY IT HAS NO LOADING CODE
// The providers already hold every expense and income, and they calculate
// totals, category groups and chart series from that list. Changing the
// period does not touch the database: it only changes which range is passed
// to them. That is the payoff of the provider architecture - the report is
// instant, and it updates itself when an expense is added anywhere else.
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/user.dart';
import '../providers/expense_provider.dart';
import '../providers/income_provider.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/date_ranges.dart';
import '../utils/category_style.dart';
import '../widgets/app_drawer.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/charts.dart';

// The four reports the specification asks for.
enum ReportPeriod { day, week, month, year }

class ReportsScreen extends StatefulWidget {
  // Needed only so this screen can show the same side menu as the others.
  final User user;

  const ReportsScreen({super.key, required this.user});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final ExpenseProvider expenseProvider = ExpenseProvider();
  final IncomeProvider incomeProvider = IncomeProvider();

  ReportPeriod period = ReportPeriod.month; // the most useful default
  DateTime anchor = DateTime.now(); // the day the range is built around

  @override
  void initState() {
    super.initState();
    // ensureLoaded, not load: coming from the dashboard the data is already
    // in memory, and reloading it would blink a spinner over a report that
    // could have been drawn immediately. If the providers are still empty -
    // this screen was opened first, or a hot reload skipped the dashboard's
    // initState - it loads them now, so the report is never blank because
    // nobody fetched anything.
    expenseProvider.ensureLoaded();
    incomeProvider.ensureLoaded();
  }

  // The range currently on screen. Written as a getter so it is impossible
  // for the title, the totals and the chart to disagree about it.
  DateRange get range {
    switch (period) {
      case ReportPeriod.day:
        return DateRange.day(anchor);
      case ReportPeriod.week:
        return DateRange.week(anchor);
      case ReportPeriod.month:
        return DateRange.month(anchor);
      case ReportPeriod.year:
        return DateRange.year(anchor);
    }
  }

  // -------------------------------------------------------------------------
  // MOVING THROUGH TIME
  // -------------------------------------------------------------------------
  // direction is -1 for the previous period, +1 for the next one. Each case
  // moves by its own unit, which is why one shared "add N days" would be
  // wrong: months are not all the same length.
  void shift(int direction) {
    setState(() {
      switch (period) {
        case ReportPeriod.day:
          anchor = DateTime(anchor.year, anchor.month, anchor.day + direction);
          break;
        case ReportPeriod.week:
          anchor = DateTime(
            anchor.year,
            anchor.month,
            anchor.day + (7 * direction),
          );
          break;
        case ReportPeriod.month:
        // Day 1 avoids the classic bug: moving from 31 March back one month
        // would ask for 31 February.
          anchor = DateTime(anchor.year, anchor.month + direction, 1);
          break;
        case ReportPeriod.year:
          anchor = DateTime(anchor.year + direction, 1, 1);
          break;
      }
    });
  }

  // There is no data in the future, so the "next" arrow stops at the period
  // that contains today.
  bool get canGoForward => range.end.isBefore(dateOnly(DateTime.now()));

  // Jump straight to any day; the report follows it.
  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: anchor,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      helpText: 'Show the report around',
    );
    if (picked == null || !mounted) return;
    setState(() => anchor = picked);
  }

  // -------------------------------------------------------------------------
  // THE CHART SERIES
  // -------------------------------------------------------------------------
  // What one bar means depends on the period:
  //   year          -> 12 bars, one per month
  //   month / week  -> one bar per day of the range
  //   day           -> the last 7 days, so a single day is not a lonely bar
  //                    with nothing to compare it to
  List<ChartValue> buildSeries() {
    const monthLetters = [
      'J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D',
    ];

    if (period == ReportPeriod.year) {
      final months = expenseProvider.monthlyTotals(anchor.year);
      final now = DateTime.now();
      return List.generate(12, (index) {
        return ChartValue(
          label: monthLetters[index],
          value: months[index],
          // The month we are inside gets the darker colour, so "now" is easy
          // to find in the chart.
          color: (anchor.year == now.year && index + 1 == now.month)
              ? kPrimaryColor
              : kExpenseColor,
        );
      });
    }

    // For a single day we widen the chart to the 7 days ending on it.
    final chartRange = period == ReportPeriod.day
        ? DateRange(
      DateTime(anchor.year, anchor.month, anchor.day - 6),
      dateOnly(anchor),
    )
        : range;

    // {'2026-08-03': 12500.0, ...}. Days with no expenses are absent from the
    // map and become zero below.
    final totals = expenseProvider.dailyTotals(chartRange);
    final today = dateOnly(DateTime.now());
    final values = <ChartValue>[];

    for (var i = 0; i < chartRange.days; i++) {
      final day = DateTime(
        chartRange.start.year,
        chartRange.start.month,
        chartRange.start.day + i,
      );

      // A week has 7 bars, so a short weekday name fits. A month has up to
      // 31, so only every fifth day is labelled - otherwise the numbers
      // overlap into an unreadable smudge.
      final String label;
      if (chartRange.days <= 7) {
        label = DateFormat('EEE').format(day); // Mon, Tue, ...
      } else if (day.day == 1 || day.day % 5 == 0) {
        label = day.day.toString();
      } else {
        label = '';
      }

      values.add(ChartValue(
        label: label,
        value: totals[toDbDate(day)] ?? 0.0,
        color: day == today ? kPrimaryColor : kExpenseColor,
      ));
    }

    return values;
  }

  // -------------------------------------------------------------------------
  // DRAWING
  // -------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        actions: [
          IconButton(
            icon: const Icon(Icons.event),
            tooltip: 'Jump to a date',
            onPressed: pickDate,
          ),
          const LogoutAction(),
        ],
      ),
      drawer: AppDrawer(user: widget.user),
      body: Column(
        children: [
          buildPeriodPicker(),
          buildRangeBar(),
          const Divider(height: 1),
          // Both providers feed this report, so we listen to both.
          Expanded(
            child: ListenableBuilder(
              listenable: Listenable.merge([expenseProvider, incomeProvider]),
              builder: (context, _) => buildBody(),
            ),
          ),
        ],
      ),
    );
  }

  // FR21 - FR24: the four reports, as four buttons.
  Widget buildPeriodPicker() {
    const labels = {
      ReportPeriod.day: 'Day',
      ReportPeriod.week: 'Week',
      ReportPeriod.month: 'Month',
      ReportPeriod.year: 'Year',
    };

    return Padding(
      padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 8),
      child: Row(
        children: ReportPeriod.values.map((value) {
          final selected = value == period;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: ChoiceChip(
                label: SizedBox(
                  width: double.infinity,
                  child: Text(labels[value]!, textAlign: TextAlign.center),
                ),
                selected: selected,
                onSelected: (_) => setState(() => period = value),
                showCheckmark: false,
                selectedColor: kPrimaryColor,
                labelStyle: TextStyle(
                  color: selected ? Colors.white : Colors.black87,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // "< August 2026 >"
  Widget buildRangeBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            tooltip: 'Previous',
            onPressed: () => shift(-1),
          ),
          Expanded(
            child: Text(
              range.label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            tooltip: 'Next',
            // A null onPressed is what greys a button out in Flutter.
            onPressed: canGoForward ? () => shift(1) : null,
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    if (expenseProvider.isLoading || incomeProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final error = expenseProvider.errorMessage ?? incomeProvider.errorMessage;
    if (error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                error,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    expenseProvider.loadExpenses();
                    incomeProvider.loadIncomes();
                  },
                  child: const Text('Try again'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final current = range;

    // Everything below is read straight from the providers - no query, no
    // await, no local copy that could go stale.
    final income = incomeProvider.totalIn(current); // FR21-24, income side
    final expenses = expenseProvider.totalIn(current); // FR21-24, expense side
    final balance = income - expenses;
    final allTimeBalance = incomeProvider.total - expenseProvider.total; // FR25
    final byCategory = expenseProvider.byCategory(range: current);

    return RefreshIndicator(
      onRefresh: () async {
        await Future.wait([
          expenseProvider.loadExpenses(),
          incomeProvider.loadIncomes(),
        ]);
      },
      child: ListView(
        padding: const EdgeInsets.all(kPadding),
        children: [
          // ---- The two totals of the selected range ----
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: DashboardCard(
                  title: 'Income',
                  value: formatAmount(income),
                  color: kIncomeColor,
                  icon: Icons.south_west,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DashboardCard(
                  title: 'Expenses',
                  value: formatAmount(expenses),
                  color: kExpenseColor,
                  icon: Icons.north_east,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          DashboardCard(
            title: 'Result for ${current.label}',
            value: formatAmount(balance),
            subtitle: balance >= 0 ? 'You saved money' : 'You overspent',
            color: balance >= 0 ? kIncomeColor : kExpenseColor,
            icon: Icons.calculate,
          ),
          const SizedBox(height: 12),

          // ---- FR25: the balance of the whole account, always visible ----
          // Kept apart from the range totals on purpose: it answers "how much
          // do I have?", not "how did this month go?".
          DashboardCard(
            title: 'Current balance (all time)',
            value: formatAmount(allTimeBalance),
            subtitle: 'Total income minus total expenses',
            color: kPrimaryColor,
            icon: Icons.account_balance_wallet,
          ),
          const SizedBox(height: kPadding),

          // ---- The bar chart ----
          _panel(
            title: chartTitle,
            child: Builder(builder: (context) {
              final series = buildSeries();
              return SimpleBarChart(
                values: series,
                // With few bars there is room to print the number on top.
                showValues: series.length <= 12,
              );
            }),
          ),
          const SizedBox(height: kPadding),

          // ---- The donut: expenses per category ----
          _panel(
            title: 'Spending by category',
            child: buildCategorySection(byCategory, expenses),
          ),
        ],
      ),
    );
  }

  String get chartTitle {
    switch (period) {
      case ReportPeriod.day:
        return 'Expenses over the last 7 days';
      case ReportPeriod.week:
        return 'Expenses per day this week';
      case ReportPeriod.month:
        return 'Expenses per day this month';
      case ReportPeriod.year:
        return 'Expenses per month in ${anchor.year}';
    }
  }

  Widget buildCategorySection(List<CategoryTotal> totals, double grandTotal) {
    if (totals.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          'No expenses in this period.',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    // Turn the provider's rows into what the chart understands. The chart
    // knows nothing about categories - it wants a label, a number, a colour.
    final slices = totals
        .map((item) => ChartValue(
      label: item.name,
      value: item.total,
      color: categoryColor(item.color),
    ))
        .toList();

    return Column(
      children: [
        Center(
          child: DonutChart(
            values: slices,
            centerTitle: 'Total spent',
            centerValue: formatAmount(grandTotal),
          ),
        ),
        const SizedBox(height: kPadding),
        ChartLegend(values: slices, formatValue: formatAmount),
        const SizedBox(height: 8),
        const Divider(),

        // The same numbers as a list, with each category's icon. The chart
        // shows the shape; this shows the detail.
        ...totals.map((item) {
          final color = categoryColor(item.color);
          return ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: CircleAvatar(
              radius: 18,
              backgroundColor: color.withValues(alpha: 0.15),
              child: Icon(categoryIcon(item.icon), color: color, size: 18),
            ),
            title: Text(item.name),
            trailing: Text(
              formatAmount(item.total),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }),
      ],
    );
  }

  // A white rounded box with a heading, reused by both chart sections.
  Widget _panel({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kRadius),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: kPadding),
          child,
        ],
      ),
    );
  }
}
```

================================================================================
FILE: lib/screens/change_password_screen.dart
================================================================================

```dart
// ===========================================================================
// change_password_screen.dart  -  FR3: change the password of the logged-in
// user.
//
// Three fields: current password, new password, confirm new password.
// The current password is checked against the database FIRST, so somebody who
// picks up an unlocked phone cannot silently take over the account.
//
// When it succeeds we pop and return the updated User, so the screen that
// opened us can keep its copy of the user in sync.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../utils/constants.dart';
import '../utils/validators.dart';
import '../database/database_helper.dart';

class ChangePasswordScreen extends StatefulWidget {
  // The user whose password we are changing. Passed in from the drawer.
  final User user;

  const ChangePasswordScreen({super.key, required this.user});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final currentController = TextEditingController();
  final newController = TextEditingController();
  final confirmController = TextEditingController();

  bool hidePasswords = true;
  bool isLoading = false;

  @override
  void dispose() {
    currentController.dispose();
    newController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  void _showMessage(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? kExpenseColor : kIncomeColor,
      ),
    );
  }

  Future<void> save() async {
    if (!_formKey.currentState!.validate()) return;

    // A user id is required to update the row. It can only be null for a User
    // object that was never saved, which cannot happen after a real login,
    // but we check instead of using ! and risking a crash.
    final userId = widget.user.id;
    if (userId == null) {
      _showMessage('Session problem. Please log in again.');
      return;
    }

    final currentPassword = currentController.text;
    final newPassword = newController.text;

    setState(() => isLoading = true);

    try {
      // STEP 1: is the CURRENT password really correct?
      final ok = await DatabaseHelper().verifyPassword(userId, currentPassword);
      if (!mounted) return;

      if (!ok) {
        _showMessage('Your current password is not correct');
        return;
      }

      // STEP 2: write the new one. updatePassword returns the number of rows
      // it changed; 0 would mean the account no longer exists.
      final changed = await DatabaseHelper().updatePassword(
        userId,
        newPassword,
      );
      if (!mounted) return;

      if (changed == 0) {
        _showMessage('Account not found. Please log in again.');
        return;
      }

      // STEP 3: hand the refreshed user back to the screen that opened us,
      // so its copy does not keep the old password.
      final updatedUser = widget.user.copyWith(password: newPassword);
      Navigator.pop(context, updatedUser);
    } catch (e) {
      if (!mounted) return;
      _showMessage('Could not change the password. Please try again.');
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Password')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(kPadding),
          children: [
            // A short explanation card, so the screen is self-explaining.
            Container(
              padding: const EdgeInsets.all(kPadding),
              decoration: BoxDecoration(
                color: kAccentColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(kRadius),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: kPrimaryColor),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Signed in as ${widget.user.username}. '
                      'Enter your current password to set a new one.',
                      style: const TextStyle(color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ---- CURRENT PASSWORD ----
            TextFormField(
              controller: currentController,
              enabled: !isLoading,
              obscureText: hidePasswords,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Current password',
                prefixIcon: const Icon(Icons.lock_clock),
                suffixIcon: IconButton(
                  icon: Icon(
                    hidePasswords ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () =>
                      setState(() => hidePasswords = !hidePasswords),
                ),
              ),
              // Only "not empty" here: the old password follows the old rules.
              validator: Validators.loginPassword,
            ),

            const SizedBox(height: 16),

            // ---- NEW PASSWORD ----
            TextFormField(
              controller: newController,
              enabled: !isLoading,
              obscureText: hidePasswords,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'New password',
                prefixIcon: Icon(Icons.lock),
                helperText: 'At least 6 characters, letters + numbers',
              ),
              validator: (value) {
                // First the normal strength rules...
                final strengthError = Validators.password(value);
                if (strengthError != null) return strengthError;
                // ...then one extra rule that only makes sense here.
                if (value == currentController.text) {
                  return 'The new password must be different';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // ---- CONFIRM NEW PASSWORD ----
            TextFormField(
              controller: confirmController,
              enabled: !isLoading,
              obscureText: hidePasswords,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => isLoading ? null : save(),
              decoration: const InputDecoration(
                labelText: 'Confirm new password',
                prefixIcon: Icon(Icons.lock_outline),
              ),
              validator: (value) =>
                  Validators.confirmPassword(value, newController.text),
            ),

            const SizedBox(height: 28),

            ElevatedButton(
              onPressed: isLoading ? null : save,
              child: isLoading
                  ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'SAVE NEW PASSWORD',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

```

================================================================================
FILE: lib/screens/dashboard_screen.dart
================================================================================

```dart
// ===========================================================================
// dashboard_screen.dart  -  the main screen after logging in.
//
// The specification asks this screen for five things:
//    - the current balance          (FR25)
//    - the total income
//    - the total expenses
//    - the biggest spending category
//    - the last 5 operations
//
// NOT ONE OF THEM IS A DATABASE QUERY HERE.
// ExpenseProvider and IncomeProvider already hold the two lists, and they
// calculate these numbers from what is in memory. This screen listens to both
// providers and draws whatever they currently say. Add an expense anywhere in
// the app and this screen has already updated by the time you come back - not
// because it reloaded, but because the provider told it to redraw.
//
// It is a StatefulWidget for two reasons: it must subscribe to the providers
// once, and the User can be replaced while the screen is open (after a
// password change).
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/expense.dart';
import '../models/income.dart';
import '../providers/expense_provider.dart';
import '../providers/income_provider.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/category_style.dart';
import '../widgets/app_drawer.dart';
import '../widgets/dashboard_card.dart';
import '../expenses/expenses_list_screen.dart';
import '../expenses/add_expense_screen.dart';
import '../incomes/incomes_screen.dart';
import '../reports/reports_screen.dart';

class DashboardScreen extends StatefulWidget {
  // Receives the user sent from the login screen.
  final User user;

  const DashboardScreen({super.key, required this.user});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ExpenseProvider expenseProvider = ExpenseProvider();
  final IncomeProvider incomeProvider = IncomeProvider();

  // A copy we are allowed to replace. widget.user itself is final.
  late User currentUser = widget.user;

  @override
  void initState() {
    super.initState();

    // The first screen after login: it fills both providers, so every other
    // screen opens with its data already there. Safe from initState - the
    // providers defer their first notification to a microtask.
    expenseProvider.loadExpenses();
    incomeProvider.loadIncomes();
  }

  Future<void> reloadAll() async {
    // Future.wait runs both loads together instead of one after the other.
    await Future.wait([
      expenseProvider.loadExpenses(),
      incomeProvider.loadIncomes(),
    ]);
  }

  void openScreen(Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  // The five newest operations of both kinds, mixed and sorted.
  //
  // The two providers hold two different types, so the merged list is typed
  // as Object and every row asks "is this an Expense or an Income?". That is
  // simpler than inventing a third model class for a list of five rows, and
  // Dart checks the types for us.
  List<Object> recentOperations() {
    final items = <Object>[
      // Each list is already newest-first, so five from each side is more
      // than enough to find the five newest overall.
      ...expenseProvider.recent(5),
      ...incomeProvider.recent(5),
    ];

    items.sort((a, b) => dateOf(b).compareTo(dateOf(a))); // newest first
    return items.take(5).toList();
  }

  DateTime dateOf(Object item) {
    return item is Expense ? item.expenseDate : (item as Income).incomeDate;
  }

  // -------------------------------------------------------------------------
  // DRAWING
  // -------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            tooltip: 'Reports',
            onPressed: () => openScreen(ReportsScreen(user: currentUser)),
          ),
          const LogoutAction(),
        ],
      ),

      // The side menu with links to all modules. When the change-password
      // screen returns a new User, we store it and redraw.
      drawer: AppDrawer(
        user: currentUser,
        onUserChanged: (updated) => setState(() => currentUser = updated),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => openScreen(const AddExpenseScreen()),
        backgroundColor: kExpenseColor,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Add expense'),
      ),

      // This screen depends on TWO providers. Listenable.merge makes one
      // listenable out of both, so the body is rebuilt when either of them
      // changes.
      body: ListenableBuilder(
        listenable: Listenable.merge([expenseProvider, incomeProvider]),
        builder: (context, _) => buildBody(),
      ),
    );
  }

  Widget buildBody() {
    // Either list still loading -> one spinner for the whole screen. Showing
    // half the numbers while the other half is missing would be worse than
    // showing none.
    if (expenseProvider.isLoading || incomeProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final error = expenseProvider.errorMessage ?? incomeProvider.errorMessage;
    if (error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                error,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: reloadAll,
                  child: const Text('Try again'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final totalIncome = incomeProvider.total;
    final totalExpenses = expenseProvider.total;
    final balance = totalIncome - totalExpenses; // FR25

    // RefreshIndicator = pull down to reload. It needs a scrolling child, and
    // ListView gives us that plus scrolling on small screens for free.
    return RefreshIndicator(
      onRefresh: reloadAll,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 90),
        children: [
          Text(
            'Welcome, ${currentUser.displayName}',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Here is where your money stands.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: kPadding),

          // ---- FR25: the current balance ----
          // The colour carries the meaning: green while there is money left,
          // red once expenses passed income.
          DashboardCard(
            title: 'Current balance',
            value: formatAmount(balance),
            subtitle: balance >= 0
                ? 'Income minus expenses'
                : 'You have spent more than you earned',
            color: balance >= 0 ? kIncomeColor : kExpenseColor,
            icon: Icons.account_balance_wallet,
            large: true,
          ),
          const SizedBox(height: kPadding),

          // ---- Total in / total out, side by side ----
          // Each Expanded takes half of the row, so the two cards stay equal
          // whatever the screen width.
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: DashboardCard(
                  title: 'Total income',
                  value: formatAmount(totalIncome),
                  color: kIncomeColor,
                  icon: Icons.south_west,
                  onTap: () => openScreen(IncomesScreen(user: currentUser)),
                ),
              ),
              const SizedBox(width: kPadding),
              Expanded(
                child: DashboardCard(
                  title: 'Total expenses',
                  value: formatAmount(totalExpenses),
                  color: kExpenseColor,
                  icon: Icons.north_east,
                  onTap: () =>
                      openScreen(ExpensesListScreen(user: currentUser)),
                ),
              ),
            ],
          ),
          const SizedBox(height: kPadding),

          buildTopCategory(totalExpenses),
          const SizedBox(height: kPadding),
          buildRecentSection(),
        ],
      ),
    );
  }

  // "Where most of your money goes": the top category, with a bar showing how
  // big its share of the total is. The grouping is done by the provider.
  Widget buildTopCategory(double totalExpenses) {
    final top = expenseProvider.topCategory();

    if (top == null) {
      return _panel(
        child: const Row(
          children: [
            Icon(Icons.pie_chart_outline, color: Colors.grey),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'No expenses yet, so there is nothing to rank.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      );
    }

    final color = categoryColor(top.color);
    final share = top.shareOf(totalExpenses);

    return _panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top spending category',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withValues(alpha: 0.15),
                child: Icon(categoryIcon(top.icon), color: color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      top.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // A share of ALL expenses, so it is always 0 - 100%.
                    Text(
                      '${(share * 100).toStringAsFixed(0)}% of everything you spent',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Text(
                formatAmount(top.total),
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // A one-line bar chart: the filled part is the category's share.
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: share,
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }

  // The five newest operations, expenses and incomes together.
  Widget buildRecentSection() {
    final recent = recentOperations();

    return _panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Recent activity',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () =>
                    openScreen(ExpensesListScreen(user: currentUser)),
                child: const Text('See all'),
              ),
            ],
          ),

          if (recent.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Add your first expense or income to start tracking.',
                style: TextStyle(color: Colors.grey),
              ),
            )
          else
          // At most five rows, and already inside a ListView, so we build the
          // rows directly instead of nesting a second scrolling list (which
          // would fight the outer one for the user's finger).
            ...recent.map(buildOperationRow),
        ],
      ),
    );
  }

  Widget buildOperationRow(Object item) {
    // Expenses take money out, incomes bring it in. One check decides the
    // colour, the icon, the sign and the subtitle, so they cannot disagree.
    final isExpense = item is Expense;

    final String title;
    final double amount;
    final DateTime date;
    final Color color;
    final IconData icon;
    final String subtitle;

    if (item is Expense) {
      title = item.title;
      amount = item.amount;
      date = item.expenseDate;
      color = categoryColor(item.categoryColor);
      icon = categoryIcon(item.categoryIcon);
      subtitle = '${item.categoryName ?? 'Uncategorized'}  -  ${formatDate(date)}';
    } else {
      final income = item as Income;
      title = income.title;
      amount = income.amount;
      date = income.incomeDate;
      color = kIncomeColor;
      icon = Icons.savings;
      subtitle = 'Income  -  ${formatDate(date)}';
    }

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: color.withValues(alpha: 0.15),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(
        // A row with an empty title should still be readable.
        title.trim().isEmpty ? '(no title)' : title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      trailing: Text(
        '${isExpense ? '-' : '+'}${formatAmount(amount)}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isExpense ? kExpenseColor : kIncomeColor,
        ),
      ),
    );
  }

  // A white rounded box. Used by the two sections above so they share the
  // same padding, radius and border without repeating the decoration.
  Widget _panel({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kRadius),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: child,
    );
  }
}
```

================================================================================
FILE: lib/screens/login_screen.dart
================================================================================

```dart
// ===========================================================================
// login_screen.dart  -  the first screen the user sees.
//
// FR1 (login) and the entry point to FR2 (register).
// The layout is unchanged; what is new is:
//   - a Form + TextFormField, so every field validates itself
//   - a loading state, so the button cannot be pressed twice
//   - pushReplacement, so the back button cannot return to the login screen
// ===========================================================================

import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/validators.dart';
import '../database/database_helper.dart';
import 'dashboard_screen.dart';
import 'register_screen.dart';

// StatefulWidget = a screen that CAN change while open.
// We need it because the password field can be hidden or shown.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // A Form needs a "key" so we can reach it from code and ask:
  //     _formKey.currentState!.validate()
  // That one call runs the validator of EVERY field inside the form and
  // returns true only if all of them returned null.
  final _formKey = GlobalKey<FormState>();

  // Controllers let us READ what the user typed.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true; // true = show dots instead of letters
  bool isLoading = false; // true while we are talking to the database

  // Runs when the screen is destroyed. Frees the controllers' memory.
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Small helper so every screen shows messages the same way.
  void _showMessage(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? kExpenseColor : kIncomeColor,
      ),
    );
  }

  // Runs when the LOGIN button is pressed.
  Future<void> login() async {
    // STEP 1: check the form. If a field is invalid, the message appears
    // under it and we stop here - the database is never touched.
    if (!_formKey.currentState!.validate()) return;

    // STEP 2: clean the input. Nobody should fail to log in because of a
    // space they did not notice at the end of their username.
    final username = Validators.sanitize(usernameController.text);
    final password = passwordController.text;

    setState(() => isLoading = true); // show the spinner

    try {
      // STEP 3: ask the database if this username + password exist.
      // The first call also opens the DB and seeds the demo accounts.
      final user = await DatabaseHelper().login(username, password);

      // After an await the user may have left the screen. Touching context
      // then would crash, so we check mounted first.
      if (!mounted) return;

      if (user == null) {
        // No match -> wrong login. One generic message for both cases: never
        // reveal whether it was the username or the password that was wrong.
        _showMessage('Wrong username or password');
      } else {
        // Match -> go to the dashboard, carrying the whole User with us
        // (we need the id later, for example to change the password).
        // pushReplacement REPLACES the login screen instead of stacking on
        // top of it, so pressing back cannot come back here.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen(user: user)),
        );
      }
    } catch (e) {
      // Any unexpected database problem ends up here instead of a red screen.
      if (!mounted) return;
      _showMessage('Could not reach the database. Please try again.');
    } finally {
      // finally always runs (success OR error), so the spinner never sticks.
      if (mounted) setState(() => isLoading = false);
    }
  }

  // Opens the register screen and waits for it to close.
  // If it returns a username (the account was created), we type it in for the
  // user so they only have to enter their password.
  Future<void> openRegister() async {
    final createdUsername = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );

    if (!mounted || createdUsername == null) return;

    setState(() {
      usernameController.text = createdUsername;
      passwordController.clear();
    });
    _showMessage('Account created. You can log in now.', isError: false);
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold = basic page: app bar on top, body below.
    return Scaffold(
      // -------- APP BAR (app name + logo) --------
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.account_balance_wallet), // the logo
            SizedBox(width: 8),
            Text(kAppName),
          ],
        ),
      ),

      // -------- BODY --------
      body: Container(
        // Gradient background: dark blue on top, light blue at the bottom.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPrimaryColor, kAccentColor],
          ),
        ),

        // Form wraps every field so one validate() call checks them all.
        child: Form(
          key: _formKey,
          // ListView = vertical list that scrolls when the keyboard appears.
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const SizedBox(height: 30),

              // -------- BIG ROUND LOGO --------
              const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.account_balance_wallet,
                  size: 50,
                  color: kPrimaryColor,
                ),
              ),

              const SizedBox(height: 20),

              // -------- WELCOME TEXT --------
              const Text(
                'Welcome Back',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Sign in to continue',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),

              const SizedBox(height: 30),

              // -------- WHITE CARD WITH THE FIELDS --------
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kRadius),
                ),
                child: Column(
                  children: [
                    // ---- USERNAME FIELD ----
                    TextFormField(
                      controller: usernameController,
                      enabled: !isLoading, // frozen while logging in
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: Validators.username,
                    ),

                    const SizedBox(height: 16),

                    // ---- PASSWORD FIELD ----
                    TextFormField(
                      controller: passwordController,
                      enabled: !isLoading,
                      obscureText: hidePassword, // true = dots
                      textInputAction: TextInputAction.done,
                      // Pressing "done" on the keyboard logs in as well.
                      onFieldSubmitted: (_) => isLoading ? null : login(),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        // The eye button on the right.
                        suffixIcon: IconButton(
                          icon: Icon(
                            hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            // setState() = "redraw the screen, something changed".
                            setState(() => hidePassword = !hidePassword);
                          },
                        ),
                      ),
                      // On login we only require "not empty": an existing
                      // account may have an old, weaker password.
                      validator: Validators.loginPassword,
                    ),

                    const SizedBox(height: 24),

                    // ---- LOGIN BUTTON ----
                    // While loading, onPressed is null -> Flutter greys the
                    // button out and a second tap is impossible.
                    ElevatedButton(
                      onPressed: isLoading ? null : login,
                      child: isLoading
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),

                    const SizedBox(height: 8),

                    // ---- LINK TO REGISTER ----
                    TextButton(
                      onPressed: isLoading ? null : openRegister,
                      child: const Text("Don't have an account? Register"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

```

================================================================================
FILE: lib/screens/register_screen.dart
================================================================================

```dart
// ===========================================================================
// register_screen.dart  -  sign-up screen (FR2).
//
// Creates a new row in the users table through DatabaseHelper.addUser().
// When the account is created we close the screen and hand the username back
// to the login screen:  Navigator.pop(context, username).
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' show DatabaseException;

import '../utils/constants.dart';
import '../utils/validators.dart';
import '../database/database_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool hidePassword = true;
  bool isLoading = false;

  @override
  void dispose() {
    // Every controller we create must be disposed, or its memory leaks.
    fullNameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  void _showMessage(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? kExpenseColor : kIncomeColor,
      ),
    );
  }

  Future<void> register() async {
    // STEP 1: the instant rules (empty, length, characters, passwords match).
    if (!_formKey.currentState!.validate()) return;

    // STEP 2: clean the text before it reaches the database.
    final fullName = Validators.sanitize(fullNameController.text);
    final username = Validators.sanitize(usernameController.text);
    final password = passwordController.text;

    setState(() => isLoading = true);

    try {
      // STEP 3: the rule that needs the database - is the name taken?
      // We ask first so the user gets a clear message on the right field.
      final taken = await DatabaseHelper().usernameExists(username);
      if (!mounted) return;

      if (taken) {
        _showMessage('This username is already taken');
        return; // finally below still turns the spinner off
      }

      // STEP 4: insert. If two people registered the same name at the same
      // moment, the UNIQUE column still stops the second one - that is the
      // DatabaseException we catch below.
      await DatabaseHelper().addUser(username, password, fullName);
      if (!mounted) return;

      // STEP 5: close this screen and give the username back to login.
      Navigator.pop(context, username);
    } on DatabaseException catch (e) {
      if (!mounted) return;
      // isUniqueConstraintError() tells us the failure was a duplicate
      // username and not some other database problem.
      if (e.isUniqueConstraintError()) {
        _showMessage('This username is already taken');
      } else {
        _showMessage('Could not create the account. Please try again.');
      }
    } catch (e) {
      if (!mounted) return;
      _showMessage('Could not create the account. Please try again.');
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),

      // Same gradient as the login screen so the two feel like one flow.
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPrimaryColor, kAccentColor],
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const SizedBox(height: 10),

              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(Icons.person_add, size: 42, color: kPrimaryColor),
              ),

              const SizedBox(height: 16),

              const Text(
                'Join us',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Create an account to track your money',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),

              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kRadius),
                ),
                child: Column(
                  children: [
                    // ---- FULL NAME ----
                    TextFormField(
                      controller: fullNameController,
                      enabled: !isLoading,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Full name',
                        prefixIcon: Icon(Icons.badge),
                      ),
                      validator: Validators.fullName,
                    ),

                    const SizedBox(height: 16),

                    // ---- USERNAME ----
                    TextFormField(
                      controller: usernameController,
                      enabled: !isLoading,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        helperText: 'Letters, numbers and _ only',
                      ),
                      validator: Validators.username,
                    ),

                    const SizedBox(height: 16),

                    // ---- PASSWORD ----
                    TextFormField(
                      controller: passwordController,
                      enabled: !isLoading,
                      obscureText: hidePassword,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        helperText: 'At least 6 characters, letters + numbers',
                        suffixIcon: IconButton(
                          icon: Icon(
                            hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () =>
                              setState(() => hidePassword = !hidePassword),
                        ),
                      ),
                      validator: Validators.password,
                    ),

                    const SizedBox(height: 16),

                    // ---- CONFIRM PASSWORD ----
                    TextFormField(
                      controller: confirmController,
                      enabled: !isLoading,
                      obscureText: hidePassword,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => isLoading ? null : register(),
                      decoration: const InputDecoration(
                        labelText: 'Confirm password',
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                      // This rule needs a second value, so we wrap it in a
                      // small function that also passes the first password.
                      validator: (value) => Validators.confirmPassword(
                        value,
                        passwordController.text,
                      ),
                    ),

                    const SizedBox(height: 24),

                    ElevatedButton(
                      onPressed: isLoading ? null : register,
                      child: isLoading
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'CREATE ACCOUNT',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),

                    const SizedBox(height: 8),

                    // Back to login. pop() removes this screen from the stack.
                    TextButton(
                      onPressed: isLoading
                          ? null
                          : () => Navigator.pop(context),
                      child: const Text('Already have an account? Login'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

```

================================================================================
FILE: lib/widgets/app_drawer.dart
================================================================================

```dart
// ===========================================================================
// app_drawer.dart  -  the side menu (Drawer) required by the specification:
// "a side menu containing links to every module of the system".
//
// It lives in widgets/ because EVERY main screen shows the same menu. Writing
// it once here means adding a new link later changes one file, not ten.
//
// It needs to know who is logged in (for the header and for the change
// password screen), and it reports back through onUserChanged when that user
// object changes, so the screen holding it stays in sync.
//
// The file also holds the two logout pieces, because the specification asks
// for logout in TWO places - in the side menu and in the app bar of every
// screen:
//     confirmLogout()   the question + the actual sign out
//     LogoutAction      the app bar icon that calls it
// Keeping them here means the confirmation can never differ between the two.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../utils/constants.dart';
import '../screens/login_screen.dart';
import '../screens/change_password_screen.dart';
import '../expenses/expenses_list_screen.dart';
import '../expenses/search_expenses_screen.dart';
import '../incomes/incomes_screen.dart';
import '../categories/categories_screen.dart';
import '../reports/reports_screen.dart';

// ---------------------------------------------------------------------------
// FR4: end the session. A top-level function rather than a method, so both
// the menu tile and the app bar icon of every screen call the same code.
//
// We ask for confirmation first: logging out by an accidental tap costs the
// user their password again for nothing.
// ---------------------------------------------------------------------------
Future<void> confirmLogout(BuildContext context) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('Log out'),
      content: const Text('Do you want to end your session?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext, false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(dialogContext, true),
          child: const Text('Log out'),
        ),
      ],
    ),
  );

  // showDialog returns null if the user tapped outside the dialog.
  if (confirmed != true) return;
  if (!context.mounted) return;

  // pushAndRemoveUntil throws away EVERY screen behind us, so the back button
  // cannot walk back into the logged-in part of the app.
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false, // remove everything
  );
}

// The app bar icon required on every screen by the shared-design section of
// the specification. As a widget it costs one line per screen:
//     actions: const [LogoutAction()]
class LogoutAction extends StatelessWidget {
  const LogoutAction({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.logout),
      tooltip: 'Logout',
      onPressed: () => confirmLogout(context),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final User user;

  // Called when the user object was replaced (after a password change).
  // Optional: a screen that does not care can simply not pass it.
  final ValueChanged<User>? onUserChanged;

  const AppDrawer({super.key, required this.user, this.onUserChanged});

  // ---------------------------------------------------------------------
  // Small helper: close the drawer, then open a screen.
  // Closing first matters - otherwise the menu stays open underneath and is
  // still there when the user comes back.
  // ---------------------------------------------------------------------
  Future<T?> _openScreen<T>(BuildContext context, Widget screen) {
    // We grab the navigator BEFORE closing the drawer. After pop() this
    // widget is being removed, and reading Navigator.of(context) from a
    // widget that is going away can throw.
    final navigator = Navigator.of(context);
    navigator.pop(); // close the drawer
    return navigator.push<T>(MaterialPageRoute(builder: (_) => screen));
  }

  // First letter of the name, used as a simple avatar. Never crashes on an
  // empty string.
  String _initial(String name) {
    return name.isEmpty ? '?' : name.substring(0, 1).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // remove the default top gap
        children: [
          // -------- HEADER: who is logged in --------
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: kPrimaryColor),
            accountName: Text(
              user.displayName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text('@${user.username}'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                _initial(user.displayName),
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // -------- DASHBOARD --------
          ListTile(
            leading: const Icon(Icons.dashboard, color: kPrimaryColor),
            title: const Text('Dashboard'),
            onTap: () {
              final navigator = Navigator.of(context);
              navigator.pop(); // close the drawer
              // The dashboard is the first route after login, so popping back
              // to it works from any module screen.
              navigator.popUntil((route) => route.isFirst);
            },
          ),

          const Divider(height: 1),

          // -------- MODULE SCREENS --------
          ListTile(
            leading: const Icon(Icons.receipt_long, color: kExpenseColor),
            title: const Text('Expenses'),
            onTap: () => _openScreen(context, ExpensesListScreen(user: user)),
          ),
          ListTile(
            leading: const Icon(Icons.savings, color: kIncomeColor),
            title: const Text('Incomes'),
            onTap: () => _openScreen(context, IncomesScreen(user: user)),
          ),
          ListTile(
            leading: const Icon(Icons.category, color: kAccentColor),
            title: const Text('Categories'),
            onTap: () => _openScreen(context, CategoriesScreen(user: user)),
          ),

          // FR16 - FR20
          ListTile(
            leading: const Icon(Icons.search, color: kPrimaryColor),
            title: const Text('Search'),
            onTap: () => _openScreen(context, SearchExpensesScreen(user: user)),
          ),

          // FR21 - FR25
          ListTile(
            leading: const Icon(Icons.bar_chart, color: kAccentColor),
            title: const Text('Reports'),
            onTap: () => _openScreen(context, ReportsScreen(user: user)),
          ),

          const Divider(height: 1),

          // -------- ACCOUNT --------
          ListTile(
            leading: const Icon(Icons.password, color: kPrimaryColor),
            title: const Text('Change Password'),
            onTap: () async {
              // The screen returns the updated User when it succeeds.
              final updated = await _openScreen<User>(
                context,
                ChangePasswordScreen(user: user),
              );
              if (updated != null) onUserChanged?.call(updated);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: kExpenseColor),
            title: const Text('Logout'),
            onTap: () => confirmLogout(context),
          ),
        ],
      ),
    );
  }
}
```

================================================================================
FILE: lib/widgets/category_form_sheet.dart
================================================================================

```dart
// ===========================================================================
// category_form_sheet.dart  -  the "Add category" / "Edit category" form.
//
// A category has only three values (name, icon, colour), so a whole screen
// would be heavy. It is shown as a modal bottom sheet instead: it slides up
// over the list, and the list stays visible behind it.
//
// Like the expense and income forms, ONE form serves both add and edit; the
// screen decides what saving means by passing onSave.
//
// onSave returns String? :
//    null      -> saved, close the sheet
//    a message -> refused (for example "This category already exists"), show
//                 the message inside the sheet and keep it open
// Returning the error instead of throwing keeps the "already exists" rule in
// the screen (where the database lives) while the message appears right under
// the field the user must fix.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/category.dart';
import '../utils/constants.dart';
import '../utils/validators.dart';
import '../utils/category_style.dart';

// The public entry point. The screen just calls:
//     await showCategoryFormSheet(context, onSave: ...);
Future<void> showCategoryFormSheet(
  BuildContext context, {
  Category? initial,
  required Future<String?> Function(Category category) onSave,
}) {
  return showModalBottomSheet<void>(
    context: context,
    // isScrollControlled lets the sheet grow taller than half the screen,
    // which it needs when the keyboard is open.
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(kRadius)),
    ),
    builder: (_) => _CategoryFormSheet(initial: initial, onSave: onSave),
  );
}

class _CategoryFormSheet extends StatefulWidget {
  final Category? initial;
  final Future<String?> Function(Category category) onSave;

  const _CategoryFormSheet({this.initial, required this.onSave});

  @override
  State<_CategoryFormSheet> createState() => _CategoryFormSheetState();
}

class _CategoryFormSheetState extends State<_CategoryFormSheet> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late String selectedIcon;
  late String selectedColor;

  bool isSaving = false;
  String? errorMessage; // the message onSave sent back, if any

  @override
  void initState() {
    super.initState();
    final initial = widget.initial;

    nameController = TextEditingController(text: initial?.name ?? '');
    selectedIcon = initial?.icon ?? kCategoryIconKeys.first;
    selectedColor = initial?.color ?? kCategoryColorOptions.first;
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<void> save() async {
    if (!_formKey.currentState!.validate()) return;

    final category = Category(
      id: widget.initial?.id, // null when adding, real id when editing
      name: Validators.sanitize(nameController.text),
      icon: selectedIcon,
      color: selectedColor,
    );

    setState(() {
      isSaving = true;
      errorMessage = null;
    });

    try {
      final problem = await widget.onSave(category);
      if (!mounted) return;

      if (problem != null) {
        // Refused: keep the sheet open and explain why.
        setState(() {
          errorMessage = problem;
          isSaving = false;
        });
        return;
      }

      Navigator.pop(context); // saved
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Could not save. Please try again.';
        isSaving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.initial != null;
    final previewColor = categoryColor(selectedColor);

    return Padding(
      // viewInsets.bottom is the height of the keyboard. Adding it as padding
      // lifts the sheet so the Save button is never hidden behind the keys.
      padding: EdgeInsets.only(
        left: kPadding,
        right: kPadding,
        top: kPadding,
        bottom: MediaQuery.of(context).viewInsets.bottom + kPadding,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min, // only as tall as its content
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- TITLE + LIVE PREVIEW ----
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: previewColor.withValues(alpha: 0.15),
                  child: Icon(categoryIcon(selectedIcon), color: previewColor),
                ),
                const SizedBox(width: 12),
                Text(
                  isEditing ? 'Edit category' : 'New category',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ---- NAME (FR14 edits exactly this) ----
            TextFormField(
              controller: nameController,
              enabled: !isSaving,
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.label),
                hintText: 'Food, Transport, Bills...',
              ),
              validator: Validators.categoryName,
              // Typing again clears an old "already exists" message, so a
              // stale error never sits under a field the user just fixed.
              onChanged: (_) {
                if (errorMessage != null) setState(() => errorMessage = null);
              },
            ),

            if (errorMessage != null) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.error_outline,
                      color: kExpenseColor, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(color: kExpenseColor),
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 20),

            const Text('Icon', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),

            // ---- ICON CHOICES ----
            // Wrap lays the choices out in rows and moves to the next line
            // automatically, whatever the screen width is.
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: kCategoryIconKeys.map((key) {
                final isSelected = key == selectedIcon;
                return InkWell(
                  onTap: isSaving
                      ? null
                      : () => setState(() => selectedIcon = key),
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? previewColor.withValues(alpha: 0.15)
                          : Colors.grey.withValues(alpha: 0.12),
                      border: Border.all(
                        color: isSelected ? previewColor : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      categoryIcon(key),
                      color: isSelected ? previewColor : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            const Text('Colour', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),

            // ---- COLOUR CHOICES ----
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: kCategoryColorOptions.map((hex) {
                final isSelected = hex == selectedColor;
                final color = categoryColor(hex);
                return InkWell(
                  onTap: isSaving
                      ? null
                      : () => setState(() => selectedColor = hex),
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                      border: Border.all(
                        color: isSelected ? Colors.black87 : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    // A tick is clearer than a border alone on dark colours.
                    child: isSelected
                        ? const Icon(Icons.check, color: Colors.white, size: 20)
                        : null,
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: isSaving ? null : save,
              child: isSaving
                  ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      isEditing ? 'SAVE CHANGES' : 'ADD CATEGORY',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),

            const SizedBox(height: 8),

            TextButton(
              onPressed: isSaving ? null : () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}

```

================================================================================
FILE: lib/widgets/charts.dart
================================================================================

```dart
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
```

================================================================================
FILE: lib/widgets/custom_button.dart
================================================================================

```dart
// ===========================================================================
// custom_button.dart  -  one button style reused everywhere.
//
// STUB for a later task. Instead of styling every button by hand, use this:
//   CustomButton(text: 'Save', onPressed: saveExpense)
// ===========================================================================

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed; // the function to run when tapped

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Uses the ElevatedButton style already set in app_theme.dart.
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}

```

================================================================================
FILE: lib/widgets/dashboard_card.dart
================================================================================

```dart
// ===========================================================================
// dashboard_card.dart  -  one colored summary box of the dashboard.
//
// The dashboard shows the same shape three times (balance, total income,
// total expenses) with different words and colors. Writing that box once here
// means the three cards can never drift apart, and a change to the padding or
// the corner radius happens in ONE place.
//
// The widget knows nothing about money or the database. It is given a title,
// a value and a color, and it draws them - that is the whole job. Keeping it
// "dumb" like this is what makes it reusable.
// ===========================================================================

import 'package:flutter/material.dart';
import '../utils/constants.dart';

class DashboardCard extends StatelessWidget {
  final String title; // e.g. "Balance"
  final String value; // e.g. "1,250.00"
  final Color color;
  final IconData? icon; // optional picture on the right
  final String? subtitle; // optional small line under the value
  final bool large; // true = the wide hero card at the top
  final VoidCallback? onTap; // optional: make the card tappable

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    this.color = kPrimaryColor,
    this.icon,
    this.subtitle,
    this.large = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: const EdgeInsets.all(kPadding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(kRadius),
        boxShadow: [
          // A soft shadow in the card's own color: it lifts the box off the
          // grey page without the dirty grey halo a black shadow gives.
          BoxShadow(
            color: color.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Expanded lets the texts take all the space that is left after the
          // icon, so a long amount wraps instead of overflowing the screen.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 6),
                // FittedBox shrinks the text instead of letting a very large
                // number spill outside the card.
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: large ? 32 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ],
            ),
          ),

          if (icon != null) ...[
            const SizedBox(width: 8),
            Icon(icon, color: Colors.white24, size: large ? 46 : 30),
          ],
        ],
      ),
    );

    // Nothing to tap? Return the plain card. Otherwise wrap it so the user
    // also gets the ripple animation that says "this is a button".
    if (onTap == null) return card;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(kRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(kRadius),
        onTap: onTap,
        child: card,
      ),
    );
  }
}
```

================================================================================
FILE: lib/widgets/expense_card.dart
================================================================================

```dart
// ===========================================================================
// expense_card.dart  -  one row of the expenses list.
//
// A "widget" file holds a small UI piece you reuse in many places, so you
// don't copy-paste the same layout. Pass an Expense in, get a nice card out.
//
// It only DISPLAYS: no database calls, no navigation. The screen that uses it
// decides what a tap means, by passing onTap. That keeps the card reusable
// (the dashboard's "last 5 operations" list can use the very same card).
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/category_style.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;
  final VoidCallback? onTap;

  const ExpenseCard({super.key, required this.expense, this.onTap});

  @override
  Widget build(BuildContext context) {
    // The colors come from the category row that the JOIN brought with us.
    final color = categoryColor(expense.categoryColor);
    final icon = categoryIcon(expense.categoryIcon);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: kPadding,
          vertical: 6,
        ),
        // A pale circle of the category color with its icon inside.
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(
          expense.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis, // long titles never break the row
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          // "No category" covers the case where the category was deleted.
          '${expense.categoryName ?? 'No category'}  •  '
          '${formatDate(expense.expenseDate)}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // The minus sign makes it obvious this is money going OUT.
        trailing: Text(
          '-${formatAmount(expense.amount)}',
          style: const TextStyle(
            color: kExpenseColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

```

================================================================================
FILE: lib/widgets/expense_form.dart
================================================================================

```dart
// ===========================================================================
// expense_form.dart  -  the input form used by BOTH "Add expense" and
// "Edit expense".
//
// WHY ONE WIDGET FOR TWO SCREENS?
// The two screens ask for exactly the same five values. If each screen had
// its own copy of the form, every future change (a new field, a new rule)
// would have to be made twice - and one day it would be made only once.
// Here the form is written once; the screens only decide what "Save" does.
//
//   Add screen  -> ExpenseForm(onSave: (e) => addExpense(e))
//   Edit screen -> ExpenseForm(initial: expense, onSave: (e) => updateExpense(e))
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // input formatters

import '../models/category.dart';
import '../models/expense.dart';
import '../database/database_helper.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/validators.dart';
import '../utils/category_style.dart';

class ExpenseForm extends StatefulWidget {
  // null  -> we are creating a new expense
  // not null -> we are editing this one, so the fields start filled in
  final Expense? initial;

  // What the screen wants to do with the finished expense. It returns a
  // Future because saving touches the database, and the form waits for it
  // before turning the spinner off.
  final Future<void> Function(Expense expense) onSave;

  final String submitLabel;

  const ExpenseForm({
    super.key,
    this.initial,
    required this.onSave,
    this.submitLabel = 'SAVE',
  });

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController titleController;
  late final TextEditingController amountController;
  late final TextEditingController notesController;

  // The date and the category are not typed, so they are plain state
  // variables instead of controllers.
  late DateTime selectedDate;
  int? selectedCategoryId;

  List<Category> categories = [];
  bool isLoadingCategories = true;
  bool isSaving = false;
  String? loadError;

  @override
  void initState() {
    super.initState();

    final initial = widget.initial;

    // Fill the fields from the expense we are editing, or start empty.
    titleController = TextEditingController(text: initial?.title ?? '');
    amountController = TextEditingController(
      // toStringAsFixed(2) shows 20 as "20.00", which is what the user
      // expects to see in a money field.
      text: initial == null ? '' : initial.amount.toStringAsFixed(2),
    );
    notesController = TextEditingController(text: initial?.notes ?? '');

    selectedDate = initial?.expenseDate ?? dateOnly(DateTime.now());
    selectedCategoryId = initial?.categoryId;

    loadCategories();
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    notesController.dispose();
    super.dispose();
  }

  // The dropdown cannot be built before we know the categories, so we fetch
  // them once when the form opens.
  Future<void> loadCategories() async {
    try {
      final result = await DatabaseHelper().getAllCategories();
      if (!mounted) return;

      setState(() {
        categories = result;

        // Safety net: if the expense points at a category that was deleted,
        // the dropdown would be given a value that is not in its item list,
        // and Flutter throws. Clearing it forces the user to pick again.
        final ids = result.map((c) => c.id).toSet();
        if (!ids.contains(selectedCategoryId)) selectedCategoryId = null;

        isLoadingCategories = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        loadError = 'Could not load the categories.';
        isLoadingCategories = false;
      });
    }
  }

  void _showMessage(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? kExpenseColor : kIncomeColor,
      ),
    );
  }

  // Opens the calendar. firstDate/lastDate make an invalid date impossible to
  // even tap - the friendliest kind of validation.
  Future<void> pickDate() async {
    final today = dateOnly(DateTime.now());

    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.isAfter(today) ? today : selectedDate,
      firstDate: DateTime(2000),
      lastDate: today, // no future expenses
    );

    if (picked == null) return; // the user pressed Cancel
    setState(() => selectedDate = dateOnly(picked));
  }

  Future<void> save() async {
    // 1. the typed fields
    if (!_formKey.currentState!.validate()) return;

    // 2. the fields a Form cannot check by itself
    final dateError = Validators.pastOrToday(selectedDate);
    if (dateError != null) {
      _showMessage(dateError);
      return;
    }
    if (selectedCategoryId == null) {
      _showMessage('Please choose a category');
      return;
    }

    // 3. build the object. The text is cleaned before it is stored.
    final expense = Expense(
      id: widget.initial?.id, // null when adding, real id when editing
      title: Validators.sanitize(titleController.text),
      amount: double.parse(amountController.text.trim()),
      expenseDate: selectedDate,
      categoryId: selectedCategoryId,
      notes: Validators.sanitize(notesController.text),
    );

    setState(() => isSaving = true);
    try {
      await widget.onSave(expense); // the screen decides: insert or update
    } catch (e) {
      if (!mounted) return;
      _showMessage('Could not save. Please try again.');
    } finally {
      // The screen usually closes itself after a successful save, so this
      // only matters when something went wrong.
      if (mounted) setState(() => isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoadingCategories) {
      return const Center(child: CircularProgressIndicator());
    }

    if (loadError != null) {
      return _MessageView(
        icon: Icons.error_outline,
        message: loadError!,
        actionLabel: 'Try again',
        onAction: () {
          setState(() {
            loadError = null;
            isLoadingCategories = true;
          });
          loadCategories();
        },
      );
    }

    if (categories.isEmpty) {
      // The database seeds categories, so this only happens if the user
      // deleted them all. Saving would break the foreign key, so we stop here
      // with an explanation instead of showing a form that cannot be saved.
      return const _MessageView(
        icon: Icons.category_outlined,
        message: 'There are no categories yet.\n'
            'Add one from the Categories screen first.',
      );
    }

    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(kPadding),
        children: [
          // ---- TITLE ----
          TextFormField(
            controller: titleController,
            enabled: !isSaving,
            textCapitalization: TextCapitalization.sentences,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Title',
              prefixIcon: Icon(Icons.title),
              hintText: 'Lunch, taxi, electricity bill...',
            ),
            validator: Validators.title,
          ),

          const SizedBox(height: 16),

          // ---- AMOUNT ----
          TextFormField(
            controller: amountController,
            enabled: !isSaving,
            // decimal: true gives the phone keyboard a dot key.
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            // The formatter blocks letters and signs while typing, so a
            // negative amount can never even be entered.
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ],
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Amount',
              prefixIcon: Icon(Icons.payments),
              hintText: '0.00',
            ),
            validator: Validators.amount,
          ),

          const SizedBox(height: 16),

          // ---- DATE ----
          // A read-only tile instead of a text field: the user can only pick
          // a real date from the calendar, never type "32/13/2026".
          InkWell(
            onTap: isSaving ? null : pickDate,
            borderRadius: BorderRadius.circular(4),
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Date',
                prefixIcon: Icon(Icons.calendar_today),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDate(selectedDate)),
                  const Icon(Icons.arrow_drop_down, color: Colors.grey),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ---- CATEGORY ----
          DropdownButtonFormField<int>(
            initialValue: selectedCategoryId,
            isExpanded: true, // long names get ellipsis instead of overflow
            decoration: const InputDecoration(
              labelText: 'Category',
              prefixIcon: Icon(Icons.category),
            ),
            items: categories.map((category) {
              final color = categoryColor(category.color);
              return DropdownMenuItem<int>(
                value: category.id,
                child: Row(
                  children: [
                    Icon(categoryIcon(category.icon), color: color, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        category.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: isSaving
                ? null
                : (value) => setState(() => selectedCategoryId = value),
            validator: (value) =>
                value == null ? 'Please choose a category' : null,
          ),

          const SizedBox(height: 16),

          // ---- NOTES (optional) ----
          TextFormField(
            controller: notesController,
            enabled: !isSaving,
            maxLines: 3,
            maxLength: 200,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Notes (optional)',
              alignLabelWithHint: true,
            ),
            validator: Validators.notes,
          ),

          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: isSaving ? null : save,
            child: isSaving
                ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    widget.submitLabel,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// A small private widget for the two "nothing to show" states above.
// The underscore keeps it private to this file: it is a detail of the form,
// not something other files should use.
// ---------------------------------------------------------------------------
class _MessageView extends StatelessWidget {
  final IconData icon;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  const _MessageView({
    required this.icon,
    required this.message,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(kPadding * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: onAction,
                  child: Text(actionLabel!),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

```

================================================================================
FILE: lib/widgets/income_card.dart
================================================================================

```dart
// ===========================================================================
// income_card.dart  -  one row of the incomes list.
//
// The twin of expense_card.dart, in green and with a "+" instead of a "-".
// Like that card it only DISPLAYS: the screen passes in what a tap, an edit
// or a delete should do, so the same card can be reused anywhere later
// (for example in the dashboard's "last 5 operations").
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/income.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';

class IncomeCard extends StatelessWidget {
  final Income income;
  final VoidCallback? onTap; // whole row tapped
  final VoidCallback? onEdit; // menu -> Edit
  final VoidCallback? onDelete; // menu -> Delete

  const IncomeCard({
    super.key,
    required this.income,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: kPadding, right: 4),
        leading: CircleAvatar(
          backgroundColor: kIncomeColor.withValues(alpha: 0.15),
          child: const Icon(Icons.savings, color: kIncomeColor),
        ),
        title: Text(
          income.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis, // long titles never break the row
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          formatDate(income.incomeDate),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        // The amount and the actions menu sit together on the right.
        // mainAxisSize.min stops the Row from trying to fill the screen.
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '+${formatAmount(income.amount)}',
              style: const TextStyle(
                color: kIncomeColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            // A three-dot menu: it keeps Edit and Delete visible without
            // hiding them behind a gesture the user has to guess.
            PopupMenuButton<String>(
              tooltip: 'Actions',
              onSelected: (value) {
                if (value == 'edit') onEdit?.call();
                if (value == 'delete') onDelete?.call();
              },
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: 'edit',
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.edit, color: kPrimaryColor),
                    title: Text('Edit'),
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.delete, color: kExpenseColor),
                    title: Text('Delete'),
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}

```

================================================================================
FILE: lib/widgets/income_form.dart
================================================================================

```dart
// ===========================================================================
// income_form.dart  -  the input form used by BOTH "Add income" and
// "Edit income".
//
// Same pattern as widgets/expense_form.dart: the fields and the rules live
// here once, and each screen only decides what "Save" does.
//
//   Add screen  -> IncomeForm(onSave: (i) => addIncome(i))
//   Edit screen -> IncomeForm(initial: income, onSave: (i) => updateIncome(i))
//
// It is simpler than the expense form because income has no category, so
// there is nothing to load from the database before the form can be shown.
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // input formatters

import '../models/income.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/validators.dart';

class IncomeForm extends StatefulWidget {
  // null -> creating a new income; not null -> editing this one.
  final Income? initial;

  final Future<void> Function(Income income) onSave;

  final String submitLabel;

  const IncomeForm({
    super.key,
    this.initial,
    required this.onSave,
    this.submitLabel = 'SAVE',
  });

  @override
  State<IncomeForm> createState() => _IncomeFormState();
}

class _IncomeFormState extends State<IncomeForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController titleController;
  late final TextEditingController amountController;
  late final TextEditingController notesController;

  // The date is picked, not typed, so it is plain state.
  late DateTime selectedDate;

  bool isSaving = false;

  @override
  void initState() {
    super.initState();

    final initial = widget.initial;

    titleController = TextEditingController(text: initial?.title ?? '');
    amountController = TextEditingController(
      // 3000 shows as "3000.00", which is what a money field should look like.
      text: initial == null ? '' : initial.amount.toStringAsFixed(2),
    );
    notesController = TextEditingController(text: initial?.notes ?? '');

    selectedDate = initial?.incomeDate ?? dateOnly(DateTime.now());
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    notesController.dispose();
    super.dispose();
  }

  void _showMessage(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? kExpenseColor : kIncomeColor,
      ),
    );
  }

  // firstDate/lastDate make an impossible date impossible to tap - the
  // friendliest kind of validation.
  Future<void> pickDate() async {
    final today = dateOnly(DateTime.now());

    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.isAfter(today) ? today : selectedDate,
      firstDate: DateTime(2000),
      lastDate: today, // income you have not received yet is not income
    );

    if (picked == null) return; // the user pressed Cancel
    setState(() => selectedDate = dateOnly(picked));
  }

  Future<void> save() async {
    // 1. the typed fields
    if (!_formKey.currentState!.validate()) return;

    // 2. the date, which a Form cannot check by itself
    final dateError = Validators.pastOrToday(selectedDate);
    if (dateError != null) {
      _showMessage(dateError);
      return;
    }

    // 3. build the object, cleaning the text on the way in
    final income = Income(
      id: widget.initial?.id, // null when adding, real id when editing
      title: Validators.sanitize(titleController.text),
      amount: double.parse(amountController.text.trim()),
      incomeDate: selectedDate,
      notes: Validators.sanitize(notesController.text),
    );

    setState(() => isSaving = true);
    try {
      await widget.onSave(income); // the screen decides: insert or update
    } catch (e) {
      if (!mounted) return;
      _showMessage('Could not save. Please try again.');
    } finally {
      // The screen normally closes itself on success, so this mostly matters
      // when something went wrong.
      if (mounted) setState(() => isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(kPadding),
        children: [
          // ---- TITLE ----
          TextFormField(
            controller: titleController,
            enabled: !isSaving,
            textCapitalization: TextCapitalization.sentences,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Title',
              prefixIcon: Icon(Icons.title),
              hintText: 'Salary, freelance work, gift...',
            ),
            validator: Validators.title,
          ),

          const SizedBox(height: 16),

          // ---- AMOUNT ----
          TextFormField(
            controller: amountController,
            enabled: !isSaving,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            // Blocks letters and the minus sign while typing, so a negative
            // income can never even be entered.
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ],
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Amount',
              prefixIcon: Icon(Icons.payments),
              hintText: '0.00',
            ),
            validator: Validators.amount,
          ),

          const SizedBox(height: 16),

          // ---- DATE ----
          // Read-only tile + calendar: the user cannot type "32/13/2026".
          InkWell(
            onTap: isSaving ? null : pickDate,
            borderRadius: BorderRadius.circular(4),
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Date',
                prefixIcon: Icon(Icons.calendar_today),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDate(selectedDate)),
                  const Icon(Icons.arrow_drop_down, color: Colors.grey),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ---- NOTES (optional) ----
          TextFormField(
            controller: notesController,
            enabled: !isSaving,
            maxLines: 3,
            maxLength: 200,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Notes (optional)',
              alignLabelWithHint: true,
            ),
            validator: Validators.notes,
          ),

          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: isSaving ? null : save,
            style: ElevatedButton.styleFrom(backgroundColor: kIncomeColor),
            child: isSaving
                ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    widget.submitLabel,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

```

================================================================================
FILE: lib/expenses/add_expense_screen.dart
================================================================================

```dart
// ===========================================================================
// add_expense_screen.dart  -  FR5: add a new expense (CREATE).
//
// Notice how short this file is. All the fields, rules and the date picker
// live in widgets/expense_form.dart; this screen only says what "Save" does:
// hand the expense to the provider and close.
//
// It talks to ExpenseProvider, not to DatabaseHelper. The provider writes the
// row AND refreshes its list, so the expenses list, the dashboard and the
// reports are all correct the moment this screen closes.
// ===========================================================================

import 'package:flutter/material.dart';

import '../providers/expense_provider.dart';
import '../widgets/expense_form.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: ExpenseForm(
        submitLabel: 'ADD EXPENSE',
        onSave: (expense) async {
          await ExpenseProvider().addExpense(expense);

          // context.mounted: the screen may have been closed while the
          // database was writing. Using a dead context crashes the app.
          if (!context.mounted) return;

          Navigator.pop(context, true);
        },
      ),
    );
  }
}
```

================================================================================
FILE: lib/expenses/edit_expense_screen.dart
================================================================================

```dart
// ===========================================================================
// edit_expense_screen.dart  -  FR6: edit an existing expense (UPDATE).
//
// The twin of add_expense_screen.dart. Same form, two differences:
//   - it receives the expense to edit and passes it to the form as `initial`,
//     so every field starts filled in
//   - "Save" calls updateExpense() instead of addExpense()
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../providers/expense_provider.dart';
import '../widgets/expense_form.dart';

class EditExpenseScreen extends StatelessWidget {
  final Expense expense;

  const EditExpenseScreen({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Expense')),
      body: ExpenseForm(
        initial: expense, // <- the only real difference
        submitLabel: 'SAVE CHANGES',
        onSave: (updated) async {
          // false = 0 rows changed, which means the expense was deleted from
          // another screen while this one was open.
          final saved = await ExpenseProvider().updateExpense(updated);
          if (!context.mounted) return;

          if (!saved) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('This expense no longer exists')),
            );
            return;
          }

          Navigator.pop(context, true);
        },
      ),
    );
  }
}
```

================================================================================
FILE: lib/expenses/expense_details_screen.dart
================================================================================

```dart
// ===========================================================================
// expense_details_screen.dart  -  FR9: show ALL the data of one expense,
// plus the two actions that belong to a single row: edit (FR6) and delete
// with a confirmation message (FR7).
//
// It keeps its own copy of the expense and asks the provider for a fresh one
// after an edit, so the screen can never show stale values.
//
// Both actions go through ExpenseProvider, so deleting here also updates the
// list behind us, the dashboard totals and the reports - without any of those
// screens knowing this screen exists.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../providers/expense_provider.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/category_style.dart';
import 'edit_expense_screen.dart';

class ExpenseDetailsScreen extends StatefulWidget {
  final Expense expense;

  const ExpenseDetailsScreen({super.key, required this.expense});

  @override
  State<ExpenseDetailsScreen> createState() => _ExpenseDetailsScreenState();
}

class _ExpenseDetailsScreenState extends State<ExpenseDetailsScreen> {
  final ExpenseProvider provider = ExpenseProvider();

  late Expense expense = widget.expense;
  bool isDeleting = false;

  void _showMessage(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? kExpenseColor : kIncomeColor,
      ),
    );
  }

  // Opens the edit screen and, when it returns, reads the row again so the
  // details we show are the ones actually stored.
  Future<void> openEdit() async {
    final saved = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => EditExpenseScreen(expense: expense)),
    );

    if (!mounted || saved != true) return;

    final fresh = await provider.getById(expense.id!);
    if (!mounted) return;

    if (fresh == null) {
      // Someone deleted it meanwhile - there is nothing left to show.
      Navigator.pop(context, true);
      return;
    }

    setState(() => expense = fresh);
  }

  // FR7: delete, but never without asking first.
  Future<void> confirmAndDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete expense'),
        // Naming the expense in the question prevents "wrong row" accidents.
        content: Text(
          'Delete "${expense.title}" (${formatAmount(expense.amount)})?\n'
              'This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            style: TextButton.styleFrom(foregroundColor: kExpenseColor),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    setState(() => isDeleting = true);
    try {
      await provider.deleteExpense(expense.id!);
      if (!mounted) return;
      Navigator.pop(context, true); // back to the list, already refreshed
    } catch (e) {
      if (!mounted) return;
      setState(() => isDeleting = false);
      _showMessage('Could not delete the expense. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = categoryColor(expense.categoryColor);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit',
            onPressed: isDeleting ? null : openEdit,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete',
            onPressed: isDeleting ? null : confirmAndDelete,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(kPadding),
        children: [
          // ---- HEADER: the amount, impossible to miss ----
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 28),
            decoration: BoxDecoration(
              color: kExpenseColor,
              borderRadius: BorderRadius.circular(kRadius),
            ),
            child: Column(
              children: [
                Icon(
                  categoryIcon(expense.categoryIcon),
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(height: 12),
                Text(
                  '-${formatAmount(expense.amount)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  expense.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ---- EVERY FIELD OF THE ROW ----
          _DetailRow(
            icon: Icons.title,
            label: 'Title',
            value: expense.title,
          ),
          _DetailRow(
            icon: Icons.payments,
            label: 'Amount',
            value: formatAmount(expense.amount),
          ),
          _DetailRow(
            icon: Icons.calendar_today,
            label: 'Date',
            value: formatDate(expense.expenseDate),
          ),
          _DetailRow(
            icon: categoryIcon(expense.categoryIcon),
            iconColor: color,
            label: 'Category',
            value: expense.categoryName ?? 'No category (it was deleted)',
          ),
          _DetailRow(
            icon: Icons.notes,
            label: 'Notes',
            value: expense.notes.isEmpty ? '-' : expense.notes,
          ),
          _DetailRow(
            icon: Icons.tag,
            label: 'Record number',
            value: '#${expense.id}',
          ),

          const SizedBox(height: 20),

          // A second, easier-to-reach delete button. Same function as the
          // app bar icon - written once, used twice.
          OutlinedButton.icon(
            onPressed: isDeleting ? null : confirmAndDelete,
            icon: const Icon(Icons.delete_outline),
            label: Text(isDeleting ? 'DELETING...' : 'DELETE EXPENSE'),
            style: OutlinedButton.styleFrom(
              foregroundColor: kExpenseColor,
              minimumSize: const Size.fromHeight(50),
              side: const BorderSide(color: kExpenseColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// One "label + value" line. Private to this file; it exists so the six lines
// above are six short calls instead of six copies of the same Row.
// ---------------------------------------------------------------------------
class _DetailRow extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor ?? kPrimaryColor),
        title: Text(label, style: const TextStyle(color: Colors.grey)),
        subtitle: Text(
          value,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
```

================================================================================
FILE: lib/expenses/expenses_list_screen.dart
================================================================================

```dart
// ===========================================================================
// expenses_list_screen.dart  -  FR8: the list of all expenses (the READ part
// of CRUD) and the entry point to add / view / edit / delete one.
//
// The screen does NOT own the list and never touches the database. It reads
// ExpenseProvider and redraws whenever the provider says the data changed -
// which happens after every add, edit and delete, wherever in the app they
// were made. That is why there is no "reload after coming back" code here
// any more: the provider has already told us.
//
// Three states, three bodies: spinner while loading, an error view with
// "Try again", or the list (with a friendly screen when it is empty).
//
// Searching and filtering (FR16-FR20) live in their own screen, opened from
// the magnifier in the app bar.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../providers/expense_provider.dart';
import '../utils/constants.dart';
import '../widgets/app_drawer.dart';
import '../widgets/expense_card.dart';
import 'add_expense_screen.dart';
import 'expense_details_screen.dart';
import 'search_expenses_screen.dart';

class ExpensesListScreen extends StatefulWidget {
  // Needed only so this screen can show the same side menu as the dashboard.
  final User user;

  const ExpensesListScreen({super.key, required this.user});

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  // ExpenseProvider() always returns the one shared object (it is a
  // singleton), so this is the same provider the dashboard listens to.
  final ExpenseProvider provider = ExpenseProvider();

  @override
  void initState() {
    super.initState();

    // Safe to call straight from initState: the provider defers its first
    // notification to a microtask, so nothing is asked to redraw while this
    // screen is still being built.
    provider.loadExpenses();
  }

  void openScreen(Widget screen) {
    // No reload afterwards: whatever that screen changes, it changes through
    // the provider, and the provider redraws us.
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          // FR16-FR20 live one tap away, where people look for them.
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search and filter',
            onPressed: () => openScreen(SearchExpensesScreen(user: widget.user)),
          ),
          const LogoutAction(),
        ],
      ),
      drawer: AppDrawer(user: widget.user),

      // FR5 starts here: the "+" button in the corner.
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => openScreen(const AddExpenseScreen()),
        backgroundColor: kExpenseColor,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),

      // ListenableBuilder rebuilds ONLY what is inside it, every time the
      // provider calls notifyListeners(). The app bar and the button above
      // are built once and left alone.
      body: ListenableBuilder(
        listenable: provider,
        builder: (context, _) => buildBody(),
      ),
    );
  }

  // Splitting the body into its own method keeps build() readable: one look
  // tells you which of the three states the screen is in.
  Widget buildBody() {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                provider.errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: provider.loadExpenses,
                  child: const Text('Try again'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final expenses = provider.expenses;

    if (expenses.isEmpty) {
      // An empty list should explain itself instead of showing a blank page.
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.receipt_long, size: 72, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'No expenses yet',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Tap "Add" to record your first expense.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    // RefreshIndicator = pull the list down to reload it.
    return RefreshIndicator(
      onRefresh: provider.loadExpenses,
      child: ListView.builder(
        // .builder only builds the rows that are visible, so a list of a
        // thousand expenses still scrolls smoothly.
        padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 90),
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final expense = expenses[index];
          return ExpenseCard(
            expense: expense,
            // FR9: tap a row to see everything about it.
            onTap: () => openScreen(ExpenseDetailsScreen(expense: expense)),
          );
        },
      ),
    );
  }
}
```

================================================================================
FILE: lib/expenses/search_expenses_screen.dart
================================================================================

```dart
// ===========================================================================
// search_expenses_screen.dart  -  the search and filter module.
//
//    FR16 search by name        FR17 search by date
//    FR18 search by category    FR19 search by amount (more than / less than)
//    FR20 combined search       (several conditions at once)
//
// HOW IT WORKS
// The screen collects whatever the user filled in and hands it to ONE
// function, ExpenseProvider.search(). Anything left empty is sent as null,
// which means "do not filter on this". So the five requirements are not five
// separate searches - they are the same search with more or fewer conditions.
//
// The filtering is done by SQLite in the WHERE clause, NOT by loading every
// expense and dropping the ones that do not match in Dart. That is the whole
// point of using a database.
//
// WHY THE RESULTS ARE HELD HERE AND NOT IN THE PROVIDER
// The provider owns the list every screen shares. A search result is not
// that: it is a private answer to a question this screen just asked, and it
// belongs to this screen only. So search() returns the rows instead of
// replacing the shared list.
// ===========================================================================

import 'dart:async';

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/expense.dart';
import '../models/category.dart';
import '../database/database_helper.dart';
import '../providers/expense_provider.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/date_ranges.dart';
import '../widgets/app_drawer.dart';
import '../widgets/expense_card.dart';
import 'expense_details_screen.dart';

class SearchExpensesScreen extends StatefulWidget {
  final User user;

  const SearchExpensesScreen({super.key, required this.user});

  @override
  State<SearchExpensesScreen> createState() => _SearchExpensesScreenState();
}

class _SearchExpensesScreenState extends State<SearchExpensesScreen> {
  final ExpenseProvider provider = ExpenseProvider();

  // The category dropdown is the only thing this screen reads straight from
  // the database: categories are not one of the two lists the providers own.
  final DatabaseHelper _db = DatabaseHelper();

  // ---- the filters ----
  final titleController = TextEditingController(); // FR16
  final minController = TextEditingController(); // FR19
  final maxController = TextEditingController(); // FR19
  DateRange? dateRange; // FR17
  int? categoryId; // FR18

  // ---- the data ----
  List<Category> categories = [];
  List<Expense> results = [];
  bool isLoading = true;
  String? errorMessage;
  bool filtersOpen = true;

  // Typing "coffee" fires six changes. Without this timer we would send six
  // queries and the answers could even arrive out of order. Instead we wait
  // until the user has stopped typing for a moment, then search once.
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    loadCategories();
    runSearch(); // no filters yet -> shows everything
  }

  @override
  void dispose() {
    // Controllers and timers hold memory and keep running after the screen is
    // gone. Releasing them here is not optional.
    _debounce?.cancel();
    titleController.dispose();
    minController.dispose();
    maxController.dispose();
    super.dispose();
  }

  Future<void> loadCategories() async {
    try {
      final rows = await _db.getAllCategories();
      if (!mounted) return;
      setState(() => categories = rows);
    } catch (e) {
      // A failed category list must not break the whole screen: the user can
      // still search by name, date and amount.
      if (!mounted) return;
      setState(() => categories = []);
    }
  }

  // -------------------------------------------------------------------------
  // THE SEARCH ITSELF
  // -------------------------------------------------------------------------
  Future<void> runSearch() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final rows = await provider.search(
        text: titleController.text, // FR16
        range: dateRange, // FR17
        categoryId: categoryId, // FR18
        // tryParse returns null when the box is empty or holds nonsense, and
        // null is exactly what "no amount filter" means - so a half-typed
        // number simply does not filter instead of crashing.
        minAmount: double.tryParse(minController.text.trim()), // FR19
        maxAmount: double.tryParse(maxController.text.trim()), // FR19
      );

      if (!mounted) return;
      setState(() {
        results = rows;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Could not run the search.';
        isLoading = false;
      });
    }
  }

  // Called on every keystroke. It only starts the search once the typing has
  // paused for 350 milliseconds.
  void onTextChanged() {
    // Redraw now so the clear button and the filter badge react to the very
    // first letter; the search itself still waits for the pause.
    setState(() {});
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), runSearch);
  }

  // FR17: let the user pick two dates. showDateRangePicker is the built-in
  // Flutter calendar for a start and an end day.
  Future<void> pickDateRange() async {
    final firstDate = DateTime(2000);
    final lastDate = dateOnly(DateTime.now());

    // THE BUG THIS GUARD FIXES
    // showDateRangePicker refuses to open if the range it starts with reaches
    // outside firstDate..lastDate - in debug it throws an assertion, so the
    // button looks dead. "This month" runs to the 31st while lastDate is
    // today, which is exactly that case. So we trim the starting range to
    // what the picker allows, and pass nothing at all if trimming leaves an
    // impossible range.
    DateTimeRange? initialRange;
    final current = dateRange;
    if (current != null) {
      final start = current.start.isBefore(firstDate) ? firstDate : current.start;
      final end = current.end.isAfter(lastDate) ? lastDate : current.end;
      if (!end.isBefore(start)) {
        initialRange = DateTimeRange(start: start, end: end);
      }
    }

    final picked = await showDateRangePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDateRange: initialRange,
      helpText: 'Expenses between',
    );

    if (picked == null || !mounted) return;
    setState(() => dateRange = DateRange(picked.start, picked.end));
    runSearch();
  }

  // Quick buttons for the ranges people actually ask for.
  void useQuickRange(DateRange? value) {
    setState(() => dateRange = value);
    runSearch();
  }

  void clearFilters() {
    setState(() {
      titleController.clear();
      minController.clear();
      maxController.clear();
      dateRange = null;
      categoryId = null;
    });
    runSearch();
  }

  // How many conditions are switched on. Shown as a badge so the user always
  // knows the list is filtered, even with the panel collapsed.
  int get activeFilterCount {
    var count = 0;
    if (titleController.text.trim().isNotEmpty) count++;
    if (dateRange != null) count++;
    if (categoryId != null) count++;
    if (double.tryParse(minController.text.trim()) != null) count++;
    if (double.tryParse(maxController.text.trim()) != null) count++;
    return count;
  }

  // The sum of what is on screen. Useful on its own: "how much did I spend on
  // food in July?" is a search plus a total.
  double get resultsTotal {
    return results.fold<double>(0, (sum, expense) => sum + expense.amount);
  }

  // -------------------------------------------------------------------------
  // DRAWING
  // -------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search expenses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_off),
            tooltip: 'Clear filters',
            onPressed: activeFilterCount == 0 ? null : clearFilters,
          ),
          const LogoutAction(),
        ],
      ),
      drawer: AppDrawer(user: widget.user),
      body: Column(
        children: [
          buildFilterPanel(),
          const Divider(height: 1),
          buildResultsHeader(),
          Expanded(child: buildResults()),
        ],
      ),
    );
  }

  Widget buildFilterPanel() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // FR16: the name box is always visible - it is the one people use
          // most. The rest of the filters hide behind the arrow.
          Padding(
            padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: titleController,
                    onChanged: (_) => onTextChanged(),
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: 'Search by name',
                      prefixIcon: const Icon(Icons.search),
                      isDense: true,
                      suffixIcon: titleController.text.isEmpty
                          ? null
                          : IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          titleController.clear();
                          runSearch();
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                  tooltip: filtersOpen ? 'Hide filters' : 'More filters',
                  icon: Badge(
                    // The badge is hidden when nothing is filtered, so it only
                    // appears when it carries information.
                    isLabelVisible: activeFilterCount > 0,
                    label: Text('$activeFilterCount'),
                    child: Icon(
                      filtersOpen ? Icons.expand_less : Icons.tune,
                    ),
                  ),
                  onPressed: () => setState(() => filtersOpen = !filtersOpen),
                ),
              ],
            ),
          ),

          if (filtersOpen)
            Padding(
              padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---- FR18: by category ----
                  DropdownButtonFormField<int?>(
                    initialValue: categoryId,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      isDense: true,
                    ),
                    items: [
                      // A null value is a real choice here: "all categories".
                      const DropdownMenuItem<int?>(
                        value: null,
                        child: Text('All categories'),
                      ),
                      ...categories.map(
                            (category) => DropdownMenuItem<int?>(
                          value: category.id,
                          child: Text(category.name),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() => categoryId = value);
                      runSearch();
                    },
                  ),
                  const SizedBox(height: 12),

                  // ---- FR19: by amount ----
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: minController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onChanged: (_) => onTextChanged(),
                          decoration: const InputDecoration(
                            labelText: 'More than',
                            isDense: true,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: maxController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onChanged: (_) => onTextChanged(),
                          decoration: const InputDecoration(
                            labelText: 'Less than',
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // ---- FR17: by date ----
                  const Text('Date', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      quickChip('Any time', dateRange == null, () {
                        useQuickRange(null);
                      }),
                      quickChip(
                        'Today',
                        isSameRange(DateRange.day(DateTime.now())),
                            () => useQuickRange(DateRange.day(DateTime.now())),
                      ),
                      quickChip(
                        'This week',
                        isSameRange(DateRange.week(DateTime.now())),
                            () => useQuickRange(DateRange.week(DateTime.now())),
                      ),
                      quickChip(
                        'This month',
                        isSameRange(DateRange.month(DateTime.now())),
                            () => useQuickRange(DateRange.month(DateTime.now())),
                      ),
                      ActionChip(
                        avatar: const Icon(Icons.date_range, size: 18),
                        label: const Text('Pick dates'),
                        onPressed: pickDateRange,
                      ),
                    ],
                  ),
                  if (dateRange != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Showing ${dateRange!.label}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // Small helper so the four date chips are written once.
  Widget quickChip(String label, bool selected, VoidCallback onTap) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      showCheckmark: false,
      selectedColor: kPrimaryColor,
      labelStyle: TextStyle(
        color: selected ? Colors.white : Colors.black87,
        fontSize: 13,
      ),
      onSelected: (_) => onTap(),
    );
  }

  // Is the chosen range the same as this preset? Compared by both ends,
  // because "this week" and "this month" can start on the same day.
  bool isSameRange(DateRange other) {
    final current = dateRange;
    if (current == null) return false;
    return current.start == other.start && current.end == other.end;
  }

  // FR20 in one line: how many rows matched, and what they add up to.
  Widget buildResultsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              isLoading
                  ? 'Searching...'
                  : '${results.length} ${results.length == 1 ? 'expense' : 'expenses'}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          if (!isLoading && results.isNotEmpty)
            Text(
              'Total: ${formatAmount(resultsTotal)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: kExpenseColor,
              ),
            ),
        ],
      ),
    );
  }

  Widget buildResults() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: runSearch,
                  child: const Text('Try again'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (results.isEmpty) {
      // An empty result is not an error: it means the filters are too narrow.
      // The message says what to do about it.
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.search_off, size: 72, color: Colors.grey),
              const SizedBox(height: 16),
              const Text(
                'No expense matches',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Try a shorter word, a wider date range, or remove a filter.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              if (activeFilterCount > 0) ...[
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: clearFilters,
                    child: const Text('Clear all filters'),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(kPadding, 8, kPadding, kPadding),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final expense = results[index];
        return ExpenseCard(
          expense: expense,
          // The details screen can edit or delete the row, so we search again
          // when we come back: a renamed expense may no longer match.
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ExpenseDetailsScreen(expense: expense),
              ),
            );
            if (!mounted) return;
            await runSearch();
          },
        );
      },
    );
  }
}
```

================================================================================
FILE: lib/database/database_helper.dart
================================================================================

```dart
// ===========================================================================
// database_helper.dart  -  the database file of the project.
//
// We use SQLite (a small database inside the phone) through the "sqflite"
// package. This is the ONLY file that writes SQL. Screens just call functions
// like login() or addExpense().
// ===========================================================================

import 'package:path/path.dart'; // gives us join()
import 'package:sqflite/sqflite.dart'; // gives us the database

import '../models/user.dart';
import '../models/category.dart';
import '../models/expense.dart';
import '../models/income.dart';
import '../utils/date_ranges.dart';
import '../utils/formatters.dart';

class DatabaseHelper {
  // -------------------------------------------------------------------------
  // SINGLETON
  // These 3 lines make sure only ONE DatabaseHelper exists in the whole app.
  // Every time you write DatabaseHelper() you get the same object back.
  // Reason: opening the same database file twice causes errors.
  // -------------------------------------------------------------------------
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  // The open connection. null until we open it the first time.
  static Database? _db;

  // Use this in every function:  final db = await database;
  Future<Database> get database async {
    if (_db != null) return _db!; // already open -> return it
    _db = await _openDatabase(); // not open -> open it now
    return _db!;
  }

  // Opens the database file (creates it if it does not exist).
  Future<Database> _openDatabase() async {
    final path = join(await getDatabasesPath(), 'app.db');
    return openDatabase(
      path,
      version: 2, // increase this if you change the tables
      onConfigure: _onConfigure, // runs EVERY time the file is opened
      onCreate: _createTables, // runs ONLY when the file is first created
      onUpgrade: _upgradeTables, // runs when version is higher than the file's
    );
  }

  // Runs on every open, before anything else.
  // SQLite ignores FOREIGN KEY rules unless you switch them on per connection.
  // We switch them on so an expense can never point at a category that does
  // not exist.
  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  // -------------------------------------------------------------------------
  // CREATING THE TABLES
  // -------------------------------------------------------------------------
  Future<void> _createTables(Database db, int version) async {
    // ---- USERS table ----
    await db.execute('''
      CREATE TABLE users (
        id       INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE,
        password TEXT,
        full_name TEXT
      )
    ''');

    // Test accounts so we can log in right away.
    await db.insert('users', {'username': 'Tammam', 'password': 'Tammam123456', 'full_name': 'Tammam Alhadwah'});
    await db.insert('users', {'username': 'Karam', 'password': 'Karam123', 'full_name': 'Karam Kanaan'});


    await db.execute('''
       CREATE TABLE categories (
         id         INTEGER PRIMARY KEY AUTOINCREMENT,
         name       TEXT NOT NULL,
         icon       TEXT,
         color      TEXT
       )
     ''');


    await db.execute('''
       CREATE TABLE incomes (
         id          INTEGER PRIMARY KEY AUTOINCREMENT,
         title       TEXT,
         amount      REAL,
         income_date DATE,
         notes       TEXT
       )
     ''');


    await db.execute('''
       CREATE TABLE expenses (
         id           INTEGER PRIMARY KEY AUTOINCREMENT,
         title        TEXT,
         amount       REAL,
         expense_date DATE,
         category_id  INTEGER,
         notes        TEXT,
         FOREIGN KEY(category_id)
         REFERENCES categories(id)
       )
     ''');

    // An expense cannot be saved without a category, so the app must never
    // start with an empty categories table.
    await _seedDefaultCategories(db);
  }

  // -------------------------------------------------------------------------
  // UPGRADING AN EXISTING FILE
  // -------------------------------------------------------------------------
  // onCreate only runs on a phone that has never installed the app. Everyone
  // who already ran version 1 has the tables but NO categories, so we add
  // them here instead of asking people to delete the database.
  //
  // Rule for the rest of the project: never edit a released CREATE TABLE -
  // raise `version` and add a step here.
  Future<void> _upgradeTables(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await _seedDefaultCategories(db);
    }
  }

  // Inserts the starter categories, but only if the table is empty, so it can
  // never duplicate them or overwrite categories the user created.
  Future<void> _seedDefaultCategories(DatabaseExecutor db) async {
    final existing = await db.query('categories', limit: 1);
    if (existing.isNotEmpty) return;

    // The icon values are keys from utils/category_style.dart.
    const defaults = [
      {'name': 'Food', 'icon': 'food', 'color': '#E4572E'},
      {'name': 'Transport', 'icon': 'transport', 'color': '#1E5F8C'},
      {'name': 'Bills', 'icon': 'bills', 'color': '#6C5B7B'},
      {'name': 'Entertainment', 'icon': 'entertainment', 'color': '#F2A65A'},
      {'name': 'Health', 'icon': 'health', 'color': '#3BA776'},
      {'name': 'Education', 'icon': 'education', 'color': '#4FA3C4'},
      {'name': 'Other', 'icon': 'other', 'color': '#7A8B99'},
    ];

    // A batch sends all the inserts in one go instead of seven round trips.
    final batch = db.batch();
    for (final category in defaults) {
      batch.insert('categories', category);
    }
    await batch.commit(noResult: true);
  }

  // =========================================================================
  // USERS
  // =========================================================================

  // Adds a new user. Returns the id of the new row.
  //
  // Throws a DatabaseException if the username is already taken, because the
  // users table declares  username TEXT UNIQUE . The register screen checks
  // usernameExists() first for a friendly message, but we keep the database
  // rule as the LAST line of defence (two people could register at the same
  // moment, and only the database can settle that race).
  Future<int> addUser(String username, String password, String fullName) async {
    final db = await database;
    return db.insert(
      'users',
      {'username': username, 'password': password, 'full_name': fullName},
      conflictAlgorithm: ConflictAlgorithm.abort, // duplicate -> throw, never overwrite
    );
  }

  // Checks if username + password exist. Returns a User, or null if wrong.
  Future<User?> login(String username, String password) async {
    final db = await database;

    final rows = await db.query(
      'users',
      // LOWER() on both sides makes the username case-insensitive, so
      // "tammam" and "Tammam" are the same account (passwords stay exact).
      where: 'LOWER(username) = ? AND password = ?',
      whereArgs: [username.toLowerCase(), password],
      limit: 1,
      // The ? marks are replaced by whereArgs safely.
      // NEVER build the query by joining strings (SQL injection risk).
    );

    if (rows.isEmpty) return null; // no match -> wrong login
    return User.fromMap(rows.first); // match -> turn the row into a User
  }

  // Returns every user.
  Future<List<User>> getAllUsers() async {
    final db = await database;
    final rows = await db.query('users');
    // Turn each Map row into a User object.
    return rows.map((row) => User.fromMap(row)).toList();
  }

  // Returns one user by id, or null if that id is gone.
  Future<User?> getUserById(int id) async {
    final db = await database;
    final rows = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return User.fromMap(rows.first);
  }

  // Checks if a username already exists (register screen + future edits).
  // Comparison is case-insensitive, so "Ali" cannot be registered twice as
  // "ali". excludeId lets a user keep their own name when editing a profile.
  Future<bool> usernameExists(String username, {int? excludeId}) async {
    final db = await database;
    final rows = await db.query(
      'users',
      where: excludeId == null
          ? 'LOWER(username) = ?'
          : 'LOWER(username) = ? AND id != ?',
      whereArgs: excludeId == null
          ? [username.toLowerCase()]
          : [username.toLowerCase(), excludeId],
      limit: 1,
    );
    return rows.isNotEmpty;
  }

  // Is this the password of user #id ? Used by the change-password screen to
  // confirm the CURRENT password before allowing a new one.
  Future<bool> verifyPassword(int id, String password) async {
    final db = await database;
    final rows = await db.query(
      'users',
      where: 'id = ? AND password = ?',
      whereArgs: [id, password],
      limit: 1,
    );
    return rows.isNotEmpty;
  }

  // Returns how many rows changed: 1 = success, 0 = no user with that id.
  Future<int> updatePassword(int id, String newPassword) async {
    final db = await database;
    return db.update(
      'users',
      {'password': newPassword},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  // =========================================================================
  // CATEGORIES
  // =========================================================================

  // Every category, A -> Z. Used by the expense form's dropdown.
  Future<List<Category>> getAllCategories() async {
    final db = await database;
    final rows = await db.query('categories', orderBy: 'name COLLATE NOCASE ASC');
    return rows.map((row) => Category.fromMap(row)).toList();
  }

  // One category, or null if it was deleted.
  Future<Category?> getCategoryById(int id) async {
    final db = await database;
    final rows = await db.query(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return Category.fromMap(rows.first);
  }

  // Is this category name already used? Case-insensitive, so "Food" and
  // "food" count as the same category. excludeId lets a category keep its own
  // name while being edited.
  Future<bool> categoryNameExists(String name, {int? excludeId}) async {
    final db = await database;
    final rows = await db.query(
      'categories',
      where: excludeId == null
          ? 'LOWER(name) = ?'
          : 'LOWER(name) = ? AND id != ?',
      whereArgs: excludeId == null
          ? [name.toLowerCase()]
          : [name.toLowerCase(), excludeId],
      limit: 1,
    );
    return rows.isNotEmpty;
  }

  // How many expenses use each category, as {categoryId: count}.
  //
  // ONE query with GROUP BY instead of one query per category. With ten
  // categories that is 1 round trip instead of 10 - the same "N+1 queries"
  // trap the expenses JOIN avoids.
  Future<Map<int, int>> getExpenseCountByCategory() async {
    final db = await database;
    final rows = await db.rawQuery('''
      SELECT category_id, COUNT(*) AS total
      FROM expenses
      WHERE category_id IS NOT NULL
      GROUP BY category_id
    ''');

    return {
      for (final row in rows)
        (row['category_id'] as int): (row['total'] as int),
    };
  }

  // CREATE - returns the id of the new row.
  Future<int> addCategory(Category category) async {
    final db = await database;

    final values = category.toMap();
    values.remove('id'); // let SQLite generate the id

    return db.insert('categories', values);
  }

  // UPDATE - returns the number of rows changed (1 = success, 0 = not found).
  Future<int> updateCategory(Category category) async {
    final db = await database;

    final id = category.id;
    if (id == null) {
      throw ArgumentError('Cannot update a category that has no id');
    }

    final values = category.toMap();
    values.remove('id'); // never overwrite the primary key

    return db.update('categories', values, where: 'id = ?', whereArgs: [id]);
  }

  // DELETE.
  //
  // expenses.category_id REFERENCES categories(id), and we switched foreign
  // keys ON, so SQLite REFUSES to delete a category that expenses still point
  // at. That is the database protecting the data - not a bug to work around.
  //
  // detachExpenses: true means the user chose "delete it anyway". We then set
  // those expenses' category_id to NULL first, so no expense is lost and none
  // is left pointing at a row that no longer exists.
  //
  // Both statements run inside a transaction: either BOTH happen or NEITHER
  // does. Without it, a crash between the two would leave the data broken.
  Future<int> deleteCategory(int id, {bool detachExpenses = false}) async {
    final db = await database;

    return db.transaction((txn) async {
      if (detachExpenses) {
        await txn.update(
          'expenses',
          {'category_id': null},
          where: 'category_id = ?',
          whereArgs: [id],
        );
      }
      return txn.delete('categories', where: 'id = ?', whereArgs: [id]);
    });
  }

  // =========================================================================
  // EXPENSES
  // =========================================================================

  // The SELECT used by every "read expenses" function.
  //
  // LEFT JOIN (not a plain JOIN): if the category was deleted, a plain JOIN
  // would make the expense disappear from the list. With LEFT JOIN the
  // expense still comes back, just with null category columns.
  //
  // The "AS category_name" aliases are what Expense.fromMap() reads.
  static const String _expenseSelect = '''
    SELECT
      e.id, e.title, e.amount, e.expense_date, e.category_id, e.notes,
      c.name  AS category_name,
      c.icon  AS category_icon,
      c.color AS category_color
    FROM expenses e
    LEFT JOIN categories c ON c.id = e.category_id
  ''';

  // CREATE - returns the id of the new row.
  Future<int> addExpense(Expense expense) async {
    final db = await database;

    final values = expense.toMap();
    values.remove('id'); // let SQLite generate the id

    return db.insert('expenses', values);
  }

  // READ - newest first. Two sort keys, because several expenses can share a
  // date; the id then keeps the order stable (last added on top).
  Future<List<Expense>> getAllExpenses() async {
    final db = await database;
    final rows = await db.rawQuery(
      '$_expenseSelect ORDER BY e.expense_date DESC, e.id DESC',
    );
    return rows.map((row) => Expense.fromMap(row)).toList();
  }

  // READ one - used by the details screen after an edit, so it always shows
  // fresh data. Returns null if the row was deleted meanwhile.
  Future<Expense?> getExpenseById(int id) async {
    final db = await database;
    final rows = await db.rawQuery('$_expenseSelect WHERE e.id = ?', [id]);
    if (rows.isEmpty) return null;
    return Expense.fromMap(rows.first);
  }

  // UPDATE - returns the number of rows changed (1 = success, 0 = not found).
  Future<int> updateExpense(Expense expense) async {
    final db = await database;

    final id = expense.id;
    if (id == null) {
      // Programming mistake, not a user mistake: an unsaved expense has no
      // row to update. Failing loudly here is better than silently doing
      // nothing and leaving the user thinking their edit was saved.
      throw ArgumentError('Cannot update an expense that has no id');
    }

    final values = expense.toMap();
    values.remove('id'); // never overwrite the primary key

    return db.update('expenses', values, where: 'id = ?', whereArgs: [id]);
  }

  // DELETE - returns the number of rows removed.
  Future<int> deleteExpense(int id) async {
    final db = await database;
    return db.delete('expenses', where: 'id = ?', whereArgs: [id]);
  }

  // =========================================================================
  // SEARCH AND FILTER   (FR16 - FR20)
  // =========================================================================

  // ONE function answers all five requirements, because they are the same
  // question with different pieces filled in:
  //
  //   FR16 search by name      -> text
  //   FR17 search by date      -> range   (a day, a month, anything)
  //   FR18 search by category  -> categoryId
  //   FR19 search by amount    -> minAmount / maxAmount ("more than", "less than")
  //   FR20 combined search     -> pass several at once; they are AND-ed
  //
  // Every parameter is optional (null = "do not filter on this"), so the
  // search screen can send only the fields the user actually filled in.
  // Passing nothing at all returns the whole list, exactly like
  // getAllExpenses().
  //
  // HOW THE QUERY IS BUILT
  // We collect the conditions in a list and join them with AND. The VALUES
  // are never glued into the SQL text - they go into `args` and SQLite puts
  // them in the ? holes itself. That is what makes SQL injection impossible:
  // a user typing  ' OR 1=1 --  into the search box searches for that text,
  // it does not become part of the query.
  Future<List<Expense>> searchExpenses({
    String? text,
    DateRange? range,
    int? categoryId,
    double? minAmount,
    double? maxAmount,
  }) async {
    final db = await database;

    final conditions = <String>[];
    final args = <Object?>[];

    // ---- FR16: by name ----
    // LIKE '%word%' means "contains word". SQLite's LIKE ignores upper/lower
    // case for plain letters, so "taxi" also finds "Taxi".
    final trimmed = text?.trim() ?? '';
    if (trimmed.isNotEmpty) {
      conditions.add('e.title LIKE ?');
      args.add('%$trimmed%');
    }

    // ---- FR17: by date ----
    // Dates are stored as 'yyyy-MM-dd' text, and BETWEEN compares that text.
    // It gives the right answer only because that format sorts correctly -
    // this is exactly why formatters.dart forbids saving any other format.
    if (range != null) {
      conditions.add('e.expense_date BETWEEN ? AND ?');
      args.add(toDbDate(range.start));
      args.add(toDbDate(range.end));
    }

    // ---- FR18: by category ----
    if (categoryId != null) {
      conditions.add('e.category_id = ?');
      args.add(categoryId);
    }

    // ---- FR19: by amount ----
    // Sent separately so the user can ask for only one side ("more than 500")
    // or both ("between 100 and 500").
    if (minAmount != null) {
      conditions.add('e.amount >= ?');
      args.add(minAmount);
    }
    if (maxAmount != null) {
      conditions.add('e.amount <= ?');
      args.add(maxAmount);
    }

    // ---- FR20: everything above is combined with AND ----
    final where = conditions.isEmpty ? '' : 'WHERE ${conditions.join(' AND ')}';

    final rows = await db.rawQuery(
      '$_expenseSelect $where ORDER BY e.expense_date DESC, e.id DESC',
      args,
    );
    return rows.map((row) => Expense.fromMap(row)).toList();
  }

  // =========================================================================
  // INCOMES
  // =========================================================================
  //
  // Simpler than expenses: no category, so no JOIN is needed and the plain
  // query/insert/update/delete helpers of sqflite are enough.

  // CREATE - returns the id of the new row.
  Future<int> addIncome(Income income) async {
    final db = await database;

    final values = income.toMap();
    values.remove('id'); // let SQLite generate the id

    return db.insert('incomes', values);
  }

  // READ - newest first. The id is the second sort key so incomes added on
  // the same day keep a stable order (last added on top).
  Future<List<Income>> getAllIncomes() async {
    final db = await database;
    final rows = await db.query(
      'incomes',
      orderBy: 'income_date DESC, id DESC',
    );
    return rows.map((row) => Income.fromMap(row)).toList();
  }

  // READ one - returns null if the row was deleted meanwhile.
  Future<Income?> getIncomeById(int id) async {
    final db = await database;
    final rows = await db.query(
      'incomes',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return Income.fromMap(rows.first);
  }

  // UPDATE - returns the number of rows changed (1 = success, 0 = not found).
  Future<int> updateIncome(Income income) async {
    final db = await database;

    final id = income.id;
    if (id == null) {
      // Programming mistake, not a user mistake: an unsaved income has no row
      // to update. Failing loudly beats silently saving nothing.
      throw ArgumentError('Cannot update an income that has no id');
    }

    final values = income.toMap();
    values.remove('id'); // never overwrite the primary key

    return db.update('incomes', values, where: 'id = ?', whereArgs: [id]);
  }

  // DELETE - returns the number of rows removed.
  Future<int> deleteIncome(int id) async {
    final db = await database;
    return db.delete('incomes', where: 'id = ?', whereArgs: [id]);
  }

  // =========================================================================
  // HELPER - development only
  // =========================================================================

  // Deletes the whole database file. Call once after changing CREATE TABLE,
  // then restart the app so the tables rebuild from zero.
  Future<void> deleteEverything() async {
    final path = join(await getDatabasesPath(), 'app.db');
    await deleteDatabase(path);
    _db = null;
  }
}
```

================================================================================
FILE: lib/incomes/add_income_screen.dart
================================================================================

```dart
// ===========================================================================
// add_income_screen.dart  -  FR10: record a salary or any other income
// (CREATE).
//
// Short on purpose: the fields and the rules live in widgets/income_form.dart.
// This screen only says what "Save" does - hand the income to the provider
// and close. The provider stores it and refreshes every screen showing income.
// ===========================================================================

import 'package:flutter/material.dart';

import '../providers/income_provider.dart';
import '../widgets/income_form.dart';

class AddIncomeScreen extends StatelessWidget {
  const AddIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Income')),
      body: IncomeForm(
        submitLabel: 'ADD INCOME',
        onSave: (income) async {
          await IncomeProvider().addIncome(income);

          // context.mounted: the screen may have been closed while the
          // database was writing. Using a dead context crashes the app.
          if (!context.mounted) return;

          Navigator.pop(context, true);
        },
      ),
    );
  }
}
```

================================================================================
FILE: lib/incomes/edit_income_screen.dart
================================================================================

```dart
// ===========================================================================
// edit_income_screen.dart  -  FR11: change the value (or any other field) of
// an existing income (UPDATE).
//
// The twin of add_income_screen.dart. Two differences: it receives the income
// and hands it to the form as `initial` so the fields start filled in, and
// "Save" calls updateIncome() instead of addIncome().
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/income.dart';
import '../providers/income_provider.dart';
import '../widgets/income_form.dart';

class EditIncomeScreen extends StatelessWidget {
  final Income income;

  const EditIncomeScreen({super.key, required this.income});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Income')),
      body: IncomeForm(
        initial: income, // <- the only real difference
        submitLabel: 'SAVE CHANGES',
        onSave: (updated) async {
          // false = 0 rows changed, so the income was deleted meanwhile.
          final saved = await IncomeProvider().updateIncome(updated);
          if (!context.mounted) return;

          if (!saved) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('This income no longer exists')),
            );
            return;
          }

          Navigator.pop(context, true);
        },
      ),
    );
  }
}
```

================================================================================
FILE: lib/incomes/incomes_screen.dart
================================================================================

```dart
// ===========================================================================
// incomes_screen.dart  -  the income module's home: the list of all incomes
// (READ) plus the entry points to add (FR10), edit (FR11) and delete (FR12).
//
// The mirror image of expenses_list_screen.dart: the screen owns no data, it
// listens to IncomeProvider and redraws when the provider says so.
//
// Delete lives here rather than on a details screen: the specification asks
// for add / edit / delete only, so income has no details screen.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/income.dart';
import '../providers/income_provider.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../widgets/app_drawer.dart';
import '../widgets/income_card.dart';
import 'add_income_screen.dart';
import 'edit_income_screen.dart';

class IncomesScreen extends StatefulWidget {
  // Needed only so this screen can show the same side menu as the dashboard.
  final User user;

  const IncomesScreen({super.key, required this.user});

  @override
  State<IncomesScreen> createState() => _IncomesScreenState();
}

class _IncomesScreenState extends State<IncomesScreen> {
  // The one shared IncomeProvider - the same object the dashboard listens to.
  final IncomeProvider provider = IncomeProvider();

  @override
  void initState() {
    super.initState();
    // Safe from initState: the provider defers its first notification.
    provider.loadIncomes();
  }

  void _showMessage(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? kExpenseColor : kIncomeColor,
      ),
    );
  }

  // No reload afterwards: the add and edit screens write through the
  // provider, and the provider redraws this list by itself.
  void openScreen(Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  // FR12: delete, but never without asking first.
  Future<void> confirmAndDelete(Income income) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete income'),
        // Naming the row in the question prevents "wrong row" accidents.
        content: Text(
          'Delete "${income.title}" (${formatAmount(income.amount)})?\n'
              'This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            style: TextButton.styleFrom(foregroundColor: kExpenseColor),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    // null = the dialog was dismissed by tapping outside it.
    if (confirmed != true || !mounted) return;

    try {
      await provider.deleteIncome(income.id!);
      if (!mounted) return;
      _showMessage('Income deleted', isError: false);
    } catch (e) {
      if (!mounted) return;
      _showMessage('Could not delete the income. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Incomes'),
        actions: const [LogoutAction()],
      ),
      drawer: AppDrawer(user: widget.user),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => openScreen(const AddIncomeScreen()),
        backgroundColor: kIncomeColor,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),

      // Everything that depends on the data sits inside the builder, so only
      // that part is rebuilt when the provider changes.
      body: ListenableBuilder(
        listenable: provider,
        builder: (context, _) => buildBody(),
      ),
    );
  }

  // Keeping the body in its own method means one look at build() tells you
  // the whole screen; the four states are separated here.
  Widget buildBody() {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                provider.errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: provider.loadIncomes,
                  child: const Text('Try again'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final incomes = provider.incomes;

    if (incomes.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.savings, size: 72, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'No income recorded yet',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Tap "Add" to record your salary or any other income.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    // RefreshIndicator = pull the list down to reload it.
    return RefreshIndicator(
      onRefresh: provider.loadIncomes,
      child: ListView.builder(
        // .builder only builds the visible rows, so a long list stays smooth.
        padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 90),
        itemCount: incomes.length,
        itemBuilder: (context, index) {
          final income = incomes[index];
          return IncomeCard(
            income: income,
            // Tapping the row and choosing "Edit" do the same thing, so the
            // action is easy to reach either way.
            onTap: () => openScreen(EditIncomeScreen(income: income)),
            onEdit: () => openScreen(EditIncomeScreen(income: income)),
            onDelete: () => confirmAndDelete(income),
          );
        },
      ),
    );
  }
}
```

================================================================================
FILE: lib/categories/categories_screen.dart
================================================================================

```dart
// ===========================================================================
// categories_screen.dart  -  the category module: add (FR13), edit (FR14)
// and delete (FR15) the categories that expenses are grouped by.
//
// The form itself lives in widgets/category_form_sheet.dart; this screen owns
// the list, the database calls and the rules that need the database:
//   - a category name cannot be used twice
//   - a category still used by expenses cannot just disappear
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/category.dart';
import '../database/database_helper.dart';
import '../utils/constants.dart';
import '../utils/category_style.dart';
import '../widgets/app_drawer.dart';
import '../widgets/category_form_sheet.dart';

class CategoriesScreen extends StatefulWidget {
  // Needed only so this screen can show the same side menu as the dashboard.
  final User user;

  const CategoriesScreen({super.key, required this.user});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categories = [];

  // {categoryId: how many expenses use it}. Loaded in ONE query next to the
  // categories, so the list can show "3 expenses" without a query per row.
  Map<int, int> expenseCounts = {};

  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final db = DatabaseHelper();
      final rows = await db.getAllCategories();
      final counts = await db.getExpenseCountByCategory();
      if (!mounted) return;

      setState(() {
        categories = rows;
        expenseCounts = counts;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Could not load your categories.';
        isLoading = false;
      });
    }
  }

  void _showMessage(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? kExpenseColor : kIncomeColor,
      ),
    );
  }

  // -------------------------------------------------------------------------
  // FR13 / FR14 - add and edit share one form and one save function.
  // `initial` null means "add", otherwise "edit".
  // -------------------------------------------------------------------------
  Future<void> openForm({Category? initial}) async {
    await showCategoryFormSheet(
      context,
      initial: initial,
      onSave: (category) async {
        // The rule that needs the database. excludeId lets a category keep
        // its own name while being edited (without it, saving "Food" as
        // "Food" would report a duplicate of itself).
        final taken = await DatabaseHelper().categoryNameExists(
          category.name,
          excludeId: category.id,
        );
        if (taken) return 'A category with this name already exists';

        if (category.id == null) {
          await DatabaseHelper().addCategory(category);
        } else {
          final changed = await DatabaseHelper().updateCategory(category);
          if (changed == 0) return 'This category no longer exists';
        }

        return null; // null = saved, the sheet closes itself
      },
    );

    if (!mounted) return;
    await loadCategories(); // reload whether it was saved or cancelled
  }

  // -------------------------------------------------------------------------
  // FR15 - delete, with two different questions.
  // -------------------------------------------------------------------------
  Future<void> confirmAndDelete(Category category) async {
    final used = expenseCounts[category.id] ?? 0;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete category'),
        content: Text(
          used == 0
              // Nothing depends on it: a plain confirmation.
              ? 'Delete "${category.name}"?\nThis cannot be undone.'
              // Something depends on it: say exactly what will happen to it.
              // Deleting the expenses too would destroy the user's records,
              // so we only remove the link - the expenses stay, without a
              // category, and can be edited to a new one later.
              : '"${category.name}" is used by $used '
                  '${used == 1 ? 'expense' : 'expenses'}.\n\n'
                  'Those expenses will be kept but will have no category.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            style: TextButton.styleFrom(foregroundColor: kExpenseColor),
            child: Text(used == 0 ? 'Delete' : 'Delete anyway'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    try {
      await DatabaseHelper().deleteCategory(
        category.id!,
        // Only pass true when it is really needed, so the foreign key still
        // guards every other case.
        detachExpenses: used > 0,
      );
      if (!mounted) return;
      _showMessage('Category deleted', isError: false);
      await loadCategories();
    } catch (e) {
      if (!mounted) return;
      _showMessage('Could not delete the category. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      drawer: AppDrawer(user: widget.user),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => openForm(),
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),

      body: buildBody(),
    );
  }

  Widget buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: loadCategories,
                  child: const Text('Try again'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (categories.isEmpty) {
      // Expenses cannot be saved without a category, so this screen explains
      // the consequence instead of just saying "empty".
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.category_outlined, size: 72, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'No categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Add at least one category - an expense cannot be saved '
                'without one.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: loadCategories,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 90),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final color = categoryColor(category.color);
          final used = expenseCounts[category.id] ?? 0;

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kRadius),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: kPadding, right: 4),
              leading: CircleAvatar(
                backgroundColor: color.withValues(alpha: 0.15),
                child: Icon(categoryIcon(category.icon), color: color),
              ),
              title: Text(
                category.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                used == 0
                    ? 'Not used yet'
                    : '$used ${used == 1 ? 'expense' : 'expenses'}',
              ),
              trailing: PopupMenuButton<String>(
                tooltip: 'Actions',
                onSelected: (value) {
                  if (value == 'edit') openForm(initial: category);
                  if (value == 'delete') confirmAndDelete(category);
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: 'edit',
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.edit, color: kPrimaryColor),
                      title: Text('Edit'),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.delete, color: kExpenseColor),
                      title: Text('Delete'),
                    ),
                  ),
                ],
              ),
              // Tapping the row opens the same edit form as the menu.
              onTap: () => openForm(initial: category),
            ),
          );
        },
      ),
    );
  }
}

```

================================================================================
FILE: lib/models/category.dart
================================================================================

```dart
// ===========================================================================
// category.dart  -  the Category model  (e.g. Food, Transport, Bills).
//
// Mirrors the categories table from the specification:
//    categories(id, name, icon, color)
//
// Both icon and color are TEXT columns, so we store TEXT:
//   icon  -> a key such as 'food' (see utils/category_style.dart)
//   color -> a hex string such as '#D2544F'
//
// WHY NOT STORE THE ICON AS A NUMBER (its codePoint)?
// Because building an IconData from a number at runtime is not constant, and
// Flutter's release build ("tree shaking") removes icons it cannot see being
// used - the app would then show blank squares. A key + a fixed map keeps
// every icon constant and safe.
// ===========================================================================

class Category {
  final int? id;
  final String name;
  final String icon; // key into kCategoryIcons
  final String color; // '#RRGGBB'

  Category({
    this.id,
    required this.name,
    this.icon = 'other',
    this.color = '#1E5F8C',
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'icon': icon, 'color': color};
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int?,
      name: (map['name'] as String?) ?? '',
      // Old or hand-written rows may hold null; fall back to safe defaults.
      icon: (map['icon'] as String?) ?? 'other',
      color: (map['color'] as String?) ?? '#1E5F8C',
    );
  }

  Category copyWith({int? id, String? name, String? icon, String? color}) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      color: color ?? this.color,
    );
  }
}

```

================================================================================
FILE: lib/models/expense.dart
================================================================================

```dart
// ===========================================================================
// expense.dart  -  the Expense model  (money going OUT).
//
// Mirrors the expenses table from the specification:
//    expenses(id, title, amount, expense_date, category_id, notes)
//
// The Dart names are camelCase, the columns are snake_case; toMap/fromMap do
// the translation so no screen ever writes a column name by hand.
// ===========================================================================

import '../utils/formatters.dart';

class Expense {
  final int? id;
  final String title;
  final double amount;
  final DateTime expenseDate;
  final int? categoryId; // null = the category was deleted
  final String notes;

  // -------------------------------------------------------------------------
  // DISPLAY-ONLY FIELDS
  // -------------------------------------------------------------------------
  // These do NOT exist in the expenses table. getAllExpenses() JOINs the
  // categories table and fills them in, so a list can show the category name,
  // icon and color without asking the database once per row (the classic
  // "N+1 queries" mistake). They are never written back - see toMap().
  final String? categoryName;
  final String? categoryIcon;
  final String? categoryColor;

  Expense({
    this.id,
    required this.title,
    required this.amount,
    required this.expenseDate,
    this.categoryId,
    this.notes = '',
    this.categoryName,
    this.categoryIcon,
    this.categoryColor,
  });

  // Object -> Map (for saving). Only real columns are listed here.
  // 'id' is included so update() knows which row to change; on insert it is
  // null and SQLite generates the value.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'expense_date': toDbDate(expenseDate), // always 'yyyy-MM-dd'
      'category_id': categoryId,
      'notes': notes,
    };
  }

  // Map -> Object (for reading).
  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'] as int?,
      title: (map['title'] as String?) ?? '',
      // A REAL column can come back as int (e.g. 20 instead of 20.0),
      // so we read it as num and convert. Casting straight to double crashes.
      amount: (map['amount'] as num?)?.toDouble() ?? 0.0,
      expenseDate: parseDbDate(map['expense_date'] as String?),
      categoryId: map['category_id'] as int?,
      notes: (map['notes'] as String?) ?? '',
      // Present only when the query JOINed the categories table.
      categoryName: map['category_name'] as String?,
      categoryIcon: map['category_icon'] as String?,
      categoryColor: map['category_color'] as String?,
    );
  }

  Expense copyWith({
    int? id,
    String? title,
    double? amount,
    DateTime? expenseDate,
    int? categoryId,
    String? notes,
  }) {
    return Expense(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      expenseDate: expenseDate ?? this.expenseDate,
      categoryId: categoryId ?? this.categoryId,
      notes: notes ?? this.notes,
      categoryName: categoryName,
      categoryIcon: categoryIcon,
      categoryColor: categoryColor,
    );
  }
}

```

================================================================================
FILE: lib/models/income.dart
================================================================================

```dart
// ===========================================================================
// income.dart  -  the Income model  (money coming IN).
//
// Mirrors the incomes table from the specification:
//    incomes(id, title, amount, income_date, notes)
//
// Same shape as expense.dart, minus the category: income is not classified in
// this project, so there is no category_id and no JOIN.
// ===========================================================================

import '../utils/formatters.dart';

class Income {
  final int? id;
  final String title;
  final double amount;
  final DateTime incomeDate;
  final String notes;

  Income({
    this.id,
    required this.title,
    required this.amount,
    required this.incomeDate,
    this.notes = '',
  });

  // Object -> Map (for saving). The date is written in the database format
  // 'yyyy-MM-dd' - never the pretty screen format.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'income_date': toDbDate(incomeDate),
      'notes': notes,
    };
  }

  // Map -> Object (for reading).
  factory Income.fromMap(Map<String, dynamic> map) {
    return Income(
      id: map['id'] as int?,
      title: (map['title'] as String?) ?? '',
      // A REAL column can come back as int (20 instead of 20.0), so we read
      // it as num first. Casting straight to double crashes.
      amount: (map['amount'] as num?)?.toDouble() ?? 0.0,
      incomeDate: parseDbDate(map['income_date'] as String?),
      notes: (map['notes'] as String?) ?? '',
    );
  }

  Income copyWith({
    int? id,
    String? title,
    double? amount,
    DateTime? incomeDate,
    String? notes,
  }) {
    return Income(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      incomeDate: incomeDate ?? this.incomeDate,
      notes: notes ?? this.notes,
    );
  }
}

```

================================================================================
FILE: lib/models/user.dart
================================================================================

```dart
// ===========================================================================
// user.dart  -  the User model.
//
// A "model" is a plain class that describes ONE thing in the app.
// The database speaks Maps; our screens speak objects. This class translates
// between the two using toMap() and fromMap().
//
// The users table is:
//    users(id, username, password, full_name)
// so the model must carry full_name too - the drawer and the dashboard greet
// the user by their real name, not by their login name.
// ===========================================================================

class User {
  final int? id; // null before saving; the database fills it in
  final String username;
  final String password;
  final String fullName;

  User({
    this.id,
    required this.username,
    required this.password,
    this.fullName = '',
  });

  // What the screens should print.
  //
  // Registration asks for a full name, but the two seeded test accounts and
  // any older row could still have it empty, so we fall back to the username
  // instead of showing a blank space where a name should be.
  String get displayName => fullName.trim().isEmpty ? username : fullName;

  // Object  ->  Map   (used when SAVING to the database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'full_name': fullName,
    };
  }

  // Map  ->  Object   (used when READING from the database)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int?,
      username: map['username'] as String,
      password: map['password'] as String,
      // full_name can be NULL for rows written before this column was used,
      // so we never cast it straight to String.
      fullName: (map['full_name'] as String?) ?? '',
    );
  }

  // Returns a copy with some fields changed. Used after a password change:
  // the screen gets a NEW User object instead of editing a final field.
  User copyWith({int? id, String? username, String? password, String? fullName}) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
    );
  }
}
```

================================================================================
FILE: test/widget_test.dart
================================================================================

```dart
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:final_project/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

```

