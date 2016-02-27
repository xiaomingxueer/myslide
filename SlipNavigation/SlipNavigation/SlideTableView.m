//
//  SlideTableView.m
//  SlipNavigation
//
//  Created by admin on 16/1/20.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "SlideTableView.h"

@implementation SlideTableView

{
    NSTimeInterval _timeNow1;
    NSTimeInterval _timeNow2;
    NSTimeInterval _timeOld;
}

//- (void)initWithData:(NSMutableArray *)array andDelegate:(id)delegate{
//    self.dataArray = [[NSMutableArray alloc] init];
//    self.dataArray = array;
//    
//    self.delegate = self;
//    self.dataSource = self;
//
//}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.frame = frame;
        self.dataArray = [[NSMutableArray alloc] initWithObjects:@"fir",@"sec", nil];
        self.delegate = self;
        self.dataSource = self;
        self.userInteractionEnabled = YES;
        [self creatButton];
    }
    return self;
}

- (void)creatButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(50, 100, 50, 35);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}
-(void)click{
    NSLog(@"Im click");
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifer = @"Cell";
    self.tableCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!self.tableCell) {
        self.tableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    self.tableCell.textLabel.text = self.dataArray[indexPath.row];
    return self.tableCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
    imageView.image = [UIImage imageNamed:@"beauty.png"];
    return imageView;
    
}
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView indexPathForSelectedRow] != nil) {
        return nil;
    }
    return indexPath;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    UIWebView *web = [[UIWebView alloc] init];
    web.scrollView.bounces = NO;
    
    return 0;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:NSLocalizedString(@"编辑", nil) handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        _timeNow1 = [[NSDate date] timeIntervalSince1970];
        if (_timeNow2 > 0 && _timeNow1 - _timeNow2 < 1) {
            [tableView setEditing:NO animated:YES];
            return ;
        }
        NSLog(@"编辑 %f",_timeNow1);
        [tableView setEditing:NO animated:YES];
        
    }];
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:NSLocalizedString(@"删除我", nil) handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        _timeNow2 = [[NSDate date] timeIntervalSince1970];
        if ( _timeNow1 > 0 && _timeNow2 - _timeNow1 < 1) {
            [tableView setEditing:NO animated:YES];
            return ;
        }
        NSLog(@"删除 %f",_timeNow2);
        [tableView setEditing:NO animated:YES];
        
    }];
    return @[action1,action2];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        NSLog(@"删除");
//    }else{
//        NSLog(@"其他");
//    }
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除我";
}


@end
