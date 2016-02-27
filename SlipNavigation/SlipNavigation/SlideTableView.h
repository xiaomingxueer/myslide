//
//  SlideTableView.h
//  SlipNavigation
//
//  Created by admin on 16/1/20.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) UITableViewCell *tableCell;

@property (nonatomic ,strong) NSMutableArray *dataArray;

//- (void)initWithData:(NSMutableArray *)array andDelegate:(id)delegate;

@end
