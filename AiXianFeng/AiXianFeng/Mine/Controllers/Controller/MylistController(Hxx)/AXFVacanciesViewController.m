//
//  AXFVacanciesViewController.m
//  AiXianFeng
//
//  Created by 何香绪 on 16/10/16.
//  Copyright © 2016年 LongChuang. All rights reserved.
//
#import "AXFVacanciesViewController.h"

@interface AXFVacanciesViewController ()

@end

@implementation AXFVacanciesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.navigationItem.title = @"我的余额";
    
    [self setupUI];
    
}

-(void)setupUI
{
    //我的余额上面的界面
    UIView *view1 = [[UIView alloc]init];
    
    [self.view addSubview:view1];
    
    view1.backgroundColor = [UIColor whiteColor];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(self.view);
        make.height.offset(100);
        
    }];
    
    //总资产
    UILabel *nameL = [[UILabel alloc]init];
    nameL.text = @"总资产";
    nameL.font = [UIFont systemFontOfSize:12];
    nameL.textColor = [UIColor grayColor];
    [view1 addSubview:nameL];
    
    
    [nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.offset(170);
        make.top.offset(20);
        
    }];
    
    //价钱
    UILabel *nameM = [[UILabel alloc]init];
    nameM.text = @"💰 0.00";
    nameM.font = [UIFont systemFontOfSize:25];
    nameM.textColor = [UIColor redColor];
    [view1 addSubview:nameM];
    
    
    [nameM mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(nameL.mas_bottom).offset(10);
        make.left.equalTo(view1).offset(135);
        
    }];
    
    //创建下面的
    
    UIImageView *image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"H140"]];
    
    [self.view addSubview:image1];
    
    [image1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view1.mas_bottom).offset(80);
        make.left.equalTo(self.view).offset(140);
    }];
    
    //创建文字
    UILabel *nameD = [[UILabel alloc]init];
    nameD.text = @"暂无信息";
    nameD.font = [UIFont systemFontOfSize:15];
    nameD.textColor = [UIColor grayColor];
    [view1 addSubview:nameD];
    
    
    [nameD mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(image1.mas_bottom).offset(15);
        make.left.equalTo(image1).offset(15);
        
    }];
    
}



@end