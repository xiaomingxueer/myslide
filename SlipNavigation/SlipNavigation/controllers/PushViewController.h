//
//  PushViewController.h
//  SlipNavigation
//
//  Created by admin on 16/1/22.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomView.h"
#import "RootViewController.h"



@interface PushViewController : UIViewController<UITextViewDelegate>



@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *FunnyIamgeView;


@property (weak, nonatomic) IBOutlet UITextView *TitleTextView;

@property (weak, nonatomic) IBOutlet UITextView *TaskTextView;

@property (nonatomic ,strong) MyCustomView *myView;

@property (nonatomic ,strong) NSMutableArray *myViewArray;

@property (nonatomic ,strong) UIView *myTitleView;

@end
