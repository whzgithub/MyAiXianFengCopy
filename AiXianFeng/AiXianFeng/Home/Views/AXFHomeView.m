//
//  AXFHomeView.m
//  AiXianFeng
//
//  Created by whz on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFHomeView.h"
#import "AXFHomeHeaderView.h"

#define KHOMETABLECELLID @"kHomeTableCellID"

@interface AXFHomeView () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation AXFHomeView

- (instancetype) initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

- (void) setupUI{
    
    UITableView *homeTableView = [[UITableView alloc] initWithFrame:self.bounds];
    [self addSubview:homeTableView];
    
    homeTableView.delegate = self;
    homeTableView.dataSource = self;
    
    [homeTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:KHOMETABLECELLID];
    
    AXFHomeHeaderView *homeHeaderView = [[AXFHomeHeaderView alloc] init];
    homeHeaderView.backgroundColor = [UIColor lightGrayColor];
    homeTableView.tableHeaderView = homeHeaderView;
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
