//
//  AXFHomeController.m
//  AiXianFeng
//
//  Created by Long on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFHomeController.h"
#import "AXFHomeView.h"
@implementation AXFHomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    // 初始化UI
    [self setupUI];
}


-(void)setupUI
{
    // 创建主页view
    AXFHomeView *homeView = [[AXFHomeView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 110)];
    [self.view addSubview:homeView];
}

@end

