//
//  RootViewController.m
//  SlipNavigation
//
//  Created by admin on 16/1/20.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "RootViewController.h"
#import "firstViewController.h"

#define SCREEN [UIScreen mainScreen].bounds.size

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.tableView];
//    [self.view addSubview:[self creatButton]];
}

-(UITableView *)tableView{
    
    if (_tableView) {
        return _tableView;
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN.width, SCREEN.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    return self.tableView;
}

-(NSMutableArray *)dataArray{
    
    if (_dataArray) {
        return _dataArray;
    }
    self.dataArray = [[NSMutableArray alloc] init];
    
    NSArray *array = [UIFont familyNames];
    [self.dataArray addObjectsFromArray:array];
    return self.dataArray;
}

#pragma mark -- tableviewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark 设置每行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idStr = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idStr];
    }
    cell.textLabel.font = [UIFont fontWithName:self.dataArray[indexPath.row] size:20];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ 好吧",self.dataArray[indexPath.row]];
//    cell.detailTextLabel.text = @"好吧";
    
    return cell;
}



- (UIButton *)creatButton{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(50, 100, 50, 35);
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}
-(void)back:(UIButton *)button{
    
    NSLog(@"root");
//    firstViewController *first = [[firstViewController alloc] init];
//    [self.navigationController pushViewController:first animated:YES];
    
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
