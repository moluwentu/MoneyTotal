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
@property (nonatomic, strong) NSTimer *progressTimer;

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
        make.width.equalTo(@(kScreenWidth - 50));
        make.height.equalTo(@20);
    }];
    
    [self.getLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.histogramView);
        make.left.equalTo(self.histogramView.mas_right).offset(8);
    }];
}

- (void)setProfit:(NSString *)profit{
    _profit = profit;
    [self drawProgress:[profit doubleValue]];
}

- (void)drawRect:(CGRect)rect {
    [self startProgressAnimate];
}

- (void)startProgressAnimate {
    
    self.progressTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(progressAnimate) userInfo:nil repeats:YES];
}

- (void)endProgressAnimate {
    [self.progressTimer invalidate];
    self.progressTimer = nil;
}

- (void)progressAnimate {
    static double progress = 0;
    progress += 1;
    if (progress >= [self.profit doubleValue]) {
        progress = [self.profit doubleValue];
        [self endProgressAnimate];
    }
    [self drawProgress:progress];
}

- (void)drawProgress:(CGFloat)progress {
    CGSize size = self.histogramView.bounds.size;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setFillColor:[[UIColor whiteColor] CGColor]];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, progress, 0);
    CGPathAddLineToPoint(path, NULL, progress, size.height);
    CGPathAddLineToPoint(path, NULL, 0, size.height);
    CGPathCloseSubpath(path);
    [shapeLayer setPath:path];
    CFRelease(path);
    self.histogramView.layer.mask = shapeLayer;
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
