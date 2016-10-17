//
//  AXFHscoringViewController.m
//  AiXianFeng
//
//  Created by 何香绪 on 16/10/16.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFHscoringViewController.h"

@interface AXFHscoringViewController ()

@end

@implementation AXFHscoringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cz_colorWithRed:243 green:243 blue:243];
    self.navigationItem.title = @"积分";
    
    [self setupUI];
}

-(void)setupUI
{
    
    //积分上界面
    UIView *view1 = [[UIView alloc]init];
    
    [self.view addSubview:view1];
    
    view1.backgroundColor = [UIColor whiteColor];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(self.view);
        make.height.offset(180);
        
    }];
    
    //当前积分
    UIImageView *image2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"H150"]];
    [view1 addSubview:image2];
    
    [image2 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(view1).offset(-5);
        make.bottom.equalTo(view1.mas_bottom);
        make.left.equalTo(view1).offset(100);
    }];
    
    //积分下界面
    
    UIImageView *image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"v2_pointTicket_empty"]];
    [self.view addSubview:image1];
    [image1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view1.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(140);
        
    }];
    
    //文字
    UILabel *nameL = [[UILabel alloc]init];
    nameL.text = @"还没有积分哦~";
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
    [btn1 setBackgroundImage:[UIImage imageNamed:@"H149"] forState:UIControlStateNormal];
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(nameL.mas_bottom).offset(20);
        make.left.equalTo(nameL).offset(-26);
        make.right.equalTo(nameL).offset(10);
        
    }];
    
    
}

@end
