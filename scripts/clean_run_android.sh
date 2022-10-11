#!/bin/bash
set -e

echo "The script you are running is: $(dirname "$0")/$(basename "$0")"

function runDebug() {
  flutter build apk --debug --target-platform=android-arm64 --build-number=6666 --target=lib/main.dart # --vmservice-out-file=detective_connect.txt

  # Install the apk file on an attached emulator or device
  adb install build/app/outputs/flutter-apk/app-debug.apk

#  flutter run apk --debug --target=lib/main_develop.dart
}

function runRelease() {
  flutter build apk --target-platform=android-arm64 --build-number=6666 --target=lib/main.dart --vmservice-out-file=detective_connect.txt

  # Install the apk file on an attached emulator or device
  adb install build/app/outputs/flutter-apk/app-release.apk

#  flutter run apk --target=lib/main_release.dart
}

# Clean the project
flutter clean

if [ "$1" = "-r" ]; then
  echo "Release build is running..."
  runRelease
else
  echo "Debug build is running..."
  runDebug
fi

echo "******************************"
echo "Launch the app on your device."
echo "******************************"
