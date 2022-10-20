import 'react-native';

export interface AppClipLinkingManager {
  getInitialLink: () => Promise<string>;
}

// and extend them!
declare module 'react-native' {
  interface NativeModulesStatic {
    AppClipLinkingManager: AppClipLinkingManager;
  }
}
