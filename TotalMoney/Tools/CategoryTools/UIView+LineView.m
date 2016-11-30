//
//  UIView+LineView.m
//  基础框架
//
//  Created by 叶慧伟 on 16/9/27.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "UIView+LineView.h"

@implementation UIView (LineView)

+ (instancetype)lineViewWithMargin:(CGFloat)leftMargin Originy:(CGFloat)y{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(leftMargin, y, kScreenWidth - leftMargin, 1)];
    lineView.backgroundColor = [UIColor colorWithRed:242.0 / 255.0 green:242.0 / 255.0 blue:242.0 / 255.0 alpha:1];
    return lineView;
}

+ (instancetype)lineViewDefault{
    UIView *lineView = [[UIView alloc]init];
    lineView.frame = CGRectMake(0, lineView.superview.frame.size.height - 1, kScreenWidth, 1);
    lineView.backgroundColor = [UIColor colorWithRed:242.0 / 255.0 green:242.0 / 255.0 blue:242.0 / 255.0 alpha:1];
    return lineView;
}

+ (instancetype)lineViewWithMargin12{
    UIView *lineView = [[UIView alloc]init];
    lineView.frame = CGRectMake(12, lineView.superview.frame.size.height - 1, kScreenWidth - 12, 1);
    lineView.backgroundColor = [UIColor colorWithRed:242.0 / 255.0 green:242.0 / 255.0 blue:242.0 / 255.0 alpha:1];
    return lineView;
}

@end
