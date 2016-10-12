//
//  AXFFreshToHomeCell.m
//  AiXianFeng
//
//  Created by Long on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFFreshToHomeCell.h"
#import "Masonry.h"
#import "AXFFreshToHomeViews.h"
@implementation AXFFreshToHomeCell
//  重写cell的样式方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
        
    }
    return self;
}


#pragma 创建控件界面
- (void)setupUI{
    
    
    
    //1.View
    UIView* v = [[UIView alloc]init];
    
    [self.contentView addSubview:v];
    //  2,水平布局
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).offset(0);
    }];
    
    // 图片
    UIImageView * iconV = [[UIImageView alloc]init];
    iconV.image = [UIImage imageNamed:@"201609232046093.png@90Q"];
    [v addSubview:iconV];
    
    
    [iconV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(v);
        make.right.equalTo(v);
        make.left.equalTo(v);
    }];
    
    //  定义一个用来放图片的数组
    NSArray* btns = [NSArray array];
    
    //2.新鲜推介图片
    
    UIButton* btn1 = [[UIButton alloc]init];
    //  设置按钮的背景图片
    [btn1 setBackgroundImage:[UIImage imageNamed:@"2016092414525284.png@90Q"] forState:UIControlStateNormal];
    
    [v addSubview:btn1];
    
    UIButton* btn2 = [[UIButton alloc]init];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"2016092418581322.png@90Q"] forState:UIControlStateNormal];
    [v addSubview:btn2];
    
    btns = @[btn1,btn2 ];
    
    // 水平布局按钮的约束
    [btns mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:8 leadSpacing:8 tailSpacing:8];
    [btns mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(iconV.mas_bottom);
        
    }];
    
    
    
    
    
    AXFFreshToHomeViews*view1 = [[AXFFreshToHomeViews alloc]init];
    [v addSubview:view1];
    
    AXFFreshToHomeViews*view2 = [[AXFFreshToHomeViews alloc]init];
    [v addSubview:view2];
    
    UIView* v1 = [[UIView alloc]init];
    
    UIButton* btn3 = [[UIButton alloc]init];
    //  设置按钮的背景图片
    [btn3 setBackgroundImage:[UIImage imageNamed:@"201609241500124.jpg@90Q"] forState:UIControlStateNormal];
    //    [btn3 setImage:[UIImage imageNamed:@"201609241500124.jpg@90Q"] forState:UIControlStateNormal];
    btn3.contentMode = UIViewContentModeCenter;
    //    [btn3 setContentMode:UIViewContentModeScaleAspectFit];
    [v1 addSubview:btn3];
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(v1).offset(0);
    }];
    
    [v addSubview:v1];
    
    
    NSArray *arr = @[view1,view2,v1];
    
    [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [arr mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(btn2.mas_bottom);
        
    }];
}

@end

