//
//  AXFNoPayController.m
//  AiXianFeng
//
//  Created by apple on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFNoPayController.h"

@interface AXFNoPayController ()

@end

@implementation AXFNoPayController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIImageView* imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"empty_order"]];
    
    [self.view addSubview:imgV];
    
    // 添加约束条件
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view.mas_centerY).offset(-90);
        
    }];
    
    // 创建lebel
    
    UILabel* label = [UILabel cz_labelWithText:@"还没有订单哦~" fontSize:15 color:[UIColor grayColor]];
    
    [self.view addSubview:label];
    
    // 设置约束条件
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.offset(0);
        make.top.equalTo(imgV.mas_bottom).offset(20);
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
