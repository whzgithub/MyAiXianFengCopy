//
//  AXFStoresCell.h
//  AiXianFeng
//
//  Created by Long on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AXFStroesModels.h"

@class AXFStoresCell;

// 定义此枚举用来区分按钮
typedef enum : NSUInteger {
    
    AXFStoresViewBtnTypeFirst,
    AXFStoresViewBtnTypeSecond,
    AXFStoresViewBtnTypeThird,
    AXFStoresViewBtnTypeFourth,
    AXFStoresViewBtnTypeFive,
    AXFStoresViewBtnTypeSix,
    AXFStoresViewBtnTypeSeven,
    AXFStoresViewBtnTypeEight,
    
    
} AXFStoresViewBtnType;


@interface AXFStoresCell : UITableViewCell

// 定义代理属性"应该为id类型, 应该用weak修饰"

@property(nonatomic, strong)AXFStroesModels *model;
//设置block，让控制器调用方法
@property(nonatomic,copy)void(^btnBlock)(UIButton *btn);
@end
