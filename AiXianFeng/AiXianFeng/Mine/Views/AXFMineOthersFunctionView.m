//
//  AXFMineOthersFunctionView.m
//  AiXianFeng
//
//  Created by whz on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMineOthersFunctionView.h"

@implementation AXFMineOthersFunctionView

- (instancetype) initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

-(void)buttenClick4:(UIButton *)btn{
    
    self.index = btn.tag;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
}

- (void) setupUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn4 = [[UIButton alloc]init];
    btn4.tag = 4;
    btn4.backgroundColor = [UIColor purpleColor];
    
    [self addSubview:btn4];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"H29"] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(buttenClick4:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn5 = [[UIButton alloc]init];
    
    btn5.backgroundColor = [UIColor blackColor];
    
    [self addSubview:btn5];
    [btn5 setBackgroundImage:[UIImage imageNamed:@"H30"] forState:UIControlStateNormal];
    btn5.tag = 5;
    [btn5 addTarget:self action:@selector(buttenClick4:) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton *btn6 = [[UIButton alloc]init];
    
    btn6.backgroundColor = [UIColor redColor];
    
    [self addSubview:btn6];
    [btn6 setBackgroundImage:[UIImage imageNamed:@"H31"] forState:UIControlStateNormal];
     btn6.tag = 6;
    [btn6 addTarget:self action:@selector(buttenClick4:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn7 = [[UIButton alloc]init];
    
    btn7.backgroundColor = [UIColor blueColor];
    
    [self addSubview:btn7];
    [btn7 setBackgroundImage:[UIImage imageNamed:@"H32"] forState:UIControlStateNormal];
     btn7.tag = 7;
    [btn7 addTarget:self action:@selector(buttenClick4:) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSArray *arrB = @[btn4,btn5,btn6,btn7];
    
    [arrB mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [arrB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.height.offset(109);
    }];
    
    UIButton *btn8 = [[UIButton alloc]init];
    
    btn8.backgroundColor = [UIColor blueColor];
    
    [self addSubview:btn8];
    
    [btn8 setBackgroundImage:[UIImage imageNamed:@"H33"] forState:UIControlStateNormal];
     btn8.tag = 8;

    [btn8 addTarget:self action:@selector(buttenClick4:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn8 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(btn7.mas_bottom).offset(2);
        make.height.offset(109);
        make.width.offset(93.75);
    }];
    
    
    
    
}

@end