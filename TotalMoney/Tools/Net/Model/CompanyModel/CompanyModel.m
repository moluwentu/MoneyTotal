//
//  CompanyModel.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2017/4/19.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

#import "CompanyModel.h"
#import "CompanyDetailModel.h"

@implementation CompanyModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"result" : [CompanyDetailModel class]};
}

@end
