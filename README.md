![ScreenShot](https://raw.github.com/dawidzawada/articleapp/main/repo.png)

# Article App :newspaper:

This repo contains 4 React Native - based apps: 
 - **iOS App** :apple:
 - **Android App** :robot:
 - **App Clip** :paperclip: - a small part of an iOS application 
 - **Instant App** :zap: - an application which can be downloaded & run with help of Google Play Instant service.

Development process is deeply described in my article.

### Required tools :hammer:
 - Xcode
 - Android Studio + configured emulator / real device
 - `Android SDK API Level 31` installed
 - `Install Google Play Instant Development SDK` tools installed
 -  Exports listed below, added in your shell config


Exports for terminal shell:
```
   export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
   export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
   export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
   export PATH=$ANDROID_SDK_ROOT/extras/google/instantapps:$PATH
```

### Installation :clipboard:
 1. Clone repo
 2. Install required tools
 3. Run `yarn install`
 4. Go to `ios` folder
 5. Run `pod install`
 6. All 4 apps are ready to be used.
