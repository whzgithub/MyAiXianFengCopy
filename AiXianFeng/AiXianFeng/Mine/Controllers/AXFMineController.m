//
//  AXFMineController.m
//  AiXianFeng
//
//  Created by Long on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMineController.h"
#import "AXFMineView.h"

@implementation AXFMineController

- (void) viewDidLoad {

    [super viewDidLoad];
    
    // 自定义“我的”View
    AXFMineView *mineView = [[AXFMineView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:mineView];
}

@end
