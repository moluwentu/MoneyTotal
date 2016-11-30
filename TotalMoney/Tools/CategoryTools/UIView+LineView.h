//
//  UIView+LineView.h
//  基础框架
//
//  Created by 叶慧伟 on 16/9/27.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LineView)

/**
 添加线条

 @param leftMargin 距离左边距离
 @param y          在图中的位置
 */
+ (instancetype)lineViewWithMargin:(CGFloat)leftMargin Originy:(CGFloat)y;

/**
 默认顶格底部的线条
*/
+ (instancetype)lineViewDefault;

/**
 距左12的线条
 */
+ (instancetype)lineViewWithMargin12;

@end

