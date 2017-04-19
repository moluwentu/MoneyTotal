//
//  SortCollectionViewCell.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2017/1/10.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

#import "SortCollectionViewCell.h"

@interface SortCollectionViewCell ()

@property (nonatomic, strong)UIImageView *sortImageView;

@end

@implementation SortCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

- (void)setIconStr:(NSString *)iconStr{
    _iconStr = iconStr;
    [self.sortImageView sd_setImageWithURL:[NSURL URLWithString:_iconStr]];
}

- (void)setUI{
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.sortImageView];
    [self.sortImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.height.equalTo(@(self.frame.size.width * 2 / 3));
    }];
}

- (UIImageView *)sortImageView{
    if (_sortImageView == nil) {
        _sortImageView = [[UIImageView alloc]init];
        [_sortImageView setImage:[UIImage imageNamed:@"pear"]];
    }
    return _sortImageView;
}

@end
