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
// 轮播视图属性
@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;
// 接受网络下载数据
@property(nonatomic,copy) NSArray* arr;
@end
