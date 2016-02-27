//
//  PushViewController+Tabbar.m
//  SlipNavigation
//
//  Created by admin on 16/2/4.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PushViewController+Tabbar.h"

#import "firstViewController.h"
#import "secondViewController.h"
#import "thirdViewController.h"
#import "DDMenuController.h"
#import "RootViewController.h"
#import "PushViewController.h"

@implementation PushViewController (Tabbar)


-(void) initTabbar {
    
     NSMutableArray * navcArray = [[NSMutableArray alloc] init];
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
    
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    tabbar.viewControllers = [NSArray arrayWithArray:navcArray];
    tabbar.selectedIndex = 1;
    
    
    [self addChildViewController:tabbar];
    [self.view addSubview:tabbar.view];
    [self.view bringSubviewToFront:tabbar.view];
}


@end
