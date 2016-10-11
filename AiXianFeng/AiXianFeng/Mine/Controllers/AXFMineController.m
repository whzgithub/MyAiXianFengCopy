//
//  AXFMineController.m
//  AiXianFeng
//
//  Created by Long on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMineController.h"
#import "AXFMineTopView.h"
#import "AXFMineScrollView.h"

@implementation AXFMineController

- (void) viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setupUI];
}

- (void) setupUI {
    
    CGFloat mineTopViewY = 180;
    CGFloat mineScrollViewH = 508;
    
    // 自定义“我的”顶部布局
    AXFMineTopView *mineTopView = [[AXFMineTopView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, mineTopViewY)];
    [self.view addSubview:mineTopView];
    
    // 自定义“我的”scrollView布局
    AXFMineScrollView *mineScrollView = [[AXFMineScrollView alloc] initWithFrame:CGRectMake(0, mineTopViewY, [UIScreen mainScreen].bounds.size.width, mineScrollViewH)];
    [self.view addSubview:mineScrollView];
    
}

@end
