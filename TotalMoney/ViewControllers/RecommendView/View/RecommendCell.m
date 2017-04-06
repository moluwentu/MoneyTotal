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
@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *moneyLabel;
@property (nonatomic, strong)UILabel *timeLabel;

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
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.moneyLabel];
    [self addSubview:self.timeLabel];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(12);
        make.width.height.equalTo(@(50));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(6);
        make.top.equalTo(self.iconImageView.mas_top).offset(3);
    }];
    
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(6);
        make.bottom.equalTo(self.iconImageView.mas_bottom);
    }];

    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-12);
    }];
}

- (void)setBackMarginColor:(UIColor *)backMarginColor{
    _backMarginColor = backMarginColor;
    self.backgroundColor = backMarginColor;
}
#pragma mark --lazyload--
- (UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
        [_iconImageView setImage:[UIImage imageNamed:@"pear"]];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [UILabel labelWithFontSize:13 textColor:[UIColor darkGrayColor]];
        _titleLabel.text = @"标的名称";
    }
    return _titleLabel;
}

- (UILabel *)moneyLabel{
    if (_moneyLabel == nil) {
        _moneyLabel = [UILabel labelWithFontSize:15 textColor:RGB(229, 58, 58)];
        _moneyLabel.text = @"收益率";
    }
    return _moneyLabel;
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [UILabel labelWithFontSize:14 textColor:[UIColor darkGrayColor]];
        _timeLabel.text = @"30天标";
    }
    return _timeLabel;
}

- (UIView *)mainView{
    if (_mainView == nil) {
        _mainView = [[UIView alloc]init];
        _mainView.backgroundColor = [UIColor whiteColor];
    }
    return _mainView;
}

@end
