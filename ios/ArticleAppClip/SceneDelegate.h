//
//  SceneDelegate.h
//  ArticleAppClip
//
//  Created by Dawid Zawada on 20/10/2022.
//

#import <UIKit/UIKit.h>

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic) UIWindow * window;
@property (strong, readwrite) NSString * initialLinkUrl;

@end

