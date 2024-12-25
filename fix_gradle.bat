@echo off
echo Cleaning Gradle files...
cd android
del /f /s /q .gradle
rmdir /s /q .gradle
del /f /s /q build
rmdir /s /q build
cd ..
del /f /s /q build
rmdir /s /q build
rmdir /s /q "C:\Users\Elite\.gradle"

echo Running Gradle clean...
cd android
call gradlew clean
cd ..

echo Getting Flutter dependencies...
flutter clean
flutter pub get

echo Running app...
flutter run -d android

pause 