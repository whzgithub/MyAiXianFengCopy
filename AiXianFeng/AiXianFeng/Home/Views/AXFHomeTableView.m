//
//  AXFHomeTableView.m
//  AiXianFeng
//
//  Created by whz on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFHomeTableView.h"
#import "AXFHomeHeaderView.h"

#define KHOMETABLECELLID @"kHomeTableCellID"

@interface AXFHomeTableView () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation AXFHomeTableView

- (instancetype) initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

- (void) setupUI{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds];
    [self addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:KHOMETABLECELLID];
    
    AXFHomeHeaderView *headerView = [[AXFHomeHeaderView alloc] init];
    headerView.backgroundColor = [UIColor lightGrayColor];
    tableView.tableHeaderView = headerView;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KHOMETABLECELLID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

@end
