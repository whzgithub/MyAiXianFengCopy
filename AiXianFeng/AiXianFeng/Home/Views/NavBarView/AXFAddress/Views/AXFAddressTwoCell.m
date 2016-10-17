//
//  AXFAddressTwoCell.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFAddressTwoCell.h"

@interface AXFAddressTwoCell ()

@property(nonatomic,strong) UILabel *addressLabel;

@end

@implementation AXFAddressTwoCell


- (void)awakeFromNib {
    [super awakeFromNib];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)setupUI
{
    UILabel *addressLabel = [[UILabel alloc] init];
    self.addressLabel = addressLabel;
    [self addSubview:addressLabel];
    addressLabel.textAlignment = NSTextAlignmentCenter;
    addressLabel.font = [UIFont systemFontOfSize:14];
    addressLabel.text = @"中国农业银行（西三旗支行）";
    [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    addressLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSender:)];
    [addressLabel addGestureRecognizer:tap];
    
}
- (void)tapSender:(UILabel *)label
{
    if ([self.delegate respondsToSelector:@selector(addressTwoCell:)]) {
        [self.delegate addressTwoCell:self];
    }
}

@end
