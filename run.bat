@echo off
echo Cleaning project...
flutter clean

echo Getting dependencies...
flutter pub get

echo Select platform:
echo 1. Chrome
echo 2. Android
choice /c 12 /n /m "Enter your choice (1 or 2): "
if errorlevel 2 (
    echo Building for Android...
    cd android
    gradlew clean
    cd ..
    flutter run -d android
) else (
    echo Building for Chrome...
    flutter run -d chrome
)
pause 