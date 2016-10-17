//
//  AXFCouponViewController.m
//  AiXianFeng
//
//  Created by 何香绪 on 16/10/16.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFCouponViewController.h"

@interface AXFCouponViewController ()

@end

@implementation AXFCouponViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"优惠券";
    [self setupUI];
}


-(void)setupUI
{
    
    UIImageView *image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"v2_coupon_empty"]];
    
    [self.view addSubview:image1];
    
    [image1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //        make.center.equalTo(self.view);
        make.top.equalTo(self.view).offset(150);
        make.left.equalTo(self.view).offset(145);
    }];
    
    //文字
    UILabel *nameL = [[UILabel alloc]init];
    nameL.text = @"你还没有卷哦";
    nameL.font = [UIFont systemFontOfSize:15];
    nameL.textColor = [UIColor grayColor];
    [self.view addSubview:nameL];
    
    
    [nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(image1);
        make.top.equalTo(image1.mas_bottom).offset(15);
        
    }];
    
    //兑换积分卷
    UIButton *btn1 =[[UIButton alloc]init];
    [self.view addSubview:btn1];
    btn1.backgroundColor = [UIColor blueColor];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"H148"] forState:UIControlStateNormal];
    // 清空背景颜色
    btn1.backgroundColor = [UIColor clearColor];
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(nameL.mas_bottom).offset(20);
        make.left.equalTo(nameL).offset(-20);
        make.right.equalTo(nameL).offset(10);
        
    }];
    
    
}

@end
