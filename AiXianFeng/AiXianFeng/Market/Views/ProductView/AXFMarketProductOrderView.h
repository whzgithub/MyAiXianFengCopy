//
//  AXFMarketProductOrderView.h
//  AiXianFeng
//
//  Created by whz on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AXFMarketProductOrderView : UIView

/// 价格排序传值
@property(nonatomic,copy)void(^priceOrderBlock)(UIButton *btn);

@end
