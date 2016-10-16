//
//  AXFShopCollectController.m
//  AiXianFeng
//
//  Created by apple on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFShopCollectController.h"

@interface AXFShopCollectController ()

@end

@implementation AXFShopCollectController

- (void)viewDidLoad {
    [super viewDidLoad];
    
      self.navigationItem.title = @"商品店铺";
    
    // 创建lebel
    
    UILabel* label = [UILabel cz_labelWithText:@"还没有收藏商品哦" fontSize:15 color:[UIColor grayColor]];
    
    [self.view addSubview:label];
    
    // 添加约束条件
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view.mas_centerY).offset(-200);
        
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
