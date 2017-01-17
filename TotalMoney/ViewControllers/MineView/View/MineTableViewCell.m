//
//  MineTableViewCell.m
//  TotalMoney
//
//  Created by 叶慧伟 on 2017/1/11.
//  Copyright © 2017年 叶慧伟. All rights reserved.
//

#import "MineTableViewCell.h"

@interface MineTableViewCell ()

@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UIImageView *iconImage;

@end

@implementation MineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

- (void)setUI{

    [self addSubview:self.iconImage];
    [self addSubview:self.nameLabel];
    
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(12);
        make.width.height.equalTo(@40);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.iconImage.mas_right).offset(12);
    }];
}

- (void)setTitle:(NSString *)title{
    _title = title;
    self.nameLabel.text = title;
}

- (void)setIconName:(NSString *)iconName{
    _iconName = iconName;
    [self.iconImage setImage:[UIImage imageNamed:iconName]];
}

#pragma mark --lazyload--
- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [UILabel labelWithFontSize:14 textColor:[UIColor darkGrayColor]];
    }
    return _nameLabel;
}

- (UIImageView *)iconImage{
    if (_iconImage == nil) {
        _iconImage = [[UIImageView alloc]init];
    }
    return _iconImage;
}

@end
