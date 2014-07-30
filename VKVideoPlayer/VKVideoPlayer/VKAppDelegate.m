//
//  Created by Viki.
//  Copyright (c) 2014 Viki Inc. All rights reserved.
//

#import "VKAppDelegate.h"
#import "DemoRootViewController.h"
#import "MainViewController.h"
#import "DemoVideoPlayerViewController.h"
#import <DDASLLogger.h>
#import <DDTTYLogger.h>
#import "VKThemeManager.h"
#import "DemoHTTPStreamingServer.h"

@implementation VKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [DDLog addLogger:[DDASLLogger sharedInstance]];
  [DDLog addLogger:[DDTTYLogger sharedInstance]];

  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  // Override point for customization after application launch.
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  
    
  //ini UI
   UIViewController *rootViewController = [[DemoRootViewController alloc] init];
  UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:rootViewController] ;
   self.window.rootViewController = navi;
    
    //lead to 
//    UIViewController *mainViewController = [[MainViewController alloc] init];
//    self.window.rootViewController =mainViewController;
//    
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

  [[DemoHTTPStreamingServer sharedInstance] start];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

  [[DemoHTTPStreamingServer sharedInstance] stop];
}

@end