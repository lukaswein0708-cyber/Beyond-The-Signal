# BEYOND THE SIGNAL

Cross-platform app foundation for the existing game prototype.

## Status

This repository contains the current web game and an initial Capacitor setup for Android and iOS. It is a development starter, not a finished store-ready app.

## Requirements

- Node.js 22+
- Android: Android Studio and Android SDK
- iOS: macOS with Xcode

## Android on Windows 11

1. Install Node.js 22+ and Android Studio.
2. Clone this repository.
3. Run `App-Android-Vorbereiten.bat`.
4. Open Android Studio and launch the project on an emulator or test device.

## iOS

iOS builds require a Mac with Xcode. Run `npm install`, `npm run cap:sync`, `npx cap add ios`, and `npx cap open ios`.

## Notes

- Supabase credentials are intentionally blank. Configure your own project before enabling online features.
- No advertising, payment, or in-app purchase implementation is included.
- Review privacy, age, and store requirements before distribution.
