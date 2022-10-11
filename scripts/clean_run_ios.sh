#!/bin/bash
set -e

echo "The script you are running is: $(dirname "$0")/$(basename "$0")"

function runDebug() {
  flutter run iOS --debug --target=lib/main.dart --vmservice-out-file=detective_connect.txt
}

function runRelease() {
  flutter run iOS --target=lib/main.dart --vmservice-out-file=detective_connect.txt
}

CURRENT_DIR="$PWD"
FOLDER_SYMLINKS="$CURRENT_DIR/ios/.symlinks"
FOLDER_PODS="$CURRENT_DIR/ios/Pods"
FILE_PODFILE_LOCK="$CURRENT_DIR/ios/Podfile.lock"
FILE_FLUTTER_PODSPEC="$CURRENT_DIR/ios/Flutter/Flutter.podspec"
FILE_EXPORT_ENV="$CURRENT_DIR/ios/Flutter/flutter_export_environment.sh"
FILE_GENERATED="$CURRENT_DIR/ios/Flutter/Generated.xcconfig"

ARRAY_FOLDERS=( "$FOLDER_SYMLINKS" "$FOLDER_PODS" )
ARRAY_FILES=( "$FILE_PODFILE_LOCK" "$FILE_FLUTTER_PODSPEC" "$FILE_EXPORT_ENV" "$FILE_GENERATED" )

# Iterate over folders and remove its contents
for folder in "${ARRAY_FOLDERS[@]}"
do
  if [ -d "$folder" ]; then
    rm -Rf "$folder"
    echo "$folder deleted."
  else
    echo "$folder does not exist."
  fi
done

# Iterate over files and remove them
for file in "${ARRAY_FILES[@]}"
do
  if [ -f "$file" ]; then
    rm "$file"
    echo "$file deleted."
  else
    echo "$file does not exist."
  fi
done

# Clean Flutter project
flutter clean

# Download dependencies
flutter pub get

# Run the app on the emulator.
# Make sure the emulator is running.
if [ "$1" = "-r" ]; then
  echo "Release build is running..."
  runRelease
else
  echo "Debug build is running..."
  runDebug
fi
