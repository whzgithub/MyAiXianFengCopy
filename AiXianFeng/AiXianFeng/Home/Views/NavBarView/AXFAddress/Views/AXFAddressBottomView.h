//
//  AXFAddressBottomView.h
//  AiXianFeng
//
//  Created by 美琳 on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AXFAddressBottomView;

@protocol AXFAddressBottomViewDelegate <NSObject>

@optional
- (void)addressBottomView:(AXFAddressBottomView *)addressBottomView;

@end

@interface AXFAddressBottomView : UIView
@property(nonatomic,weak)id<AXFAddressBottomViewDelegate>delegate;

@end
