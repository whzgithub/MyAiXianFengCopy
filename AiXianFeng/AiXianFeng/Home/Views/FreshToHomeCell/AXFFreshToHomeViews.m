//
//  AXFFreshToHomeViews.m
//  AiXianFeng
//
//  Created by mac on 16/10/12.
//  Copyright © 2016年 LongChuang. All rights reserved.

#import "AXFFreshToHomeViews.h"
#import "Masonry.h"
@interface  AXFFreshToHomeViews ()


@end

@implementation AXFFreshToHomeViews

//- (void)viewDidLoad{
//    [super viewDidLoad];
//    [self setupUI];
//
//
//}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}


#pragma mark - 添加控件
- (void)setupUI{
    
    
    // 3.实物图片
    UIImageView * image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bianlibian5"]];
    [self addSubview:image];
    
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self);
        
    }];
    
    
    // 2.名称
    UILabel *nameL = [[UILabel alloc]init];
    nameL.text = @"[次日达]进口牛油果";
    nameL.font = [UIFont systemFontOfSize:12];
    nameL.textColor = [UIColor blackColor];
    [self addSubview:nameL];
    
    
    [nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(image.mas_bottom);
        make.right.equalTo(image);
        
    }];
    
    
    //     2.精选
    UILabel *nameL1 = [[UILabel alloc]init];
    nameL1.text = @"精选";
    nameL1.font = [UIFont systemFontOfSize:12];
    nameL1.textColor = [UIColor redColor];
    [self addSubview:nameL1];
    
    [nameL1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(nameL.mas_bottom);
        make.right.equalTo(image);
    }];
    
    //     2.容量
    UILabel *nameL2 = [[UILabel alloc]init];
    nameL2.text = @"560-720/4粒";
    nameL2.font = [UIFont systemFontOfSize:14];
    nameL2.textColor = [UIColor lightGrayColor];
    [self addSubview:nameL2];
    
    [nameL2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(nameL1.mas_bottom);
        make.right.equalTo(image);
    }];
    
    // 2.价格
    UILabel *price = [[UILabel alloc]init];
    price.text = @"¥29.9";
    price.font = [UIFont systemFontOfSize:14];
    price.textColor = [UIColor redColor];
    price.textAlignment = NSTextAlignmentCenter;
    [self addSubview:price];
    
    [price mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(nameL2.mas_bottom).offset(8);
        make.right.equalTo(image.mas_centerX);
        
    }];
    
    // 添加图片
    UIButton* btnimage = [[UIButton alloc]init];
    [btnimage setBackgroundImage:[UIImage imageNamed:@"icon_food_increase_small_disable"] forState:UIControlStateNormal];
    [btnimage sizeToFit];
    [self addSubview:btnimage];
    
    [btnimage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(price.mas_right);
        make.top.equalTo(nameL2.mas_bottom).offset(6);
        make.right.equalTo(image);
    }];
    
    
}
@end
