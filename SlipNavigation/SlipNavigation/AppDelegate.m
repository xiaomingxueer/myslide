//
//  AppDelegate.m
//  SlipNavigation
//
//  Created by admin on 15/8/28.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

#import "firstViewController.h"
#import "secondViewController.h"
#import "thirdViewController.h"
#import "DDMenuController.h"
#import "RootViewController.h"
#import "PushViewController.h"

@interface AppDelegate ()
{
    NSMutableArray *navcArray ;
}
@end

@implementation AppDelegate

-(void) initTabbar {
    navcArray = [[NSMutableArray alloc] init];
    firstViewController *first = [[firstViewController alloc] init];
    first.title = @"first";
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:first];
    nav.title = @"first";
    [navcArray addObject:nav];
    
    
    secondViewController *second = [[secondViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:second];
    second.title = @"second";
    nav1.title = @"second";
    [navcArray addObject:nav1];
    
    thirdViewController  *third = [[thirdViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:third];
    third.title=@"third";
    nav2.title = @"third";
    [navcArray addObject:nav2];
    
    RootViewController  *rootVC = [[RootViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:rootVC];
    rootVC.title=@"root";
    nav3.title = @"root";
    [navcArray addObject:nav3];
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   
    
//    UITabBarController *tabbar = [[UITabBarController alloc] init];
//    [self initTabbar];
//    
//    tabbar.viewControllers = [NSArray arrayWithArray:navcArray];
//    tabbar.selectedIndex = 1;
    
    
//    RootViewController *roo = [[RootViewController alloc] init];
//    DDMenuController *root = [[DDMenuController alloc] initWithRootViewController:tabbar];
//    root.leftViewController = roo;
    
    PushViewController *pu = [[PushViewController alloc] init];
    
    NSLog(@"字体有下面这么多哈哈\n%@",[UIFont familyNames]);
    self.window.rootViewController = pu;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
//{
//    if (self.modalViewControllerIsDismissing) {
//        return UIInterfaceOrientationMaskPortrait;
//    }else{
//        return UIInterfaceOrientationMaskAllButUpsideDown;
//    }
//}


-(UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
//     return UIInterfaceOrientationMaskLandscapeRight;//这里设置之后，运行出来的app就是横屏状态
    return UIInterfaceOrientationMaskPortrait;
}


@end
