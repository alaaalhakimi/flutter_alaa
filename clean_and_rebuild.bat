@echo off
echo Cleaning project...
flutter clean

echo Deleting build folders...
rmdir /s /q build
cd android
rmdir /s /q build
rmdir /s /q .gradle
cd ..

echo Getting dependencies...
flutter pub get

echo Building for Android...
cd android
call gradlew --stop
call gradlew clean
call gradlew assembleDebug --stacktrace
cd ..

echo Running app...
flutter run

pause 