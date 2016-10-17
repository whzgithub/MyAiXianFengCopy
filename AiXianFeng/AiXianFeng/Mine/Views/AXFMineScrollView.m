//
//  AXFMineScrollView.m
//  AiXianFeng
//
//  Created by whz on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMineScrollView.h"
#import "AXFMineController.h"
#import "AXFMineOrderView.h"
#import "AXFMineWalletView.h"
#import "AXFMineOthersFunctionView.h"
#import "UIColor+CZAddition.h"

@interface AXFMineScrollView ()

@end

@implementation AXFMineScrollView

- (instancetype) initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

- (void) setupUI {
    
    CGFloat lineH = 12;
    CGFloat mineOrderViewY = 120 + lineH;
    CGFloat mineWalletViewY = mineOrderViewY + lineH;
    CGFloat mineOthersFunctionViewY = mineOrderViewY + mineWalletViewY + lineH;
    CGFloat mineOthersFunctionViewH = 220;
    
    self.backgroundColor = [UIColor cz_colorWithRed:239 green:239 blue:239];
    self.contentSize = CGSizeMake(0, mineOthersFunctionViewY+mineOthersFunctionViewH+145);
    self.scrollEnabled = YES;
    self.showsVerticalScrollIndicator = YES;

    // 自定义“我的“我的钱包
    AXFMineWalletView *mineWalletView = [[AXFMineWalletView alloc] initWithFrame:CGRectMake(0, mineWalletViewY+lineH, [UIScreen mainScreen].bounds.size.width, mineOrderViewY)];
    [mineWalletView addTarget:self action:@selector(buttenClick5:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:mineWalletView];

    // 自定义“我的“我的下面界面
    AXFMineOthersFunctionView *mineOthersFunctionView = [[AXFMineOthersFunctionView alloc] initWithFrame:CGRectMake(0, mineOthersFunctionViewY+lineH, [UIScreen mainScreen].bounds.size.width, mineOthersFunctionViewH)];
    
    [mineOthersFunctionView addTarget:self action:@selector(buttenClick4:) forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:mineOthersFunctionView];
}


-(void)buttenClick4:(AXFMineOthersFunctionView *)sender
{
    
    if (self.ckBlock) {
        self.ckBlock(sender);
    }
    
    
}
-(void)buttenClick5:(AXFMineOthersFunctionView *)sender2
{
    
    if (self.ckBlock) {
        self.ckBlock(sender2);
    }
    
    
}
@end
