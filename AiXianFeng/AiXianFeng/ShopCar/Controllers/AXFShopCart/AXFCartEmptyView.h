//
//  AXFCartEmptyController.h
//  AiXianFeng
//
//  Created by mac on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AXFCartEmptyView;
@protocol AXFCartEmptyViewDelegate <NSObject>

- (void)AXFCartEmptyView:(AXFCartEmptyView*)AXFCartEmptyView;

@end
@interface AXFCartEmptyView : UIView

//定义代理属性
@property(nonatomic,weak)id<AXFCartEmptyViewDelegate>delegate;

@end
