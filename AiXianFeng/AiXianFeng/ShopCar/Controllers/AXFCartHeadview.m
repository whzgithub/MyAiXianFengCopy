//
//  AXFCartHeadview.m
//  AiXianFeng
//
//  Created by mac on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.


#import "AXFCartHeadview.h"

@implementation AXFCartHeadview
// 如果homeTopView是通过代码来创建就会调用此方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

// 设置界面
- (void)setupUI {
    //底部视图的 背景
    UIView *bgViewf = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AXFMainScreenWidth, 40)];
    [self addSubview:bgViewf];
    
    //图标
    
    ///
    UIButton*imagef = [UIButton buttonWithType:UIButtonTypeCustom];
    [imagef setBackgroundImage:[UIImage imageNamed:@"v2_title_bar_icon"] forState:UIControlStateNormal];
    [bgViewf addSubview:imagef];
    
    [imagef mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.top.equalTo(@10);
        make.bottom.equalTo(bgViewf).offset(-10);
        make.width.equalTo(@30);
        
    }];
    ///  闪超市
    UILabel*markf = [[UILabel alloc]init];
    markf.text = @"闪送超市";
    markf.font = [UIFont systemFontOfSize:12];
    [bgViewf addSubview:markf];
    
    [markf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imagef.mas_right).offset(10);
        make.top.equalTo(@10);
        
        make.width.equalTo(@100);
        
    }];
    
    
    
    UILabel *linef = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, AXFMainScreenWidth, 1)];
    linef.backgroundColor = [UIColor darkGrayColor];
    [self addSubview:linef];
    
    
    //底部视图的 背景
    UIView *bgViewf2 = [[UIView alloc]initWithFrame:CGRectMake(0, 41, AXFMainScreenWidth, 62)];
    [self addSubview:bgViewf2];
    
    /// 收货L
    UILabel* receiptf= [[UILabel alloc]init];
    receiptf.text = @"收货时间";
    receiptf.font = [UIFont systemFontOfSize:12];
    [bgViewf2 addSubview:receiptf];
    
    [receiptf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgViewf2).offset(10);
        make.top.equalTo(@4);
        make.width.equalTo(@60);
        
    }];
    
    /// 收货L
    UILabel* contentf= [[UILabel alloc]init];
    contentf.text = @"  ¥0元起送，22：00前¥30减免运费，22：00后满¥69减免运费";
    contentf.font = [UIFont systemFontOfSize:13];
    contentf.textColor = [UIColor grayColor];
    [bgViewf2 addSubview:contentf];
    
    [contentf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgViewf2).offset(10);
        make.top.equalTo(receiptf.mas_bottom);
        make.bottom.equalTo(bgViewf2).offset(-10);
        make.right.equalTo(bgViewf2);
        
    }];
    
    /// 时间L
    UILabel* timef= [[UILabel alloc]init];
    timef.text = @"-1小时送达(可以预定)";
    timef.font = [UIFont systemFontOfSize:12];
    timef.textColor = [UIColor redColor];
    [bgViewf2 addSubview:timef];
    
    [timef mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(receiptf);
        make.right.equalTo(bgViewf2).offset(-20);
    }];
    
    
    
}

@end
