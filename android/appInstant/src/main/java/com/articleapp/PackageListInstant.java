package com.articleapp;

import android.app.Application;
import android.content.Context;
import android.content.res.Resources;
import com.facebook.react.ReactNativeHost;
import com.facebook.react.ReactPackage;
import com.facebook.react.shell.MainPackageConfig;
import com.facebook.react.shell.MainReactPackage;
import java.util.ArrayList;
import java.util.Arrays;

public class PackageListInstant {
    private Application application;
    private ReactNativeHost reactNativeHost;
    private MainPackageConfig mConfig;

    public PackageListInstant(ReactNativeHost reactNativeHost) {
        this(reactNativeHost, null);
    }

    public PackageListInstant(Application application) {
        this(application, null);
    }

    public PackageListInstant(ReactNativeHost reactNativeHost, MainPackageConfig config) {
        this.reactNativeHost = reactNativeHost;
        mConfig = config;
    }

    public PackageListInstant(Application application, MainPackageConfig config) {
        this.reactNativeHost = null;
        this.application = application;
        mConfig = config;
    }

    private ReactNativeHost getReactNativeHost() {
        return this.reactNativeHost;
    }

    private Resources getResources() {
        return this.getApplication().getResources();
    }

    private Application getApplication() {
        return this.application;
    }

    private Context getApplicationContext() {
        return this.getApplication().getApplicationContext();
    }

    public ArrayList<ReactPackage> getPackages() {
        return new ArrayList<>(Arrays.<ReactPackage>asList(
                new MainReactPackage(mConfig)
        ));
    }
}