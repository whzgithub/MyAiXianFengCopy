//
//  AXFJoinViewController.m
//  AiXianFeng
//
//  Created by 何香绪 on 16/10/16.
//  Copyright © 2016年 LongChuang. All rights reserved.
//


#import "AXFJoinViewController.h"

@interface AXFJoinViewController ()

@end

@implementation AXFJoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"关于我们";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"H104"]];
    
    [self.view addSubview:image1];
    
    [image1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.offset(30);
        
        
    }];
    
}
@end
