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
    
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (UIImageView *)headerImageView{
    if (_headerImageView == nil) {
        _headerImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"背景"]];
    }
    return _headerImageView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
