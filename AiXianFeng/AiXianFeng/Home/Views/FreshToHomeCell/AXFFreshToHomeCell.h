//
//  AXFFreshToHomeCell.h
//  AiXianFeng
//
//  Created by Long on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AXFFreshToHomeCell,AXFcgoods_detailModel;
@protocol XFFreshToHomeCellDelegate <NSObject>

@optional
/// cell中按钮1的跳转的控制器的代理方法
- (void)axffreshToHomeCell:(AXFFreshToHomeCell*)cell;
/// cell中按钮2的跳转的控制器的代理方法
- (void)axffreshToHomeCell2:(AXFFreshToHomeCell*)cell;
/// cell中按钮1的跳转的控制器的代理方法
- (void)axffreshToHomeCell3:(AXFFreshToHomeCell*)cell;
/// cell中按钮1的跳转的控制器的代理方法
- (void)axffreshToHomeCell4:(AXFFreshToHomeCell*)cell;
/// cell中按钮1的跳转的控制器的代理方法
- (void)axffreshToHomeCell5:(AXFFreshToHomeCell*)cell;

@end
@interface AXFFreshToHomeCell : UITableViewCell
// 设置代理
@property (nonatomic, weak) id<XFFreshToHomeCellDelegate> delegate;
//  模型属性
@property (nonatomic, strong) AXFcgoods_detailModel* fgoodsModel;
@end
