//
//  firstViewController.h
//  SlipNavigation
//
//  Created by admin on 15/8/28.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideTableView.h"
@interface firstViewController : UIViewController<UIImagePickerControllerDelegate,UIAlertViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *slideView;

@property (nonatomic ,strong) NSMutableArray *dataArray;


@property (nonatomic ,strong) UITableViewCell *tableCell;

@end
