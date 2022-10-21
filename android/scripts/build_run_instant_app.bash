#!/bin/bash

set -e

adb uninstall com.articleapp || true

# clean
sh scripts/cleanup.bash
./gradlew clean

# build bundle
./gradlew appInstant:bundleRelease

# build apks file from bundle based on connected device configuration
bundletool build-apks --bundle=appInstant/build/outputs/bundle/release/appInstant-release.aab --output=local_app.apks --connected-device --ks=debug.keystore --ks-pass=pass:12345678 --ks-key-alias=key0 --key-pass=pass:12345678

# unzipping apks file to testing dir
unzip local_app.apks -d testing_locally

# run instant app from specific split /
ia --debug run testing_locally/instant/*.apk