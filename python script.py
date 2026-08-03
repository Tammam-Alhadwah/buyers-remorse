from pathlib import Path
import os

# ==========================================================
# Flutter Project Exporter for Claude / ChatGPT / Gemini
# ==========================================================

# Change this to your Flutter project path
PROJECT_ROOT = Path(r".")  # Current folder

OUTPUT_FILE = PROJECT_ROOT / "PROJECT_CONTEXT.md"

# Folders to export
EXPORT_FOLDERS = [
    "lib",
    "bin",
    "test"
]

# Individual files
EXPORT_FILES = [
    "pubspec.yaml",
    "pubspec.lock",
    "analysis_options.yaml",
    ".metadata",
]

# Ignore folders
IGNORE_DIRS = {
    ".git",
    ".dart_tool",
    ".idea",
    ".vscode",
    "build",
    "android/.gradle",
    "ios/Pods",
    "linux/flutter",
    "macos/Flutter",
    "windows/flutter",
}

# Ignore file extensions
IGNORE_EXTENSIONS = {
    ".png",
    ".jpg",
    ".jpeg",
    ".gif",
    ".webp",
    ".svg",
    ".ico",
    ".mp3",
    ".wav",
    ".ogg",
    ".mp4",
    ".avi",
    ".mov",
    ".pdf",
    ".keystore",
    ".apk",
    ".aab",
    ".zip",
}

# Maximum size per file
#MAX_FILE_SIZE = 1024 * 1024 * 2  # 2 MB


def is_ignored(path: Path):
    for part in path.parts:
        if part in IGNORE_DIRS:
            return True

    if path.suffix.lower() in IGNORE_EXTENSIONS:
        return True

    return False


def write_tree(root: Path, output):
    output.write("# PROJECT STRUCTURE\n\n")

    for current, dirs, files in os.walk(root):

        rel = Path(current).relative_to(root)

        dirs[:] = [
            d for d in dirs
            if not is_ignored(rel / d)
        ]

        level = len(rel.parts)

        indent = "    " * level

        output.write(f"{indent}{rel if str(rel)!='.' else root.name}/\n")

        for f in sorted(files):
            fp = rel / f

            if is_ignored(fp):
                continue

            output.write(f"{indent}    {f}\n")

    output.write("\n\n")


def export_file(path: Path, output):
    try:
        if not path.exists():
            return

        if path.stat().st_size > MAX_FILE_SIZE:
            output.write(f"# FILE: {path}\n")
            output.write("Skipped (too large)\n\n")
            return

        text = path.read_text(encoding="utf-8", errors="ignore")

        output.write("=" * 80 + "\n")
        output.write(f"FILE: {path.as_posix()}\n")
        output.write("=" * 80 + "\n\n")

        output.write("```")

        if path.suffix == ".dart":
            output.write("dart")
        elif path.suffix == ".yaml":
            output.write("yaml")
        elif path.suffix == ".json":
            output.write("json")

        output.write("\n")
        output.write(text)
        output.write("\n```\n\n")

    except Exception as e:
        output.write(f"Could not read {path}: {e}\n\n")


def export_folder(folder: Path, output):

    if not folder.exists():
        return

    for current, dirs, files in os.walk(folder):

        rel = Path(current).relative_to(PROJECT_ROOT)

        dirs[:] = [
            d for d in dirs
            if not is_ignored(rel / d)
        ]

        for file in sorted(files):

            fp = rel / file

            if is_ignored(fp):
                continue

            export_file(PROJECT_ROOT / fp, output)


def main():

    with open(OUTPUT_FILE, "w", encoding="utf-8") as output:

        output.write("# FLUTTER PROJECT EXPORT\n\n")

        output.write(
            "This file was automatically generated.\n"
            "It contains the Flutter project structure and source code.\n\n"
        )

        write_tree(PROJECT_ROOT, output)

        output.write("# PROJECT FILES\n\n")

        for f in EXPORT_FILES:
            export_file(PROJECT_ROOT / f, output)

        for folder in EXPORT_FOLDERS:
            export_folder(PROJECT_ROOT / folder, output)

    print()
    print("=" * 70)
    print("Done!")
    print(f"Output written to:\n{OUTPUT_FILE}")
    print("=" * 70)


if __name__ == "__main__":
    main()