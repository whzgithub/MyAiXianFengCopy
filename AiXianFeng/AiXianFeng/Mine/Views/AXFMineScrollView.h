//
//  AXFMineScrollView.h
//  AiXianFeng
//
//  Created by whz on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AXFMineOthersFunctionView;

@interface AXFMineScrollView : UIScrollView

@property(nonatomic,copy)void(^ckBlock)(AXFMineOthersFunctionView *btn);

@end
