@echo off
echo Cleaning old builds...
cd android
rmdir /s /q .gradle
rmdir /s /q build
rmdir /s /q app\build
cd ..
rmdir /s /q build
rmdir /s /q "%USERPROFILE%\.gradle\caches"

echo Updating Flutter...
flutter upgrade

echo Getting dependencies...
flutter pub get

echo Building Android app...
cd android
call gradlew wrapper
call gradlew clean
call gradlew assembleDebug --info

echo Done!
pause