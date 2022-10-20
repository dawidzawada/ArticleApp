//
//  ViewController.m
//  ArticleAppClip
//
//  Created by Dawid Zawada on 20/10/2022.
//

#import "ViewController.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
  #if DEBUG
  // For DEBUG configuration, javascript will be loaded from index file
  NSURL *jsCodeLocation = [[RCTBundleURLProvider sharedSettings]
jsBundleURLForBundleRoot:@"index.clip"];
  #else
  // For RELEASE configuration, js code is bundled and main.jsbundle file is created
  NSURL *jsCodeLocation = [[NSBundle mainBundle]
URLForResource:@"main" withExtension:@"jsbundle"];
  #endif

  // Value of moduleName should be equal to appName value set in index file
  RCTRootView *rootView = [[RCTRootView alloc]
initWithBundleURL:jsCodeLocation moduleName:@"ArticleApp"
initialProperties:nil launchOptions:nil];
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f
green:1.0f blue:1.0f alpha:1];
  self.view = rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
