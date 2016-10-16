//
//  AXFSignatureBottomView.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFSignatureBottomView.h"
#import <Masonry.h>

@interface AXFSignatureBottomView ()
//@property(nonatomic,weak) UILabel *titleLabel;

@end

@implementation AXFSignatureBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI
{
//创建上面的label
    UILabel *titleLabel = [[UILabel alloc] init];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    titleLabel.backgroundColor = [UIColor whiteColor];
//    UIEdgeInsets edd = UIEdgeInsetsMake(10, 10, [UIScreen mainScreen].bounds.size.height *0.5 - 20, 10);
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.offset(10);
    }];
    titleLabel.textAlignment =NSTextAlignmentCenter;
  titleLabel.text = @"- 活动规则 -";
//    //创建下面的label
    UILabel *contentLabel = [[UILabel alloc] init];
    [self addSubview:contentLabel];
    contentLabel.backgroundColor = [UIColor whiteColor];
    contentLabel.numberOfLines = 0;
    contentLabel.textColor = [UIColor grayColor];
    contentLabel.font = [UIFont systemFontOfSize:15];
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleLabel.mas_bottom).offset(20);
            make.left.offset(10);
            make.right.offset(-10);
    }];
  contentLabel.text = @"1.连续签到7天，前六天每天获得5积分，第7天获得70积分;                                                                                                   2.中断签到以首日方式计算                                                 3.每个用户每日可签到1次                                                      4.每日签到积分计入个人积分账号"                                                                                                                                ;
    
}

@end
