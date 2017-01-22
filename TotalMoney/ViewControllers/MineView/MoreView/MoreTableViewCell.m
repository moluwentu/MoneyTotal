//
//  MoreTableViewCell.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2017/1/22.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

#import "MoreTableViewCell.h"

@interface MoreTableViewCell ()

@property (nonatomic, strong)UIImageView *iconImage;
@property (nonatomic, strong)UILabel *titleLabel;

@end

@implementation MoreTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [self addSubview:self.iconImage];
    [self addSubview:self.titleLabel];
    
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@30);
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(8);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImage.mas_right).offset(8);
        make.centerY.equalTo(self);
    }];
}

- (void)setIconStr:(NSString *)iconStr{
    _iconStr = iconStr;
    [self.iconImage setImage:[UIImage imageNamed:iconStr]];
}

- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
}

- (UIImageView *)iconImage{
    if (_iconImage == nil) {
        _iconImage = [[UIImageView alloc]init];
    }
    return _iconImage;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [UILabel labelWithFontSize:13 textColor:[UIColor darkGrayColor]];
    }
    return _titleLabel;
}

@end
