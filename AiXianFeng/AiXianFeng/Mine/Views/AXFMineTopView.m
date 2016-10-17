//
//  AXFMineView.m
//  AiXianFeng
//
//  Created by whz on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//
#import "AXFMineTopView.h"
#import "UIColor+CZAddition.h"

@interface AXFMineTopView ()

@end

@implementation AXFMineTopView
{
    NSArray* _arrC;
}
- (instancetype) initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame] ) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - 初始化界面
/// 初始化界面
- (void) setupUI {
    
    // 创建背景图片
    UIImageView *imgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"v2_my_avatar_bg"]];
    [self addSubview:imgV];
    
    //创建下面的view
    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = [UIColor yellowColor];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self);
        make.left.equalTo(self);
        make.width.offset(375);
        make.height.offset(40);
        
    }];
    
    // 右上角设置按钮
    UIButton *btn1 = [[UIButton alloc]init];
    [self addSubview:btn1];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"v2_my_settings_icon"] forState:UIControlStateNormal];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).offset(8);
        make.right.equalTo(self).offset(-10);
        make.height.offset(22);
        
    }];
    
    // 箭头按钮
    UIButton *btn2 = [[UIButton alloc]init];
    [self addSubview:btn2];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"icon_go"] forState:UIControlStateNormal];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(btn1.mas_bottom).offset(30);
        make.right.equalTo(btn1);
        make.height.offset(20);
        make.width.offset(10);
        
    }];
    
    
    // 头像
    UIImageView *me = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"H101"]];
    [self addSubview:me];
    [me mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(btn1.mas_bottom);
        make.left.equalTo(self).offset(5);
    }];
    
    
    // 电话号码
    UIButton *information = [[UIButton alloc]init];
    [self addSubview:information];
    information.backgroundColor = [UIColor grayColor];
    [information setTitle:@"马云" forState:UIControlStateNormal];
    [information setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    // 清空背景颜色
    information.backgroundColor = [UIColor clearColor];
    
    // 设置文字居中
    information.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [information mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(me).offset(10);
        make.left.equalTo(me.mas_right).offset(5);
        make.height.offset(30);
        make.width.offset(180);
        
    }];
    
    
//    // VIP等级
    UIButton *vip = [[UIButton alloc]init];
    [self addSubview:vip];
    [vip setBackgroundImage:[UIImage imageNamed:@"icon_member"] forState:UIControlStateNormal];
//    [vip setTitle:@"VIP 10" forState:UIControlStateNormal];
//    vip.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    vip.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    // 清空背景颜色
    vip.backgroundColor = [UIColor clearColor];
//    
//    [vip setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 20, 80)];
//    [vip setTitleEdgeInsets:UIEdgeInsetsMake(0, 40, 0, 0)];
    // 设置文字左对齐
    vip.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [vip mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(information.mas_bottom).offset(10);
        make.left.equalTo(me.mas_right).offset(5);
        make.height.offset(25);
        make.width.offset(80);
//        make.width.offset(1);
        
    }];
    
    // vip等级
    UIButton *vipLevel = [[UIButton alloc]init];
    [self addSubview:vipLevel];
    [vipLevel setTitle:@"VIP99" forState:UIControlStateNormal];
    [vipLevel setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    // 清空背景颜色
    vipLevel.backgroundColor = [UIColor clearColor];
    vipLevel.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [vipLevel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(vip.mas_top).offset(9.5);
        make.left.equalTo(vip.mas_left).offset(25);
        make.height.offset(5);
        make.width.offset(80);
        
    }];
    

    
    
    //TopView下面的界面
    
    
    UIButton *btn3 = [[UIButton alloc]init];
    [topView addSubview:btn3];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"H40"] forState:UIControlStateNormal];
    btn3.backgroundColor =[UIColor blueColor];
    
    
    
    UIButton *btn4 = [[UIButton alloc]init];
    [topView addSubview:btn4];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"H43"] forState:UIControlStateNormal];
    btn4.backgroundColor = [UIColor greenColor];
    
    NSArray *arrB = @[btn3,btn4];
    
    
    [arrB mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [arrB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(topView);
        make.width.offset(187.5);
    }];
    
 
    // 添加点击事件
    
    NSArray* arrC = @[btn2,information,vip,vipLevel,btn3,btn4,btn1];
    
    [arrC enumerateObjectsUsingBlock:^(UIButton* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [obj addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }];
    
    _arrC = arrC;

    
}

- (void)btnClick:(UIButton*)sender
{
    
    // 1.获取按钮所在集合中的索引
    NSInteger idx = [_arrC indexOfObject:sender];
    _idx = idx;
    
    // 2.发送事件,让scrollView滚动!
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    
}

@end

