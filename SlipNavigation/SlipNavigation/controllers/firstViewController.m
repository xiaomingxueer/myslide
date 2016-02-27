//
//  firstViewController.m
//  SlipNavigation
//
//  Created by admin on 15/8/28.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "firstViewController.h"
#import "secondViewController.h"
#import "RootViewController.h"
@interface firstViewController ()<UIGestureRecognizerDelegate>
{
    UIImagePickerControllerSourceType sourceType;
    UIImageView *header;
    UIAlertView *alert;
    UIAlertController *alertController;
    UIAlertAction *action;
    UIAlertAction *action1;
    UIScreenEdgePanGestureRecognizer *gesture;
}
@end

@implementation firstViewController

-(UIImage *)capture{
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, self.view.opaque, 0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
//    kCFNumberFormatterCurrencyStyle
    
    NSNumberFormatter *form = [[NSNumberFormatter alloc] init];
    form.numberStyle = NSNumberFormatterOrdinalStyle;
    NSString *strr = [form stringFromNumber:[NSNumber numberWithDouble:172773880.3483]];
    NSLog(@"hehe～ %@",strr);
//    RootViewController *root = [[RootViewController alloc] init];
//    [self.view addSubview:root.view];
//    [self addChildViewController:root];
    self.view.userInteractionEnabled = YES;
    
    self.dataArray = [[NSMutableArray alloc] initWithObjects:@"fir",@"sec",@"one",@"two",@"three",@"four", nil];
    
    [self creatButton];
    [self creatAlert];
    [self leftButton];
    [self creatSlideTableView];
    [self createSipeGesture];
}


- (void)createSipeGesture{
    
    gesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(slide:)];
    gesture.delegate = self;
    gesture.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:gesture];
    
}


-(UITableView *)slideView{
    if (!_slideView) {
        _slideView = [[UITableView alloc] initWithFrame:CGRectMake(-200, 0, 200, self.view.frame.size.height) style:UITableViewStylePlain];
        _slideView.delegate = self;
        _slideView.dataSource = self;
        UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        footView.backgroundColor = [UIColor redColor];
        _slideView.tableFooterView = footView;
        

        
    }
    return _slideView;
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
    NSLog(@"you are slide %ld",(long)indexPath.row);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
    imageView.image = [UIImage imageNamed:@"beauty.png"];
    return imageView;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}

/*
 NSInteger count = [[UIApplication sharedApplication].delegate window].rootViewController.view.subviews.count - 1;
 [[UIApplication sharedApplication].delegate window].rootViewController.tabBarController.tabBar.userInteractionEnabled = YES;
 [[[UIApplication sharedApplication].delegate window].rootViewController.view insertSubview:self.slideView aboveSubview:self.tabBarController.view.subviews[count]];
 NSLog(@"the tabbarcontroller subview is %@",[[UIApplication sharedApplication].delegate window].rootViewController.view.subviews);
 
 */

- (void)creatSlideTableView{
    
//    self.tabBarController.tabBar.userInteractionEnabled = YES;
//    [self.tabBarController.view addSubview:self.slideView];
}

-(void)leftButton{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"slide" style:UIBarButtonItemStyleBordered target:self action:@selector(slide:)];
    self.navigationItem.leftBarButtonItem = leftItem;
}
-(void)slide:(UIPanGestureRecognizer *)gestureRecognize{
    CGRect frame = self.tabBarController.view.frame;
    [UIView animateWithDuration:0.5 animations:^{
        if (frame.origin.x == 0) {
            self.navigationController.tabBarController.view.frame = CGRectMake(200, 0, frame.size.width, frame.size.height);
//            gesture.edges = UIRectEdgeNone;
        }else{
            self.navigationController.tabBarController.view.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
//            gesture.edges = UIRectEdgeLeft;
        }
    } completion:nil];
}

- (void)creatAlert{
    alertController = [UIAlertController alertControllerWithTitle:@"try again" message:@"ok,you can try" preferredStyle:UIAlertControllerStyleAlert];
    action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    
    action1 = [UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:action1];
    [alertController addAction:action];
    
    
    
    
    alert = [[UIAlertView alloc] initWithTitle:@"我也来试一试" message:@"好吧那你试试" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    alert.delegate = self;
    
    
    header = [[UIImageView alloc] initWithFrame:CGRectMake(150, 84, 100, 100)];
    header.clipsToBounds = YES;
    header.layer.cornerRadius = 50;
    header.backgroundColor = [UIColor greenColor];
    header.layer.borderWidth = 3;
    header.layer.borderColor =  [[UIColor orangeColor] CGColor];
    header.layer.masksToBounds = YES;//设置是否相对于父视图裁剪
    
    [self.view addSubview:header];
}

-(void)creatButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(150, 300, 100, 30);
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame =CGRectMake(150, 200, 100, 30) ;
    button1.backgroundColor = [UIColor redColor];
    [button1 addTarget:self action:@selector(btnClick1) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    [self.view addSubview:button1];
}

//-(NSArray *)keyCommands{
//    return [UIKeyCommand keyCommandWithInput:<#(NSString *)#> modifierFlags:<#(UIKeyModifierFlags)#> action:<#(SEL)#>];
//}

-(void)btnClick{
    
//    [self.navigationController presentViewController:alertController animated:YES completion:nil];
    NSLog(@"%@",alertController.actions);
    
    [alert show];
    
    /*sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    UIImagePickerController *uiimage = [[UIImagePickerController alloc] init];
    uiimage.view.backgroundColor = [UIColor whiteColor];
    uiimage.delegate = self;
    uiimage.sourceType = sourceType;
    uiimage.allowsEditing = YES;
    [self.navigationController presentViewController:uiimage animated:YES completion:nil];*/
}

-(void)btnClick1{
    sourceType = UIImagePickerControllerSourceTypeCamera;
    UIImagePickerController *uiimage = [[UIImagePickerController alloc] init];
    uiimage.view.backgroundColor = [UIColor whiteColor];
    uiimage.delegate = self;
    uiimage.sourceType = sourceType;
    uiimage.allowsEditing = YES;
    [self.navigationController presentViewController:uiimage animated:YES completion:nil];
}

#pragma mark --ImagePickerViewControler delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{

    UIImage *editImage = [info objectForKey:UIImagePickerControllerEditedImage];
    header.image = editImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        NSLog(@"----%@",[alert textFieldAtIndex:0].text);
        NSLog(@"----%@",[alert textFieldAtIndex:1].text);
    }
     NSLog(@"----%@",[alert textFieldAtIndex:0].text);
     NSLog(@"----%@",[alert textFieldAtIndex:1].text);

}

- (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex{
    if (textFieldIndex == 0) {
         return [alert textFieldAtIndex:0];
    }else{
        return [alert textFieldAtIndex:1];
    }
    
}


//-(void)btnClick{
//
//    secondViewController *sec = [[secondViewController alloc] init];
//    [self.navigationController popToRootViewControllerAnimated:YES];
//    //[self.navigationController pushViewController:sec animated:YES];
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    CGRect frame = self.tabBarController.view.frame;
    [UIView animateWithDuration:0.5 animations:^{
        
            self.navigationController.tabBarController.view.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    
    } completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
