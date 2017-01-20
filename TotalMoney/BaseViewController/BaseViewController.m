//
//  BaseViewController.m
//  NewCreate
//
//  Created by 叶慧伟 on 16/10/15.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 *  设置左边按钮；title和图片目前只能二选一，title优先级高于图片
 *
 *  @param title     title description
 *  @param imageName imageName description
 */
- (void)setLeftNaviItemWithTitle:(NSString *)title imageName:(NSString *)imageName
{
    
    if (title && title.length > 0)
    {
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(leftItemTapped)];
        self.navigationItem.leftBarButtonItem = leftItem;
        
        /**
         *  @author qiaoqiao.wu, 15-05-18 17:05:54
         *
         *  修改leftItem字体大小和颜色
         */
        NSDictionary *textAttributes = @{
                                         NSFontAttributeName: [UIFont systemFontOfSize:13],
                                         NSForegroundColorAttributeName:[UIColor whiteColor],
                                         };
        
        [leftItem setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
        [leftItem setTitleTextAttributes:textAttributes forState:UIControlStateHighlighted];
        return;
        
    }else if (imageName)
    {
        UIImage *leftImage = [UIImage imageNamed:imageName];
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setImage:leftImage forState:UIControlStateNormal];
        leftButton.frame = CGRectMake(0, 0, leftImage.size.width, leftImage.size.height);
        [leftButton addTarget:self action:@selector(leftItemTapped) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItem = leftItem;
        return;
    }
}

- (void)leftItemTapped{
    [self.navigationController popViewControllerAnimated:YES];
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
