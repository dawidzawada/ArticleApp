#!/bin/bash

set -e

adb uninstall com.articleapp || true

# clean
sh scripts/cleanup.bash
./gradlew clean

# build bundle
./gradlew app:bundleRelease

# build apks file from bundle based on connected device configuration
bundletool build-apks --bundle=app/build/outputs/bundle/release/app-release.aab  --output=local_app.apks --connected-device --ks=debug.keystore --ks-pass=pass:12345678 --ks-key-alias=key0 --key-pass=pass:12345678

# install full app
bundletool install-apks --apks local_app.apks

# run full app
adb shell am start -n com.articleapp/com.articleapp.MainActivity