//
//  AXFCommonHeaderView.h
//  aixianfeng0051
//
//  Created by 汪舟 on 16/10/12.
//  Copyright © 2016年 陈天佑. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AXFCommonHeaderView;

@protocol AXFCommonHeaderViewDelegate <NSObject>

- (void)aXFCommonHeaderView:(AXFCommonHeaderView *)view;
- (void)aXFCommonHeaderSearchView:(AXFCommonHeaderView *)searchView;
- (void)aXFCommonHeaderAdressView:(AXFCommonHeaderView *)adressView;
@end
@interface AXFCommonHeaderView : UIView
@property (nonatomic, weak) id <AXFCommonHeaderViewDelegate>delegate;
@end
