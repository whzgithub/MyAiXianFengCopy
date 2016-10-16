//
//  AXFMarketProductOrderView.m
//  AiXianFeng
//
//  Created by whz on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMarketProductOrderView.h"

@implementation AXFMarketProductOrderView

- (instancetype) initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - 初始化UI
/// 初始化UI
- (void) setupUI {
    
    /// 按综合排序
    UIButton *buttonSum = [[UIButton alloc] init];
    buttonSum.titleLabel.font = [UIFont systemFontOfSize:14];
    [buttonSum setTitle:@"综合排序" forState:UIControlStateNormal];
    [buttonSum setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonSum setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [self addSubview:buttonSum];
    buttonSum.tag = 1;
    
    /// 按价格排序
    UIButton *buttonPrice = [[UIButton alloc] init];
    buttonPrice.titleLabel.font = [UIFont systemFontOfSize:14];
    [buttonPrice setTitle:@"按价格" forState:UIControlStateNormal];
    [buttonPrice setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonPrice setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [self addSubview:buttonPrice];
    
    buttonPrice.selected = NO;
    buttonPrice.tag = 2;
    [buttonPrice addTarget:self action:@selector(buttonPriceClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    /// 按销量排序
    UIButton *buttonSaleNum = [[UIButton alloc] init];
    buttonSaleNum.titleLabel.font = [UIFont systemFontOfSize:14];
    [buttonSaleNum setTitle:@"按销量" forState:UIControlStateNormal];
    [buttonSaleNum setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonSaleNum setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [self addSubview:buttonSaleNum];
    buttonSaleNum.tag = 3;
    
    /// btn水平布局
    NSArray *btnArray = @[buttonSum,buttonPrice,buttonSaleNum];
    [btnArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    ///
    [btnArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.size.mas_offset(CGSizeMake((AXFMainScreenWidth - 80)/3, 60));
    }];
}

/// 价格点击
-(void)buttonPriceClick:(UIButton *)sender
{
    if (self.priceOrderBlock != nil) {
        
        sender.selected = (sender.selected ? NO : YES);
        self.priceOrderBlock(sender);
    }
}


@end
