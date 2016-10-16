//
//  AXFIntegralViewController.m
//  AiXianFeng
//
//  Created by 何香绪 on 16/10/16.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFIntegralViewController.h"

@interface AXFIntegralViewController ()

@end

@implementation AXFIntegralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
}



-(void)setupUI{
    
    self.navigationItem.title = @"积分商城";
    UIScrollView *view1 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 375, 1000)];
    
    [self.view addSubview:view1];
    
    //创建图片
    UIImageView *image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"H131"]];
    [view1 addSubview:image1];
    image1.backgroundColor = [UIColor redColor];
    
    [image1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view1);
        make.width.offset(375);
        make.height.offset(200);
        
    }];
    
    //创建按钮 兑换记录
    UIButton *btn1 = [[UIButton alloc]init];
    [view1 addSubview:btn1];
    btn1.backgroundColor = [UIColor grayColor];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"H132"] forState:UIControlStateNormal];
    
    //创建按钮 积分规则
    UIButton *btn2 = [[UIButton alloc]init];
    [view1 addSubview:btn2];
    btn2.backgroundColor = [UIColor greenColor];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"H133"] forState:UIControlStateNormal];
    
    NSArray *arrM = @[btn1,btn2];
    
    [arrM mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [arrM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(image1.mas_bottom);
        make.height.offset(44);
    }];
    
    
    //创建按钮 兑换卷第一排 01
    UIButton *btn3 = [[UIButton alloc]init];
    [view1 addSubview:btn3];
    btn3.backgroundColor = [UIColor grayColor];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"H134"] forState:UIControlStateNormal];
    
    //创建按钮 兑换券第一排 02
    UIButton *btn4 = [[UIButton alloc]init];
    [view1 addSubview:btn4];
    btn4.backgroundColor = [UIColor yellowColor];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"H135"] forState:UIControlStateNormal];
    
    NSArray *arrB = @[btn3,btn4];
    
    [arrB mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [arrB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn1.mas_bottom).offset(5);
        make.height.offset(160);
        make.width.offset(187.5);
        
    }];
    
    
    //创建按钮 兑换卷第二排 01
    UIButton *btn5 = [[UIButton alloc]init];
    [view1 addSubview:btn5];
    btn5.backgroundColor = [UIColor grayColor];
    [btn5 setBackgroundImage:[UIImage imageNamed:@"H136"] forState:UIControlStateNormal];
    
    //创建按钮 兑换券第二排 02
    UIButton *btn6 = [[UIButton alloc]init];
    [view1 addSubview:btn6];
    btn6.backgroundColor = [UIColor blueColor];
    [btn6 setBackgroundImage:[UIImage imageNamed:@"H137"] forState:UIControlStateNormal];
    
    NSArray *arrC = @[btn5,btn6];
    
    [arrC mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [arrC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn3.mas_bottom);
        make.height.offset(160);
        make.width.offset(187.5);
        
    }];
    
}

@end
