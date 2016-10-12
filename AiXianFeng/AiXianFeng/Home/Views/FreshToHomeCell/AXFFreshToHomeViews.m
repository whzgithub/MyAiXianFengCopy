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
    UIButton* btns = [[UIButton alloc]init];
    //  设置按钮的背景图片
    [btns setBackgroundImage:[UIImage imageNamed:@"20160114110732_538131.jpg@!goods_recom"] forState:UIControlStateNormal];
    
    btns.contentMode = UIViewContentModeCenter;
    
    [self addSubview:btns];
    
    [btns mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self);
        make.width.mas_equalTo(([UIScreen mainScreen].bounds.size.width - 20) / 3);
        
    }];
    
    
    // 2.名称
    UILabel *nameL = [[UILabel alloc]init];
    nameL.text = @"[次日达]进口牛油果";
    nameL.font = [UIFont systemFontOfSize:10];
    nameL.textColor = [UIColor blackColor];
    [self addSubview:nameL];
    
    
    [nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(btns.mas_bottom);
        make.right.equalTo(btns);
        
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
        make.right.equalTo(btns);
    }];
    
    //     2.容量
    UILabel *nameL2 = [[UILabel alloc]init];
    nameL2.text = @"560-720/4粒";
    nameL2.font = [UIFont systemFontOfSize:12];
    nameL2.textColor = [UIColor lightGrayColor];
    [self addSubview:nameL2];
    
    [nameL2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(nameL1.mas_bottom);
        make.right.equalTo(btns);
    }];
    
    // 2.价格
    UITextField *price = [[UITextField alloc]init];
    price.text = @"¥29.9";
    price.font = [UIFont systemFontOfSize:12];
    price.textColor = [UIColor redColor];
    price.textAlignment = NSTextAlignmentCenter;
    [self addSubview:price];
    
    
    // 添加图片
    UIButton* btnimage = [[UIButton alloc]init];
    
    
    [btnimage setImage:[UIImage imageNamed:@"v2_notice_dot"] forState:UIControlStateNormal];
    btnimage.contentMode = UIViewContentModeCenter;
    [self addSubview:btnimage];
    
    NSArray* arr = @[price,btnimage];
    
    
    [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [arr mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(nameL2.mas_bottom);
        
    }];
    
    
}
@end
