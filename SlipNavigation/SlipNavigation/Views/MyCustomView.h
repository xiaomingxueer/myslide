//
//  MyCustomView.h
//  SlipNavigation
//
//  Created by admin on 16/1/23.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomView : UIControl

@property (nonatomic ,strong) UIImageView *imageView;

@property (nonatomic ,strong) UILabel *titleLabel;

@property (nonatomic ,strong) UIImageView *iconImageView;

@property (nonatomic ,assign) BOOL isSelect;

@property (nonatomic ,strong) NSString *title;

@property (nonatomic ,strong) NSString *imageName;

- (id)initWithImage:(NSString *)imageName andTitle:(NSString *)title;

- (void)updateImageView;

@end
