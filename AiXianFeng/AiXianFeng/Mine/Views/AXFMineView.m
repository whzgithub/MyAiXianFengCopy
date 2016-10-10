//
//  AXFMineView.m
//  AiXianFeng
//
//  Created by whz on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMineView.h"
#import "AXFMineHeaderView.h"

#define KMINETABLEVIEWCELLID @"kMineTableViewCellID"

@interface AXFMineView () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation AXFMineView

- (instancetype) initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame] ) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - 初始化界面
/// 初始化界面
- (void) setupUI {

    // 创建tableView
    UITableView *mineTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.origin.y + 180, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 180) style:UITableViewStyleGrouped];
    [self addSubview:mineTableView];
    
    // MARK: - 设置代理
    // 设置代理
    mineTableView.delegate = self;
    mineTableView.dataSource = self;
    
    // 注册cell
    [mineTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:KMINETABLEVIEWCELLID];
    
    // 创建我的头布局
    AXFMineHeaderView *mineHeaderView = [[AXFMineHeaderView alloc] init];
    [self addSubview:mineHeaderView];
}

#pragma mark - 数据源方法
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KMINETABLEVIEWCELLID forIndexPath:indexPath];
    
    return cell;
}

@end
