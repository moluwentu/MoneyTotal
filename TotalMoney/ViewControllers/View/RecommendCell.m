//
//  RecommendCell.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2016/12/13.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "RecommendCell.h"

@interface RecommendCell ()

@property (nonatomic,strong)UIView *mainView;

@end

@implementation RecommendCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [self addSubview:self.mainView];
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@5);
        make.right.bottom.equalTo(@-5);
    }];
}

- (void)setBackMarginColor:(UIColor *)backMarginColor{
    _backMarginColor = backMarginColor;
    self.backgroundColor = backMarginColor;
}

- (UIView *)mainView{
    if (_mainView == nil) {
        _mainView = [[UIView alloc]init];
        _mainView.backgroundColor = [UIColor whiteColor];
    }
    return _mainView;
}

@end
