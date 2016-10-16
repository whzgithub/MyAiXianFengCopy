//
//  AXFAddressOneCell.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFAddressOneCell.h"

@implementation AXFAddressOneCell

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
   /*
    UIButton *manBtn = [[UIButton alloc] init];
    [self.contentView addSubview:manBtn];
    self.manBtn = manBtn;
    manBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 25, 0, 0);
    [manBtn setImage:[UIImage imageNamed:@"v2_noselected"] forState:UIControlStateNormal];
    [manBtn setImage:[UIImage imageNamed:@"v2_selected"] forState:UIControlStateSelected];
    [manBtn setTitle:@"先生" forState:UIControlStateNormal];
    manBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [manBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    */
    UIButton *positionBtn = [[UIButton alloc] init];
    [self.contentView addSubview: positionBtn];
    positionBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [positionBtn setImage:[UIImage imageNamed:@"v2_address_locate"] forState:UIControlStateNormal];
    [positionBtn setTitle:@"定位到当前位置" forState:UIControlStateNormal];
    [positionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    positionBtn.titleLabel.font = [UIFont systemFontOfSize:14];

    [positionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(44);
    }];
    [positionBtn addTarget:self action:@selector(positionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)positionBtnClick:(UIButton *)sender
{
//    AXFHomeController *VC = [[AXFHomeController alloc] init];
//    self.
    if ([self.delegate respondsToSelector:@selector(addressOneCell:)]) {
        [self.delegate addressOneCell:self];
    }
}

@end
