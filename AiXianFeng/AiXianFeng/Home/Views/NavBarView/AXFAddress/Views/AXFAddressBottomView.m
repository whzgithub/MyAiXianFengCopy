//
//  AXFAddressBottomView.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFAddressBottomView.h"

@implementation AXFAddressBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI ];
    
    }
    return self;
}
- (void)setupUI

{
    UIButton * bottomBtn = [[UIButton alloc] init];
    [self addSubview:bottomBtn];
    [bottomBtn setTitle:@"+ 新增地址" forState:UIControlStateNormal];
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [bottomBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    bottomBtn.backgroundColor = [UIColor colorWithRed:259.0/255 green:219.0/255 blue:88.0/255 alpha:1.0];
    bottomBtn.backgroundColor = [UIColor yellowColor];
    [bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.mas_equalTo(260);
        make.height.mas_equalTo(34);
    }];
    bottomBtn.layer.cornerRadius = 8;
    bottomBtn.clipsToBounds = YES;
    [bottomBtn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)bottomBtnClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(addressBottomView:)]) {
        [self.delegate addressBottomView:self];
    }
}

@end
