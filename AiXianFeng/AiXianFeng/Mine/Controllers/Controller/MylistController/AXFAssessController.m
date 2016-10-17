//
//  AXFAssessController.m
//  AiXianFeng
//
//  Created by apple on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFAssessController.h"

@interface AXFAssessController ()

@end

@implementation AXFAssessController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIImageView* imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"v2_order_empty"]];
    
    [self.view addSubview:imgV];
    
    // 添加约束条件
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view.mas_centerY).offset(-90);
        
    }];
    
    // 创建lebel
    
    UILabel* label = [UILabel cz_labelWithText:@"还没有评价哦~" fontSize:15 color:[UIColor grayColor]];
    
    [self.view addSubview:label];
    
    // 设置约束条件
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.offset(0);
        make.top.equalTo(imgV.mas_bottom).offset(20);
        
    }];
}


@end
