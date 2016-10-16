//
//  AXFAddAddressController.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFAddAddressController.h"
#import "AXFAddNameCell.h"
#import "AXFAddSexCell.h"
#import "AXFAddCityCell.h"
#import "AXFAddPrefectureCell.h"
#import "AXFPhoneNumCell.h"
#import "AXFAddDetailCell.h"



@interface AXFAddAddressController ()

@end

@implementation AXFAddAddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 44;
    self.tableView.tableFooterView = [[UIView alloc] init];
//    self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleSingleLineEtched
    //注册Cell
    [self.tableView registerClass:[AXFAddNameCell class] forCellReuseIdentifier:@"NAME_CELL_ID"];
    [self.tableView registerClass:[AXFAddSexCell class] forCellReuseIdentifier:@"SEX_CELL_ID"];
    [self.tableView registerClass:[AXFPhoneNumCell class] forCellReuseIdentifier:@"PHONE_NUM_CELL_ID"];
    [self.tableView registerClass:[AXFAddCityCell class] forCellReuseIdentifier:@"CITY_CELL_ID"];
    [self.tableView registerClass:[AXFAddPrefectureCell class] forCellReuseIdentifier:@"PREFECTRUE_CELL_ID"];
    [self.tableView registerClass:[AXFAddDetailCell class] forCellReuseIdentifier:@"DETAIL_CELL_ID"];
    
    
}
#pragma mark - 代理方法


#pragma mark - 数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        AXFAddNameCell *name_cell = [tableView dequeueReusableCellWithIdentifier:@"NAME_CELL_ID" forIndexPath:indexPath];
                    return name_cell;
    }
    if (indexPath.row == 1) {
        AXFAddSexCell *sex_cell = [tableView dequeueReusableCellWithIdentifier:@"SEX_CELL_ID" forIndexPath:indexPath];
                    return sex_cell;
    }
    if (indexPath.row == 2) {
        AXFPhoneNumCell *phoneNum_cell = [tableView dequeueReusableCellWithIdentifier:@"PHONE_NUM_CELL_ID" forIndexPath:indexPath];
                        return phoneNum_cell;
    }    if (indexPath.row == 3) {
        AXFAddCityCell *city_cell = [tableView dequeueReusableCellWithIdentifier:@"CITY_CELL_ID" forIndexPath:indexPath];
        return city_cell;
    }
    if (indexPath.row == 4) {
        AXFAddPrefectureCell *prefecture_cell = [tableView dequeueReusableCellWithIdentifier:@"PREFECTRUE_CELL_ID" forIndexPath:indexPath];
        return prefecture_cell;
    }
        AXFAddDetailCell *detail_cell = [tableView dequeueReusableCellWithIdentifier:@"DETAIL_CELL_ID" forIndexPath:indexPath];
        return detail_cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
