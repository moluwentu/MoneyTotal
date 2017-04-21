//
//  HomeProductModel.h
//  TotalMoney
//
//  Created by 叶慧伟 on 2017/4/21.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeProductModel : NSObject

@property (nonatomic, copy)NSString *_id;
@property (nonatomic, copy)NSString *backTime;
@property (nonatomic, copy)NSString *companyName;
@property (nonatomic, copy)NSString *createdAt;
@property (nonatomic, copy)NSString *describe;
@property (nonatomic, strong)NSNumber *hasDisCount;
@property (nonatomic, strong)NSNumber *hasFull;
@property (nonatomic, copy)NSString *iconUrl;
@property (nonatomic, copy)NSString *productsName;
@property (nonatomic, copy)NSString *rate;
@property (nonatomic, copy)NSString *url;
@property (nonatomic, copy)NSString *validDate;

@end
