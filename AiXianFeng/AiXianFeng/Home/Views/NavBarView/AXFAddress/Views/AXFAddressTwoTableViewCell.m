//
//  AXFAddressTwoTableViewCell.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFAddressTwoTableViewCell.h"
#import "NSAttributedString+CZAdditon.h"

@interface AXFAddressTwoTableViewCell ()
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *addressLabel;
@property(nonatomic,strong)UIButton *addressBtn;
@property(nonatomic,strong) UILabel *distanceLabel;

@end


@implementation AXFAddressTwoTableViewCell

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
    //店名label
    UILabel *nameLabel = [[UILabel alloc] init];
    self.nameLabel = nameLabel;
    [self addSubview:nameLabel];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.text = @"爱鲜蜂龙乡店（吉利发超市）";
    //时间label
    UILabel *timeLabel = [[UILabel alloc] init];
    self.timeLabel = timeLabel;
    [self addSubview:timeLabel];
    timeLabel.font = [UIFont systemFontOfSize:12];
    timeLabel.textColor = [UIColor grayColor];
    timeLabel.text = @"营业时间：09:00 -- 22:00";
    //地址label
    UILabel *addressLabel = [[UILabel alloc] init];
    self.addressLabel = addressLabel;
    [self addSubview:addressLabel];
    addressLabel.font = [UIFont systemFontOfSize:12];
    addressLabel.textColor = [UIColor grayColor];
    addressLabel.text = @"昌平区龙乡东区10号楼对面";
    //右侧Button
    UIButton *addressBtn = [[UIButton alloc] init];
    self.addressBtn = addressBtn;
    [self addSubview:addressBtn];
    [addressBtn setImage:[UIImage imageNamed:@"icon_mapmarker_small"] forState:UIControlStateNormal];
   // 距离distanceLabel
    UILabel *distanceLabel = [[UILabel alloc] init];
    self.distanceLabel = distanceLabel;
    [self addSubview:distanceLabel];
    distanceLabel.text = @"0.28km";
    distanceLabel.font = [UIFont systemFontOfSize:11];
    distanceLabel.textColor = [UIColor grayColor];
    distanceLabel.textAlignment = NSTextAlignmentCenter;
    
    //添加约束
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(13);
        make.left.offset(13);
    }];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel.mas_bottom).offset(7);
        make.left.equalTo(nameLabel);
    }];
    [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(timeLabel.mas_bottom).offset(6);
        make.left.equalTo(nameLabel);
    }];
    [addressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.offset(-20);
        make.width.height.mas_equalTo(30);
    }];
    [distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(addressBtn);
        make.top.equalTo(addressBtn.mas_bottom).offset(1);
    }];
    
    
    
}

@end
