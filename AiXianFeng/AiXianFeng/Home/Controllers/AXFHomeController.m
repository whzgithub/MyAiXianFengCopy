//
//  AXFHomeController.m
//  AiXianFeng
//
//  Created by Long on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFHomeController.h"
#import "AXFHomeTableView.h"

@implementation AXFHomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self setupUI];
}

- (void) setupUI {
    
    AXFHomeTableView *homeTableView = [[AXFHomeTableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:homeTableView];
}

@end

