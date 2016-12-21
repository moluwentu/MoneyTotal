//
//  RootTabBarViewController.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2016/12/21.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "RecommendedViewController.h"
#import "CustomNavViewController.h"

@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addchildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addchildViewControllers{
    self.tabBar.tintColor = [UIColor redColor];
    
    [self addChildViewControllerWithVC:[RecommendedViewController new] andTitle:@"推荐" andImageName:@"金融-1"];
    [self addChildViewControllerWithVC:[RecommendedViewController new] andTitle:@"详情" andImageName:@"金融"];
    [self addChildViewControllerWithVC:[RecommendedViewController new] andTitle:@"我的" andImageName:@"金融服务"];
}

- (void)addChildViewControllerWithVC:(UIViewController *)VC andTitle:(NSString *)title andImageName:(NSString *)imageName{
    VC.title = title;
    VC.tabBarItem.image = [UIImage imageNamed:imageName];
    CustomNavViewController *nav = [[CustomNavViewController alloc]initWithRootViewController:VC];
    
    [self addChildViewController:nav];
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
