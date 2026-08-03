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
    android/
        .gitignore
        build.gradle.kts
        gradle.properties
        gradlew
        gradlew.bat
        local.properties
        settings.gradle.kts
        android\app/
            build.gradle.kts
            android\app\src/
                android\app\src\debug/
                    AndroidManifest.xml
                android\app\src\main/
                    AndroidManifest.xml
                    android\app\src\main\java/
                        android\app\src\main\java\io/
                            android\app\src\main\java\io\flutter/
                                android\app\src\main\java\io\flutter\plugins/
                                    GeneratedPluginRegistrant.java
                    android\app\src\main\kotlin/
                        android\app\src\main\kotlin\com/
                            android\app\src\main\kotlin\com\example/
                                android\app\src\main\kotlin\com\example\final_project/
                                    MainActivity.kt
                    android\app\src\main\res/
                        android\app\src\main\res\drawable/
                            launch_background.xml
                        android\app\src\main\res\drawable-v21/
                            launch_background.xml
                        android\app\src\main\res\mipmap-hdpi/
                        android\app\src\main\res\mipmap-mdpi/
                        android\app\src\main\res\mipmap-xhdpi/
                        android\app\src\main\res\mipmap-xxhdpi/
                        android\app\src\main\res\mipmap-xxxhdpi/
                        android\app\src\main\res\values/
                            styles.xml
                        android\app\src\main\res\values-night/
                            styles.xml
                android\app\src\profile/
                    AndroidManifest.xml
        android\gradle/
            android\gradle\wrapper/
                gradle-wrapper.jar
                gradle-wrapper.properties
    ios/
        .gitignore
        ios\Flutter/
            AppFrameworkInfo.plist
            Debug.xcconfig
            Generated.xcconfig
            Release.xcconfig
            flutter_export_environment.sh
            ios\Flutter\ephemeral/
                flutter_lldb_helper.py
                flutter_lldbinit
                flutter_native_integration.env
                ios\Flutter\ephemeral\Packages/
                    ios\Flutter\ephemeral\Packages\.packages/
                    ios\Flutter\ephemeral\Packages\FlutterGeneratedPluginSwiftPackage/
                        Package.swift
                        ios\Flutter\ephemeral\Packages\FlutterGeneratedPluginSwiftPackage\Sources/
                            ios\Flutter\ephemeral\Packages\FlutterGeneratedPluginSwiftPackage\Sources\FlutterGeneratedPluginSwiftPackage/
                                FlutterGeneratedPluginSwiftPackage.swift
        ios\Runner/
            AppDelegate.swift
            GeneratedPluginRegistrant.h
            GeneratedPluginRegistrant.m
            Info.plist
            Runner-Bridging-Header.h
            SceneDelegate.swift
            ios\Runner\Assets.xcassets/
                ios\Runner\Assets.xcassets\AppIcon.appiconset/
                    Contents.json
                ios\Runner\Assets.xcassets\LaunchImage.imageset/
                    Contents.json
                    README.md
            ios\Runner\Base.lproj/
                LaunchScreen.storyboard
                Main.storyboard
        ios\Runner.xcodeproj/
            project.pbxproj
            ios\Runner.xcodeproj\project.xcworkspace/
                contents.xcworkspacedata
                ios\Runner.xcodeproj\project.xcworkspace\xcshareddata/
                    IDEWorkspaceChecks.plist
                    WorkspaceSettings.xcsettings
            ios\Runner.xcodeproj\xcshareddata/
                ios\Runner.xcodeproj\xcshareddata\xcschemes/
                    Runner.xcscheme
        ios\Runner.xcworkspace/
            contents.xcworkspacedata
            ios\Runner.xcworkspace\xcshareddata/
                IDEWorkspaceChecks.plist
                WorkspaceSettings.xcsettings
        ios\RunnerTests/
            RunnerTests.swift
    lib/
        main.dart
        lib\categories/
            categories_screen.dart
        lib\database/
            database_helper.dart
        lib\expenses/
            add_expense_screen.dart
            edit_expense_screen.dart
            expenses_list_screen.dart
        lib\incomes/
            add_income_screen.dart
            incomes_screen.dart
        lib\models/
            category.dart
            expense.dart
            income.dart
            user.dart
        lib\providers/
            expense_provider.dart
            income_provider.dart
        lib\reports/
            reports_screen.dart
        lib\screens/
            dashboard_screen.dart
            login_screen.dart
            register_screen.dart
        lib\theme/
            app_theme.dart
        lib\utils/
            constants.dart
        lib\widgets/
            custom_button.dart
            dashboard_card.dart
            expense_card.dart
    linux/
        .gitignore
        CMakeLists.txt
        linux\flutter/
            CMakeLists.txt
            generated_plugin_registrant.cc
            generated_plugin_registrant.h
            generated_plugins.cmake
            linux\flutter\ephemeral/
                linux\flutter\ephemeral\.plugin_symlinks/
        linux\runner/
            CMakeLists.txt
            main.cc
            my_application.cc
            my_application.h
    macos/
        .gitignore
        macos\Flutter/
            Flutter-Debug.xcconfig
            Flutter-Release.xcconfig
            GeneratedPluginRegistrant.swift
            macos\Flutter\ephemeral/
                Flutter-Generated.xcconfig
                flutter_export_environment.sh
                flutter_native_integration.env
                macos\Flutter\ephemeral\Packages/
                    macos\Flutter\ephemeral\Packages\.packages/
                    macos\Flutter\ephemeral\Packages\FlutterGeneratedPluginSwiftPackage/
                        Package.swift
                        macos\Flutter\ephemeral\Packages\FlutterGeneratedPluginSwiftPackage\Sources/
                            macos\Flutter\ephemeral\Packages\FlutterGeneratedPluginSwiftPackage\Sources\FlutterGeneratedPluginSwiftPackage/
                                FlutterGeneratedPluginSwiftPackage.swift
        macos\Runner/
            AppDelegate.swift
            DebugProfile.entitlements
            Info.plist
            MainFlutterWindow.swift
            Release.entitlements
            macos\Runner\Assets.xcassets/
                macos\Runner\Assets.xcassets\AppIcon.appiconset/
                    Contents.json
            macos\Runner\Base.lproj/
                MainMenu.xib
            macos\Runner\Configs/
                AppInfo.xcconfig
                Debug.xcconfig
                Release.xcconfig
                Warnings.xcconfig
        macos\Runner.xcodeproj/
            project.pbxproj
            macos\Runner.xcodeproj\project.xcworkspace/
                macos\Runner.xcodeproj\project.xcworkspace\xcshareddata/
                    IDEWorkspaceChecks.plist
            macos\Runner.xcodeproj\xcshareddata/
                macos\Runner.xcodeproj\xcshareddata\xcschemes/
                    Runner.xcscheme
        macos\Runner.xcworkspace/
            contents.xcworkspacedata
            macos\Runner.xcworkspace\xcshareddata/
                IDEWorkspaceChecks.plist
        macos\RunnerTests/
            RunnerTests.swift
    test/
        widget_test.dart
    web/
        index.html
        manifest.json
        web\icons/
    windows/
        .gitignore
        CMakeLists.txt
        windows\flutter/
            CMakeLists.txt
            generated_plugin_registrant.cc
            generated_plugin_registrant.h
            generated_plugins.cmake
            windows\flutter\ephemeral/
                flutter_export.h
                flutter_messenger.h
                flutter_plugin_registrar.h
                flutter_texture_registrar.h
                flutter_windows.dll
                flutter_windows.dll.exp
                flutter_windows.dll.lib
                flutter_windows.dll.pdb
                flutter_windows.h
                generated_config.cmake
                icudtl.dat
                windows\flutter\ephemeral\.plugin_symlinks/
                windows\flutter\ephemeral\cpp_client_wrapper/
                    binary_messenger_impl.h
                    byte_buffer_streams.h
                    core_implementations.cc
                    engine_method_result.cc
                    flutter_engine.cc
                    flutter_view_controller.cc
                    plugin_registrar.cc
                    readme
                    standard_codec.cc
                    texture_registrar_impl.h
                    windows\flutter\ephemeral\cpp_client_wrapper\include/
                        windows\flutter\ephemeral\cpp_client_wrapper\include\flutter/
                            basic_message_channel.h
                            binary_messenger.h
                            byte_streams.h
                            dart_project.h
                            encodable_value.h
                            engine_method_result.h
                            event_channel.h
                            event_sink.h
                            event_stream_handler.h
                            event_stream_handler_functions.h
                            flutter_engine.h
                            flutter_view.h
                            flutter_view_controller.h
                            message_codec.h
                            method_call.h
                            method_channel.h
                            method_codec.h
                            method_result.h
                            method_result_functions.h
                            plugin_registrar.h
                            plugin_registrar_windows.h
                            plugin_registry.h
                            standard_codec_serializer.h
                            standard_message_codec.h
                            standard_method_codec.h
                            texture_registrar.h
        windows\runner/
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
            windows\runner\resources/


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
FILE: lib/categories/categories_screen.dart
================================================================================

```dart
// ===========================================================================
// categories_screen.dart  -  manage categories: add, rename, delete
//
// STUB for a later task. It compiles and shows a simple placeholder so you
// can navigate to it. Replace the body when you build this feature.
// ===========================================================================

import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CategoriesScreen')),
      body: const Center(
        child: Text('CategoriesScreen - coming soon'),
      ),
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
// like login() or addUser().
// ===========================================================================

import 'package:path/path.dart'; // gives us join()
import 'package:sqflite/sqflite.dart'; // gives us the database

import '../models/user.dart';

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
      version: 1, // increase this if you change the tables
      onCreate: _createTables, // runs ONLY when the file is first created
    );
  }

  // -------------------------------------------------------------------------
  // CREATING THE TABLES
  // -------------------------------------------------------------------------
  Future<void> _createTables(Database db, int version) async {
    // ---- USERS table (used now, in Task 1) ----
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

  }

  // =========================================================================
  // CREATE - add data
  // =========================================================================

  // Adds a new user. Returns the id of the new row.
  Future<int> addUser(String username, String password) async {
    final db = await database;
    return db.insert('users', {'username': username, 'password': password});
  }

  // =========================================================================
  // READ - get data
  // =========================================================================

  // Checks if username + password exist. Returns a User, or null if wrong.
  Future<User?> login(String username, String password) async {
    final db = await database;

    final rows = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
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

  // Checks if a username already exists (for the register screen later).
  Future<bool> usernameExists(String username) async {
    final db = await database;
    final rows = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );
    return rows.isNotEmpty;
  }

  // =========================================================================
  // UPDATE - change data
  // =========================================================================

  Future<int> updatePassword(int id, String newPassword) async {
    final db = await database;
    return db.update(
      'users',
      {'password': newPassword},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // =========================================================================
  // DELETE - remove data
  // =========================================================================

  Future<int> deleteUser(int id) async {
    final db = await database;
    return db.delete('users', where: 'id = ?', whereArgs: [id]);
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
FILE: lib/expenses/add_expense_screen.dart
================================================================================

```dart
// ===========================================================================
// add_expense_screen.dart  -  form to add a new expense (CREATE)
//
// STUB for a later task. It compiles and shows a simple placeholder so you
// can navigate to it. Replace the body when you build this feature.
// ===========================================================================

import 'package:flutter/material.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AddExpenseScreen')),
      body: const Center(
        child: Text('AddExpenseScreen - coming soon'),
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
// edit_expense_screen.dart  -  form to edit an existing expense (UPDATE)
//
// STUB for a later task. It compiles and shows a simple placeholder so you
// can navigate to it. Replace the body when you build this feature.
// ===========================================================================

import 'package:flutter/material.dart';

class EditExpenseScreen extends StatelessWidget {
  const EditExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EditExpenseScreen')),
      body: const Center(
        child: Text('EditExpenseScreen - coming soon'),
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
// expenses_list_screen.dart  -  shows all expenses (the READ part of CRUD for expenses)
//
// STUB for a later task. It compiles and shows a simple placeholder so you
// can navigate to it. Replace the body when you build this feature.
// ===========================================================================

import 'package:flutter/material.dart';

class ExpensesListScreen extends StatelessWidget {
  const ExpensesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ExpensesListScreen')),
      body: const Center(
        child: Text('ExpensesListScreen - coming soon'),
      ),
    );
  }
}

```

================================================================================
FILE: lib/incomes/add_income_screen.dart
================================================================================

```dart
// ===========================================================================
// add_income_screen.dart  -  form to add a new income (CREATE)
//
// STUB for a later task. It compiles and shows a simple placeholder so you
// can navigate to it. Replace the body when you build this feature.
// ===========================================================================

import 'package:flutter/material.dart';

class AddIncomeScreen extends StatelessWidget {
  const AddIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AddIncomeScreen')),
      body: const Center(
        child: Text('AddIncomeScreen - coming soon'),
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
// incomes_screen.dart  -  shows all incomes (READ) plus a button to add one
//
// STUB for a later task. It compiles and shows a simple placeholder so you
// can navigate to it. Replace the body when you build this feature.
// ===========================================================================

import 'package:flutter/material.dart';

class IncomesScreen extends StatelessWidget {
  const IncomesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IncomesScreen')),
      body: const Center(
        child: Text('IncomesScreen - coming soon'),
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
// category.dart  -  the Category model  (e.g. Food, Rent, Transport).
//
// STUB for a later task. Categories group expenses together.
// ===========================================================================

class Category {
  final int? id;
  final String name;
  final int iconCode; // the Icons codePoint, so we can store an icon as a number
  final int colorValue; // a Color stored as a number

  Category({
    this.id,
    required this.name,
    required this.iconCode,
    required this.colorValue,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'iconCode': iconCode,
      'colorValue': colorValue,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int?,
      name: map['name'] as String,
      iconCode: map['iconCode'] as int,
      colorValue: map['colorValue'] as int,
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
// STUB for a later task. When you build the expenses feature, fill this in
// the same way as user.dart (fields + toMap + fromMap).
// ===========================================================================

class Expense {
  final int? id;
  final String title;
  final double amount;
  final String category;
  final DateTime date;

  Expense({
    this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });

  // Object -> Map (for saving). DateTime is not supported by SQLite,
  // so we store it as text using toIso8601String().
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category,
      'date': date.toIso8601String(),
    };
  }

  // Map -> Object (for reading). We turn the text back into a DateTime.
  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'] as int?,
      title: map['title'] as String,
      amount: map['amount'] as double,
      category: map['category'] as String,
      date: DateTime.parse(map['date'] as String),
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
// STUB for a later task. Same shape as expense.dart.
// ===========================================================================

class Income {
  final int? id;
  final String title;
  final double amount;
  final String source; // where the money came from (salary, gift, ...)
  final DateTime date;

  Income({
    this.id,
    required this.title,
    required this.amount,
    required this.source,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'source': source,
      'date': date.toIso8601String(),
    };
  }

  factory Income.fromMap(Map<String, dynamic> map) {
    return Income(
      id: map['id'] as int?,
      title: map['title'] as String,
      amount: map['amount'] as double,
      source: map['source'] as String,
      date: DateTime.parse(map['date'] as String),
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
// ===========================================================================

class User {
  final int? id; // null before saving; the database fills it in
  final String username;
  final String password;

  User({this.id, required this.username, required this.password});

  // Object  ->  Map   (used when SAVING to the database)
  Map<String, dynamic> toMap() {
    return {'id': id, 'username': username, 'password': password};
  }

  // Map  ->  Object   (used when READING from the database)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int?,
      username: map['username'] as String,
      password: map['password'] as String,
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
// STUB for a later task. This uses the "provider" package for state
// management. You must add it first:
//     flutter pub add provider
//
// Idea: instead of each screen loading from the database on its own, ONE
// provider loads the data and every screen listens to it. When you add or
// delete an expense, notifyListeners() redraws every screen showing that data.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../database/database_helper.dart';

// ChangeNotifier = a class that can shout "I changed!" to anyone listening.
class ExpenseProvider extends ChangeNotifier {
  final DatabaseHelper _db = DatabaseHelper();

  // The private list of expenses.
  List<Expense> _expenses = [];

  // A read-only view of the list for the screens.
  List<Expense> get expenses => _expenses;

  // Load all expenses from the database.
  Future<void> loadExpenses() async {
    // Later, add a getAllExpenses() function in database_helper.dart:
    //   final rows = await _db.getAllExpenses();
    //   _expenses = rows;

    notifyListeners(); // tell the screens to redraw
  }

  // Add one expense, then reload.
  Future<void> addExpense(Expense expense) async {
    // Later: await _db.addExpense(expense);
    await loadExpenses();
  }

  // Delete one expense, then reload.
  Future<void> deleteExpense(int id) async {
    // Later: await _db.deleteExpense(id);
    await loadExpenses();
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
// STUB for a later task. Same idea as expense_provider.dart.
// Needs the "provider" package:  flutter pub add provider
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/income.dart';
import '../database/database_helper.dart';

class IncomeProvider extends ChangeNotifier {
  final DatabaseHelper _db = DatabaseHelper();

  List<Income> _incomes = [];
  List<Income> get incomes => _incomes;

  Future<void> loadIncomes() async {
    // Later: _incomes = await _db.getAllIncomes();
    notifyListeners();
  }

  Future<void> addIncome(Income income) async {
    // Later: await _db.addIncome(income);
    await loadIncomes();
  }

  Future<void> deleteIncome(int id) async {
    // Later: await _db.deleteIncome(id);
    await loadIncomes();
  }
}

```

================================================================================
FILE: lib/reports/reports_screen.dart
================================================================================

```dart
// ===========================================================================
// reports_screen.dart  -  totals and charts: money in vs money out per category
//
// STUB for a later task. It compiles and shows a simple placeholder so you
// can navigate to it. Replace the body when you build this feature.
// ===========================================================================

import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ReportsScreen')),
      body: const Center(
        child: Text('ReportsScreen - coming soon'),
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
// Task 1: it just shows a "Hello World" welcome message.
// Later it will show the balance, recent expenses, charts, etc.
// ===========================================================================

import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'login_screen.dart';

class DashboardScreen extends StatelessWidget {
  // Receives the username sent from the login screen.
  final String username;

  const DashboardScreen({super.key, this.username = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          // Logout button on the right of the app bar.
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Go back to login and remove all screens behind it, so the
              // back button cannot return to the dashboard.
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false, // remove everything
              );
            },
          ),
        ],
      ),

      // Center puts its child in the middle of the screen.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 90, color: kPrimaryColor),

            const SizedBox(height: 20),

            const Text(
              'Hello World',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              username.isEmpty ? 'You are logged in' : 'Welcome, $username',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
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
// Task 1: the LOGIN button just navigates to the dashboard (no database check
// yet). The database check is prepared for later - see the login() function.
// ===========================================================================

import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../database/database_helper.dart';
import 'dashboard_screen.dart';
// import '../database/database_helper.dart'; // uncomment for the DB check later

// StatefulWidget = a screen that CAN change while open.
// We need it because the password field can be hidden or shown.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers let us READ what the user typed.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true; // true = show dots instead of letters

  // Runs when the screen is destroyed. Frees the controllers' memory.
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Runs when the LOGIN button is pressed.
  Future<void> login() async {
    // Ask the database if this username + password exist.
    // First call also opens the DB and seeds the accounts automatically.
    final user = await DatabaseHelper().login(
      usernameController.text,
      passwordController.text,
    );
    if (!mounted) return;

    if (user == null) {
      // No match → wrong login. Show a red bar, stay here.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wrong username or password')),
      );
    } else {
      // Match → go to the dashboard, carrying the username with us.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(username: user.username),
        ),
      );
    }
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
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ---- PASSWORD FIELD ----
                  TextField(
                    controller: passwordController,
                    obscureText: hidePassword, // true = dots
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
                  ),

                  const SizedBox(height: 24),

                  // ---- LOGIN BUTTON ----
                  ElevatedButton(
                    onPressed: login,
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // ---- LINK TO REGISTER (screen is a stub for now) ----
                  TextButton(
                    onPressed: () {
                      // Later: Navigator.push(... RegisterScreen ...);
                    },
                    child: const Text("Don't have an account? Register"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
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
// register_screen.dart  -  sign-up screen: create a new user, then save with DatabaseHelper.addUser()
//
// STUB for a later task. It compiles and shows a simple placeholder so you
// can navigate to it. Replace the body when you build this feature.
// ===========================================================================

import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RegisterScreen')),
      body: const Center(
        child: Text('RegisterScreen - coming soon'),
      ),
    );
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
// dashboard_card.dart  -  a small colored box for the dashboard summary.
//
// STUB for a later task. You will reuse it three times: total balance,
// total income, total expenses. Pass a title, a value, and a color.
// ===========================================================================

import 'package:flutter/material.dart';
import '../utils/constants.dart';

class DashboardCard extends StatelessWidget {
  final String title; // e.g. "Balance"
  final String value; // e.g. "1,250.00"
  final Color color;

  const DashboardCard({
    super.key,
    this.title = 'Title',
    this.value = '0.00',
    this.color = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kPadding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
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
// expense_card.dart  -  a reusable card that shows ONE expense in a list.
//
// STUB for a later task. A "widget" file holds a small UI piece you reuse in
// many places, so you don't copy-paste the same layout. Pass an Expense in,
// get a nice card out.
// ===========================================================================

import 'package:flutter/material.dart';
// import '../models/expense.dart'; // uncomment when you build this

class ExpenseCard extends StatelessWidget {
  // Later this will take an Expense:  final Expense expense;
  const ExpenseCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder card. Replace with the real expense layout later:
    // title on the left, amount on the right, category icon, etc.
    return const Card(
      child: ListTile(
        leading: Icon(Icons.receipt_long),
        title: Text('Expense title'),
        trailing: Text('0.00'),
      ),
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

