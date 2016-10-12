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
    //  设置同一间距
    CGFloat margin = 10;
    
    //1.图片新鲜到家
    UIImageView * iconV = [[UIImageView alloc]init];
    iconV.image = [UIImage imageNamed:@"bianlibian"];
    
    [self.contentView addSubview:iconV];
    
    [iconV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
    }];
    
    //  定义一个用来放图片的数组
    NSArray* btns = [NSArray array];
    
    //2.新鲜推介图片
    
    UIButton* btn1 = [[UIButton alloc]init];
    //    [btn1 setImage:[UIImage imageNamed:@"bianlibian2"] forState:UIControlStateNormal];
    //  设置按钮的背景图片
    [btn1 setBackgroundImage:[UIImage imageNamed:@"bianlibian2"] forState:UIControlStateNormal];
    
    [self.contentView addSubview:btn1];
    
    UIButton* btn2 = [[UIButton alloc]init];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"bianlibian3"] forState:UIControlStateNormal];
    [self.contentView addSubview:btn2];
    
    btns = @[btn1,btn2 ];
    
    // 水平布局按钮的约束
    [btns mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:8 leadSpacing:8 tailSpacing:8];
    [btns mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(iconV.mas_bottom);
        
    }];
    
    AXFFreshToHomeViews*view1 = [[AXFFreshToHomeViews alloc]init];
    [self.contentView addSubview:view1];
    
    
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn1.mas_bottom);
        make.left.equalTo(self.contentView);
        make.width.offset(self.contentView.bounds.size.width/3);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    
    AXFFreshToHomeViews*view2 = [[AXFFreshToHomeViews alloc]init];
    [self.contentView addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn1.mas_bottom);
        make.left.equalTo(view1.mas_right);
        make.width.offset(self.contentView.bounds.size.width/3);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    
    
    UIImageView* imageZ = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bianlibian4"]];
    
    [self.contentView addSubview:imageZ];
    [imageZ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view2.mas_right).offset(0);
        //         make.width.offset(self.contentView.bounds.size.width/3);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.top.equalTo(btn2.mas_bottom).offset(0);
    }];
    
    //
    //
    //    NSArray *arr = @[view1,view2,imageZ];
    //
    //        [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    //        [arr mas_makeConstraints:^(MASConstraintMaker *make) {
    //
    //            make.top.equalTo(btn2.mas_bottom);
    //            make.height.offset(self.contentView.bounds.size.height-95);
    //        }];
    //
    
    
}


@end
