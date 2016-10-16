//
//  AXFNewsViewController.m
//  AiXianFeng
//
//  Created by 何香绪 on 16/10/16.
//  Copyright © 2016年 LongChuang. All rights reserved.
//


#import "AXFNewsViewController.h"

@interface AXFNewsViewController ()

@end

@implementation AXFNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.navigationItem.title = @"我的优惠券";
    
    
    [self setupUI];
}


-(void)setupUI{
    
    
    UIImageView *image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"H107"]];
    
    [self.view addSubview:image1];
    
    [image1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
        make.left.bottom.right.top.equalTo(self.view);
    }];
 
}

@end
