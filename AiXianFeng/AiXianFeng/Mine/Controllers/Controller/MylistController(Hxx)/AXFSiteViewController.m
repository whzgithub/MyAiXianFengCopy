//
//  AXFSiteViewController.m
//  AiXianFeng
//
//  Created by 何香绪 on 16/10/16.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFSiteViewController.h"

@interface AXFSiteViewController ()

@end

@implementation AXFSiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"管理收货地址";
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIView *viewT = [[UIView alloc]init];
    [self.view addSubview:viewT];
    viewT.backgroundColor = [UIColor whiteColor];
    
    
    [viewT mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.view);
        make.left.right.equalTo(self.view);
        make.height.offset(44);
    }];
    
    //新增地址
    UIButton *btn1 =[[UIButton alloc]init];
    [viewT addSubview:btn1];
    btn1.backgroundColor = [UIColor blueColor];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"H105"] forState:UIControlStateNormal];
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(viewT).offset(5);
        make.bottom.equalTo(viewT).offset(-5);
        make.left.equalTo(viewT).offset(90);
        make.right.equalTo(viewT).offset(-90);
        
    }];
    
    UIImageView *image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"H106"]];
    
    [self.view addSubview:image1];
    
    [image1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.offset(30);
        make.top.offset(40);
 
        
    }];

    
}

@end

