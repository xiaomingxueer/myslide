//
//  PushViewController.m
//  SlipNavigation
//
//  Created by admin on 16/1/22.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PushViewController.h"
#import "PushViewController+Tabbar.h"
#import "SlideTableView.h"
#define SCREEN [UIScreen mainScreen].bounds.size

@interface PushViewController ()
{
    SlideTableView *table;
}

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self initNavigation];
//    [self initView];
    [self creatTable];
    
    [self initTabbar];
}

- (void)creatTable{
    
    table = [[SlideTableView alloc ] initWithFrame:CGRectMake(0,0, 200, SCREEN.height) style:UITableViewStylePlain];
    
    [self.view addSubview:table];
}

- (void)initNavigation{
    
    self.title = @"发布";
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)forBarMetrics:UIBarMetricsDefault];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(nextStep)];
    self.navigationItem.rightBarButtonItem = right;
    
    self.TitleTextView.delegate = self;
    self.TaskTextView.delegate = self;
    
    self.TitleTextView.returnKeyType = UIReturnKeyDone;
    self.TaskTextView.returnKeyType = UIReturnKeyDone;
}

- (void)initView{
    
    self.myTitleView = [[UIView alloc] initWithFrame:CGRectMake(0, 20,SCREEN.width , 245)];
    self.myTitleView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.myTitleView];
    //娱乐 运动  协助  旅行  其他
    self.myViewArray = [[NSMutableArray alloc] init];
    NSArray *titleArray = [NSArray arrayWithObjects:@"吃饭",@"娱乐", @"运动", @"协助", @"旅行", @"其他",nil];
    
    for (int i = 0; i < titleArray.count; i++) {
        _myView = [[MyCustomView alloc] initWithImage:@"beauty" andTitle:titleArray[i]];
        _myView.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleMemberSelect:)];
        _myView.imageView.userInteractionEnabled = YES;
        [_myView.imageView addGestureRecognizer:tap];

        _myView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.myTitleView addSubview:_myView];
        [self.myViewArray addObject:_myView];
    }
    
    MyCustomView *cu1 = self.myViewArray[0];
    MyCustomView *cu2 = self.myViewArray[1];
    MyCustomView *cu3 = self.myViewArray[2];
    MyCustomView *cu4 = self.myViewArray[3];
    MyCustomView *cu5 = self.myViewArray[4];
    MyCustomView *cu6 = self.myViewArray[5];
    
    NSArray *constraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(<=10)-[cu1][cu2(cu1)][cu3(cu1)]-10-|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:nil views:NSDictionaryOfVariableBindings(cu1, cu2, cu3)];
    [self.myTitleView addConstraints:constraintsArray];
    
    constraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(<=10)-[cu4][cu5(cu4)][cu6(cu4)]-10-|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:nil views:NSDictionaryOfVariableBindings(cu4, cu5, cu6)];
    [self.myTitleView addConstraints:constraintsArray];
    
    
    constraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[cu1][cu4(cu1)]|" options:NSLayoutFormatAlignAllLeading   metrics:nil views:NSDictionaryOfVariableBindings(cu1, cu4)];
    [self.myTitleView addConstraints:constraintsArray];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:cu1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.myTitleView attribute:NSLayoutAttributeHeight multiplier:0.4 constant:0];
    [self.myTitleView addConstraint:constraint];
  
    
}

- (void)singleMemberSelect:(UIGestureRecognizer *)gesture{
    NSLog(@"image click");
}

- (void)nextStep{
    NSLog(@"下一步");
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return YES;
    }
    return YES;
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    return YES;
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
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
