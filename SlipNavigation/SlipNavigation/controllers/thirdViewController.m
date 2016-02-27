//
//  thirdViewController.m
//  SlipNavigation
//
//  Created by admin on 15/9/1.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "thirdViewController.h"
#import "secondViewController.h"

#define SCREEN [UIScreen mainScreen].bounds.size
@interface thirdViewController ()<UINavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
//    NSMutableArray *_indexArray; //索引数组
}
@end

@implementation thirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
//    [self creatButton];
    [self creatTableView];
   
}

- (void)creatTableView{
    //添加tableview
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

//索引数组
- (NSMutableArray *)indexArray{
    if (_indexArray) {
        return _indexArray;
    }
    
    self.indexArray = [NSMutableArray arrayWithObjects:@"#",nil];
    
    for (char ch = 'A'; ch <= 'Z'; ch ++ ) {
        if (ch=='I' || ch=='O' || ch=='U' || ch=='V') {
            continue;
        }
        [_indexArray addObject:[NSString stringWithFormat:@"%c",ch]];
    }
    return _indexArray;
}

//城市数组
- (NSArray *)citysAry{
    
    if (_citysAry) {
        return _citysAry;
    }
    return  self.citysAry = @[
                          @[@"北京",@"上海",@"广州",@"烟台"],
                          @[@"阿坝",@"阿克苏",@"安康",@"安阳",@"澳门"],
                          @[@"北京",@"白城",@"白山",@"包头",@"宝鸡",@"保定",@"滨州"],
                          @[@"重庆",@"成都",@"长沙",@"长春",@"沧州",@"赤峰"],
                          @[@"大连",@"东莞",@"达州",@"大理",@"大同",@"大兴安岭",@"丹东",@"东营"],
                          @[@"鄂尔多斯",@"鄂州",@"恩施"],
                          @[@"佛山",@"福州",@"抚顺",@"阜新",@"阜阳"],
                          @[@"广州",@"贵阳",@"桂林",@"甘南",@"格尔木",@"广安",@"广元"],
                          @[@"杭州",@"海口",@"哈尔滨",@"合肥",@"哈密",@"海北",@"海东",@"海西",@"海南",@"邯郸",@"菏泽",@"鹤岗",@"黄山"],
                          @[@"济南",@"锦州",@"吉林",@"济宁",@"嘉兴",@"嘉峪关",@"金华",@"荆门",@"荆州",@"酒泉",@"景德镇"],
                          @[@"昆明",@"喀什",@"开封",@"克拉玛依"],
                          @[@"洛阳",@"拉萨",@"兰州",@"莱芜",@"廊坊",@"乐山",@"丽江",@"连云港",@"辽阳",@"临汾",@"临沂",@"六盘水"],
                          @[@"茂名",@"马鞍山",@"牡丹江"],
                          @[@"南京",@"宁波",@"南昌",@"南宁",@"南通",@"宁德"],
                          @[@"攀枝花",@"盘锦",@"平顶山",@"普洱"],
                          @[@"青岛",@"齐齐哈尔",@"黔南",@"秦皇岛",@"庆阳",@"琼海",@"泉州"],
                          @[@"日喀什",@"日照"],
                          @[@"上海",@"深圳",@"沈阳",@"石家庄",@"苏州",@"三门峡",@"三亚",@"汕头",@"绍兴",@"十堰",@"石河子",@"松原"],
                          @[@"天津",@"唐山",@"台湾",@"太原",@"泰州",@"泰安",@"通辽",@"吐鲁番"],
                          @[@"武汉",@"无锡",@"潍坊",@"乌鲁木齐",@"威海",@"五指山"],
                          @[@"西安",@"厦门",@"徐州",@"西沙",@"仙桃",@"咸阳",@"孝感"],
                          @[@"银川",@"雅安",@"烟台",@"延安",@"盐城",@"扬州",@"阳江",@"宜宾",@"宜昌",@"玉树"],
                          @[@"郑州",@"珠海",@"淄博",@"漳州",@"张家口",@"驻马店",@"遵义"],
                          ];
    
    
}

#pragma mark -- tableviewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[self.citysAry objectAtIndex:section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.indexArray.count;
}

#pragma mark 设置每行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idStr = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idStr];
    }
    
    cell.textLabel.text = self.citysAry[indexPath.section][indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"当前屏幕的方向是： %ld",(long)[UIDevice currentDevice].orientation);
    
    OrentationViewController *or = [[OrentationViewController alloc] init];
    [self presentViewController:or animated:YES completion:nil];
}

#pragma mark 设置组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.indexArray objectAtIndex:section];
}

#pragma mark 右侧索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _indexArray;
}



- (void)creatButton{
    //    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    self.view.backgroundColor = [UIColor yellowColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(150, 200, 50, 30);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    //    NSLog(@"-----%d---%@",self.navigationController.viewControllers.count,self.navigationController.topViewController);
    
    [self.view addSubview:button];
    
}

-(void)btnClick{
    
    NSArray *arr = self.navigationController.viewControllers;
    secondViewController *sec = [[secondViewController alloc] init];
    for (UIViewController *ui in arr) {
        if ([ui isKindOfClass:[secondViewController class]]) {
            sec = (secondViewController *)ui;
        }
    }
    [sec.navigationController popToRootViewControllerAnimated:YES];
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
