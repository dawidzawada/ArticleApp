//
//  AppClipLinkingManager.h
//  ArticleApp
//
//  Created by Dawid Zawada on 20/10/2022.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <Foundation/Foundation.h>

@interface AppClipLinkingManager : RCTEventEmitter <RCTBridgeModule>

- (void)sendNewUrlEvent:(NSString *)eventName;

@end
