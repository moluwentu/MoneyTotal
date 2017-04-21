//
//  HomeListModel.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2017/4/21.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

#import "HomeListModel.h"
#import "HomeProductModel.h"

@implementation HomeListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"result" : [HomeProductModel class]};
}

@end
