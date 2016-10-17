//
//  MTCustomModal.m
//  MT_waimai008
//
//  Created by HM on 16/9/8.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "MTCustomModal.h"
#import "MTPresentationController.h"

@implementation MTCustomModal

#pragma- newMethod 决定modal效果的方法!
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    
    // 创建对象
    MTPresentationController *presentC = [[MTPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    
    // 返回
    return presentC;
}

@end
