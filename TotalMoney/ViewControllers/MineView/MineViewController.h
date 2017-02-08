//
//  MineViewController.h
//  TotalMoney
//
//  Created by 叶慧伟 on 2016/12/21.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger, ListSortStyle) {
    AccountingStyle = 0,
    RecordStyle,
    SuggestStyle,
    LoginStyle,
    SettingStyle
};

@interface MineViewController : BaseViewController

@property (nonatomic, assign)ListSortStyle sortStyle;

@end
