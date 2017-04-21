//
//  SortCollectionViewCell.h
//  TotalMoney
//
//  Created by 叶慧伟 on 2017/1/10.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyDetailModel.h"

@interface SortCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)NSString *iconStr;
@property (nonatomic, strong)CompanyDetailModel *company;

@end
