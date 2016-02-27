//
//  MyCustomView.m
//  SlipNavigation
//
//  Created by admin on 16/1/23.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "MyCustomView.h"

#define IMAGEVIEW_SIZE 80

@interface MyCustomView ()


@end

@implementation MyCustomView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        _isSelect = NO;
    }
    return self;
}

- (id)initWithImage:(NSString *)imageName andTitle:(NSString *)title{
    
    self = [super init];
    if (self) {
        self.imageName = imageName;
        self.title = title;
        [self initViews];
    }
    
    
    return self;
    
}

- (void)initViews{
    //这里imageView的大小可以使用image的大小  因为image在不同的屏幕大小下对应的图片大小不一样 所以根据image来设置是最好的
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, IMAGEVIEW_SIZE, IMAGEVIEW_SIZE)];
    self.imageView.image = [UIImage imageNamed:self.imageName];
    self.imageView.clipsToBounds = YES;
    self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2.0;
    [self addSubview:self.imageView];
    
    
    CGRect frame = self.imageView.frame;
    self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.origin.x + frame.size.width -20, frame.origin.y+5, 10, 10)];
    self.iconImageView.image = [UIImage imageNamed:@"selected"];
//    self.iconImageView.clipsToBounds = YES;
//    self.iconImageView.layer.cornerRadius = self.iconImageView.frame.size.width / 2.0;
    self.iconImageView.hidden = self.selected;
    [self addSubview:self.iconImageView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.origin.y + 5 + frame.size.height, frame.size.width, 20)];
    self.titleLabel.text = self.title;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    
}

-(void)updateImageView{
    
}

@end
