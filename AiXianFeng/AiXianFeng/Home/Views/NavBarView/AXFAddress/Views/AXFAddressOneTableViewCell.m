//
//  AXFAddressOneTableViewCell.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFAddressOneTableViewCell.h"

@interface AXFAddressOneTableViewCell ()

@property(nonatomic,strong) UILabel *nameLabel;
@property(nonatomic,strong) UILabel *phoneNumLabel;
@property(nonatomic,strong) UILabel *addressLabel;

@end

@implementation AXFAddressOneTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
//        self.userInteractionEnabled = NO;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}
- (void)setupUI
{
    UILabel *nameLabel = [[UILabel alloc] init];
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.text = @"李晓飞";
    
    UILabel *phoneNumLabel = [[UILabel alloc] init];
    [self addSubview:phoneNumLabel];
    self.phoneNumLabel = phoneNumLabel;
    phoneNumLabel.font = [UIFont systemFontOfSize:14];
    phoneNumLabel.text = @"15242208660";
    
    UILabel *addressLabel = [[UILabel alloc] init];
    [self addSubview:addressLabel];
    self.addressLabel = addressLabel;
    addressLabel.font = [UIFont systemFontOfSize:12];
    addressLabel.textColor = [UIColor grayColor];
    addressLabel.text = @"西三旗中腾建华商务大厦407";
    //右面的竖线
    UIView *lineLabel = [[UIView alloc] init];
    [self addSubview:lineLabel];
    lineLabel.backgroundColor = [UIColor lightGrayColor];
    //右面的添加按钮
    UIButton *writeBtn = [[UIButton alloc] init];
    [writeBtn setImage:[UIImage imageNamed:@"icon_daipingjia"] forState:UIControlStateNormal];
    [self addSubview:writeBtn];
    [writeBtn sizeToFit];
    [writeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.centerX.equalTo(self.mas_right).offset(-33);
        
    }];
    [writeBtn addTarget:self action:@selector(writeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(45);
        make.right.equalTo(self.mas_right).offset(-66);
    }];
    
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(13);
        make.left.offset(13);
    }];
    [phoneNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(nameLabel);
        make.left.equalTo(nameLabel.mas_right).offset(15);
    }];
    [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
        make.top.equalTo(nameLabel.mas_bottom).offset(8);
    }];
    
}
- (void)writeBtnClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(addressOneTabelViewCell:)]) {
        [self.delegate addressOneTabelViewCell:self];
    }
}

@end
