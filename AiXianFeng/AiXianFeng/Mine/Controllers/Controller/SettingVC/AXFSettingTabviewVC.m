//
//  AXFSettingTabviewVC.m
//  AiXianFeng
//
//  Created by Long on 16/10/16.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFSettingTabviewVC.h"

@implementation AXFSettingTabviewVC

- (void)viewDidLoad
{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableFooterView = [[UIView alloc]init];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) return 8;
    if (section == 1) return 16;
    return 0.1;
}

// 取消选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


 - (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) return 3;
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"分享给朋友";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.textLabel.text = @"关于我们";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.textLabel.text = @"清除缓存";

        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:@"12.5M" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        // 按钮自适应文件大小
        [btn sizeToFit];
    
        // 把自定义的按钮设置成cell的accessoryView
        cell.accessoryView = btn;

        
        
        return cell;
    }
    if (indexPath.section == 1 && indexPath.row == 0) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        
        // 设置文字居中
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.text = @"退出当前账号";
        return cell;
    }
    
    return nil;
    
}
@end
