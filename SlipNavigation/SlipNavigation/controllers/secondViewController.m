//
//  secondViewController.m
//  SlipNavigation
//
//  Created by admin on 15/8/28.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "secondViewController.h"
#import "thirdViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "PushViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

-(void)videoPlay{
//    NSString *webPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Private Documents/Temp"];
    NSString *cachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Privete Documents/Cache"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:cachePath]) {
        [fileManager createDirectoryAtPath:cachePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    if ([fileManager fileExistsAtPath:[cachePath stringByAppendingPathComponent:[NSString stringWithFormat:@"vedio.mp4"]]]) {
        MPMoviePlayerViewController *playerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:[cachePath stringByAppendingPathComponent:[NSString stringWithFormat:@"vedio.mp4"]]]];
        [self presentMoviePlayerViewControllerAnimated:playerViewController];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor greenColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(150, 200, 50, 50);
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
//    [self creatLayer];
    
//    NSLog(@"%@",self.navigationController.viewControllers);
//    NSLog(@"%@",self.navigationController.topViewController);
//    NSLog(@"%@",self.navigationController.visibleViewController);
}

- (void)creatLayer{
    CALayer *redLayer = [CALayer layer];
    redLayer.frame = CGRectMake(100, 70, 100, 100);
    redLayer.backgroundColor = [UIColor redColor].CGColor;

    UIImage *image = [UIImage imageNamed:@"beauty.png"];
    
    redLayer.contents = (__bridge id __nullable)(image.CGImage);
    [self.view.layer addSublayer:redLayer];
//    self.view.contentMode = UIViewContentModeScaleAspectFill;  //kCAGravityResizeAspectFill
    self.view.layer.contentsGravity = kCAGravityCenter;//两个方法一样的
    self.view.layer.contentsScale = image.scale;
    self.view.layer.masksToBounds = YES; //UIView 对应clipsToBounds 用来决定是否显示超出边界的内容
    /*“那是因为和UIImage不同，CGImage没有拉伸的概念。当我们使用UIImage类去读取我们的雪人图片的时候，他读取了高质量的Retina版本的图片。但是当我们用CGImage来设置我们的图层的内容时，拉伸这个因素在转换的时候就丢失了。不过我们可以通过手动设置contentsScale来修复这个问题”*/
//    self.view.contentScaleFactor
    //CALayer 与contentMode对应的属性叫做contentsGravity
}

-(void)btnClick{
    NSLog(@"-- push");
    PushViewController *sec = [[PushViewController alloc] init];
    sec.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:sec animated:YES];
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
