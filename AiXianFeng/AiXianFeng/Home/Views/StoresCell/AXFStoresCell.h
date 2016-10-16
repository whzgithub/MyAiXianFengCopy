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

// 声明协议"协议命名规范以委托者类名开头 + Delegate"
@protocol AXFStoresCellDelegate <NSObject>

@optional
// 协议方法命名规范:以委托者类名开名不加类前缀,首字母小写,协议方法最少要有一个参数所委托者自己传过去
- (void)homeTopView:(AXFStoresCell *)homeTopView andButtonType:(AXFStoresViewBtnType)btnType;


@end

@interface AXFStoresCell : UITableViewCell

// 定义代理属性"应该为id类型, 应该用weak修饰"
@property (nonatomic, weak) id<AXFStoresCellDelegate> delegate;

@property(nonatomic, strong)AXFStroesModels *model;
@end
