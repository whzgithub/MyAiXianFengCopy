//
//  AXFMineOrderView.h
//  AiXianFeng
//
//  Created by whz on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    BtnOne,
    BtnTwo,
    BtnThree,
    BtnFour
} BtnNumber;

@interface AXFMineOrderView : UIControl
// 点击按钮的下标
@property(nonatomic,assign)NSInteger idx;
@end
