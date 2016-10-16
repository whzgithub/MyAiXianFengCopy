//
//  AXFSignatureTopView.h
//  AiXianFeng
//
//  Created by 美琳 on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GradientView,CLLocation,AXFSignatureTopView;
typedef void(^ClickSignBtn)(BOOL isSignSuccess);

@protocol AXFSignatureTopViewDelegate <NSObject>
@optional
- (void)signatureTopView:(AXFSignatureTopView *)signatureTopView;

@end
@interface AXFSignatureTopView : UIControl
@property (strong,nonatomic) GradientView *gradientView;
@property (assign,nonatomic) int signCount;
@property (strong,nonatomic) CLLocation *signLocation;
@property (strong,nonatomic) ClickSignBtn clickSignBtn;
//按钮的选中
@property(assign,nonatomic) BOOL wasSelected;
@property(weak,nonatomic)id<AXFSignatureTopViewDelegate>delegate;

@end
