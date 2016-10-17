//
//  AXFCartEmptyController.m
//  AiXianFeng
//
//  Created by mac on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFCartEmptyView.h"

@implementation AXFCartEmptyView

// 如果homeTopView是通过代码来创建就会调用此方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{

    
    //商品图片
    UIImageView* imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"v2_shop_empty"]];
    
    [self addSubview:imgV];
    
    // 添加约束条件
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.centerY.equalTo(self.mas_centerY).offset(-60);
        
    }];
    
    // 创建lebel
    
    UILabel* label = [UILabel cz_labelWithText:@"亲 ， 购物车空空的耶~赶紧去挑好吃的吧" fontSize:15 color:[UIColor grayColor]];
    
    [self addSubview:label];
    
    // 设置约束条件
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.offset(0);
        make.top.equalTo(imgV.mas_bottom).offset(20);
        
    }];
    
    // 创建按钮
    
    UIButton* button = [UIButton cz_textButton:@"去逛逛" fontSize:14 normalColor:[UIColor lightGrayColor] selectedColor:[UIColor whiteColor]];
    
    [self addSubview:button];
    
    UIImageView *backgroudView = [[UIImageView alloc] init];
    backgroudView.image = [UIImage imageNamed:@"btn.png"];
    
    [self addSubview:backgroudView];
    
    // 设置约束条件
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.offset(0);
        make.top.equalTo(label.mas_bottom).offset(10);
        
    }];
    
    [backgroudView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(button).mas_equalTo(UIEdgeInsetsMake(-2, -60, -2, -60));
        
        
    }];
    

    
    // 给按钮添加点击事件
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

// 实现按钮点击方法
- (void)btnClick
{
    
    if ([self.delegate respondsToSelector:@selector(AXFCartEmptyView:)]) {
        [self.delegate AXFCartEmptyView:self];
    }
    
}

@end
