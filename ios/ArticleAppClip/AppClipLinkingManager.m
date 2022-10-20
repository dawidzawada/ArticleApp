//
//  AppClipLinkingManager.m
//  ArticleAppClip
//
//  Created by Dawid Zawada on 20/10/2022.
//

#import "AppClipLinkingManager.h"
#import "SceneDelegate.h"

@implementation AppClipLinkingManager
{
  bool hasListeners;
}

- (instancetype)init
{
    self = [super init];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receivedNewUrlEvent:)
                                                 name:@"NewURLEvent"
                                               object:nil];
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}


- (void)receivedNewUrlEvent:(NSNotification *)notification {
  NSDictionary* userInfo = notification.userInfo;
  NSString* newURL = (NSString*)userInfo[@"url"];
  [self sendNewUrlEvent: newURL];
}

// Emits JS event
- (void)sendNewUrlEvent:(NSString *)newUrl {
  if (hasListeners) {
    NSLog(@"%@", newUrl);
    [self sendEventWithName:@"onNewUrl" body:@{@"url": newUrl}];
  }
}

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

// Will be called when this module's first listener is added.
-(void)startObserving {
    hasListeners = YES;
    // Set up any upstream listeners or background tasks as necessary
}

// Will be called when this module's last listener is removed, or on dealloc.
-(void)stopObserving {
    hasListeners = NO;
    // Remove upstream listeners, stop unnecessary background tasks
}

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents {
  return @[@"onNewUrl"];
}

RCT_EXPORT_METHOD(getInitialLink:(RCTPromiseResolveBlock) resolve:(RCTPromiseRejectBlock)reject) {
  UIScene *scene =  UIApplication.sharedApplication.connectedScenes.allObjects.firstObject;
  SceneDelegate *sceneDelegate = (SceneDelegate *)scene.delegate;
  
  if (sceneDelegate.initialLinkUrl) {
      resolve(sceneDelegate.initialLinkUrl);
    } else {
      reject(@"event_failure", @"no event id returned", nil);
    }
}
@end
