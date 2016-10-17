//
//  AXFMineWalletView.m
//  AiXianFeng
//
//  Created by whz on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMineWalletView.h"
#import <Masonry.h>

@implementation AXFMineWalletView

- (instancetype) initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

-(void)buttenClick5:(UIButton *)btn2{
    
    self.index = btn2.tag;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
}

- (void) setupUI {
    
 
    UIView *money = [[UIView alloc] init];
    money.backgroundColor = [UIColor whiteColor];
    [self addSubview:money];
    [money mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(3);
        make.bottom.mas_equalTo(-3);
       
        make.width.offset(375);
    }];
    
    UIImageView *imgM = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"H63"]];
    [self addSubview:imgM];
    [imgM mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(money);
        make.left.equalTo(money).offset(6);
        make.width.offset(80);
        make.height.offset(40);
        
    }];
    
    UIButton *btn1 = [[UIButton alloc] init];
    
    [self addSubview:btn1];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"H51"] forState:UIControlStateNormal];
    btn1.tag = 10;
    [btn1 addTarget:self action:@selector(buttenClick5:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn2 = [[UIButton alloc]init];
    
    [self addSubview:btn2];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"H52"] forState:UIControlStateNormal];
    btn2.tag = 11;
    [btn2 addTarget:self action:@selector(buttenClick5:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn3 = [[UIButton alloc]init];
    
    [self addSubview:btn3];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"H53"] forState:UIControlStateNormal];
    btn3.tag = 12;
    [btn3 addTarget:self action:@selector(buttenClick5:) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSArray *arrB = @[btn1,btn2,btn3];
    
    [arrB mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [arrB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgM.mas_bottom);
        make.height.offset(81);
    }];
    
    
}

@end