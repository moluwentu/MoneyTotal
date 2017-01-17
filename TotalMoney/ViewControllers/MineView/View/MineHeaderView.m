//
//  MineHeaderView.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2017/1/11.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

#import "MineHeaderView.h"

@interface MineHeaderView ()

@property (nonatomic, strong)UIImageView *headerImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *moneyLabel;

@end

@implementation MineHeaderView

- (instancetype)init{
    if (self = [super init]) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [self addSubview:self.headerImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.moneyLabel];
    
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-12);
    }];
    
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(12);
    }];
}

- (UIImageView *)headerImageView{
    if (_headerImageView == nil) {
        _headerImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"背景"]];
    }
    return _headerImageView;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [UILabel labelWithFontSize:18 textColor:[UIColor whiteColor]];
        _titleLabel.text = @"投资收益";
    }
    return _titleLabel;
}

- (UILabel *)moneyLabel{
    if (_moneyLabel == nil) {
        _moneyLabel = [UILabel labelWithFontSize:15 textColor:[UIColor whiteColor]];
        _moneyLabel.text = @"0.00元";
    }
    return _moneyLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
