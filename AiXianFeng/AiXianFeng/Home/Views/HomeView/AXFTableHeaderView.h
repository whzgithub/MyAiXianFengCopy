//
//  AXFTableHeaderView.h
//  AiXianFeng
//
//  Created by Apple on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SDCycleScrollView;
@interface AXFTableHeaderView : UIView
@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;
@property(nonatomic,copy) NSArray* arr;
@end
