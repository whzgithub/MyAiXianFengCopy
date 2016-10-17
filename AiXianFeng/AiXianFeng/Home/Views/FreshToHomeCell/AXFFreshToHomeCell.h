//
//  AXFFreshToHomeCell.h
//  AiXianFeng
//
//  Created by Long on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

@class AXFFreshToHomeCell,AXFcgoods_detailModel;


// 定义此枚举用来区分按钮
typedef enum : NSUInteger {
    
    XFFreshToHomeCellBtnTypeFirst,
    XFFreshToHomeCellBtnTypeSecond,
    XFFreshToHomeCellBtnTypeThird,
    XFFreshToHomeCellBtnTypeFourth,
    XFFreshToHomeCellBtnTypeFive,
    
} XFFreshToHomeCellBtnType;

@protocol XFFreshToHomeCellDelegate <NSObject>

@optional
/// cell中按钮的跳转的控制器的代理方法
- (void)axffreshToHomeCell:(AXFFreshToHomeCell *)homeTopView andButtonType:(XFFreshToHomeCellBtnType)btnType;


/// cell中按钮1的跳转的控制器的代理方法
- (void)axffreshToHomeCell5:(AXFFreshToHomeCell*)cell;

@end
@interface AXFFreshToHomeCell : UITableViewCell
// 设置代理
@property (nonatomic, weak) id<XFFreshToHomeCellDelegate> delegate;
//  模型属性
@property (nonatomic, strong) AXFcgoods_detailModel* fgoodsModel;
@end
