//
//  OrentationViewController.m
//  SlipNavigation
//
//  Created by admin on 16/1/25.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "OrentationViewController.h"
#define SCREEN [UIScreen mainScreen].bounds.size

@interface OrentationViewController ()

@end

@implementation OrentationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self creatButton];
}

-(void)creatButton{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 60, 35);
    [button setBackgroundColor:[UIColor blueColor]];
//    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(180, 100, 60, 35);
    [button1 setBackgroundColor:[UIColor redColor]];
//    button1.backgroundColor = [UIColor blueColor];
    [button1 addTarget:self action:@selector(backT) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
   
}

- (void)backT{
    
    
    if ([UIDevice currentDevice].orientation == 3) {
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:NO];
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationPortrait] forKey:@"orientation"];
    }else{
    
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeLeft animated:NO];
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationLandscapeLeft] forKey:@"orientation"];
    }

    NSLog(@"1、当前屏幕的方向是： %ld",(long)[UIDevice currentDevice].orientation);
//    [[UIDevice currentDevice]
//     setValue:[NSNumber
//               numberWithInteger:UIDeviceOrientationLandscapeLeft]
//     forKey:@"orientation"];
    
    
//    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:YES];
//    self.view.transform = CGAffineTransformMakeRotation(M_PI/2);
//    self.view.frame = CGRectMake(0, 0, SCREEN.height, SCREEN.width);
//    [UIApplication sharedApplication].keyWindow.transform = CGAffineTransformMakeRotation(M_PI/2);
//    [UIApplication sharedApplication].keyWindow.transform=CGAffineTransformMakeRotation(M_PI/2);
}


#pragma mark - InterfaceOrientation
- (BOOL)shouldAutorotate
{
    return YES;//
}
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskLandscapeRight;
//}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
     NSLog(@"2、当前屏幕的方向是： %ld",(long)[UIDevice currentDevice].orientation);
//    return UIInterfaceOrientationPortrait;//不允许横屏，但是点击按钮还会旋转，只是看不到旋转效果，返回到上一个界面的时候上个界面已经被旋转了
    return UIInterfaceOrientationLandscapeRight;
}

/*
 
 NSLog(@"当前屏幕的方向是： %ld",(long)[UIDevice currentDevice].orientation);
 
 [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:YES];
 self.view.transform = CGAffineTransformMakeRotation(M_PI/2);
 self.view.bounds = CGRectMake(0, 0, SCREEN.height, SCREEN.width);
 [UIApplication sharedApplication].keyWindow.transform=CGAffineTransformMakeRotation(M_PI/2);
 */

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
//    return YES;
//}
//-(BOOL)shouldAutorotate{
//    return YES;
//}


- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
