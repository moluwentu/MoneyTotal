//
//  HistogramCell.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2017/1/24.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

#import "HistogramCell.h"

@interface HistogramCell ()

@property (nonatomic, strong)UIView *histogramView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *getLabel;
@property (nonatomic, strong) CADisplayLink *progressTimer;

@end

@implementation HistogramCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

- (void)setUI{

    [self addSubview:self.histogramView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.getLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(8);
        make.left.equalTo(self).offset(8);
    }];
    
    [self.histogramView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(28);
        make.left.equalTo(self).offset(8);
        make.width.equalTo(@(1));
        make.height.equalTo(@20);
    }];
    
    [self.getLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.histogramView);
        make.left.equalTo(self.histogramView.mas_right).offset(8);
    }];
}

- (void)setProfit:(NSString *)profit{
    _profit = profit;
    [self.histogramView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@([profit doubleValue]));
    }];
}

#pragma mark --lazyload--
- (UIView *)histogramView{
    if (_histogramView == nil) {
        _histogramView = [[UIView alloc]init];
        _histogramView.backgroundColor = RGB(252, 62, 61);
    }
    return _histogramView;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [UILabel labelWithFontSize:13 textColor:[UIColor darkGrayColor]];
        _titleLabel.text = @"标的名称";
    }
    return _titleLabel;
}

- (UILabel *)getLabel{
    if (_getLabel == nil) {
        _getLabel = [UILabel labelWithFontSize:11 textColor:[UIColor redColor]];
        _getLabel.text = @"收益";
    }
    return _getLabel;
}

@end
