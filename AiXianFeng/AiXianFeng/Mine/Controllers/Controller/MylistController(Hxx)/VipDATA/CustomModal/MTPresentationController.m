//
//  MTPresentationController.m
//  MT_waimai008
//
//  Created by HM on 16/9/8.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "MTPresentationController.h"

@implementation MTPresentationController

- (void)containerViewWillLayoutSubviews {

    [super containerViewWillLayoutSubviews];
    
    // 调整要显示控制器的高度!
    // 获取容器视图!
    UIView *containerV = self.containerView;
    
    // 获取要显示的控制器的视图!
    UIView *presentedV = self.presentedView;
    
    // 设置约束!
    [presentedV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(containerV);
        make.height.mas_equalTo(350);
        
    }];
    
    // MARK: - 插入遮盖视图
    UIView *maskV = [[UIView alloc] init];
    
    maskV.backgroundColor = [UIColor blackColor];
    maskV.alpha = 0.3;
    
    [containerV insertSubview:maskV atIndex:0];
    
    [maskV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(containerV);
        
    }];
    
    // MARK: - 添加点按手势
    
    // 顶部点击 dismiss
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [maskV addGestureRecognizer:tap];
    
    // 按钮的侧边点击 dimss
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction2:)];
    [presentedV addGestureRecognizer:tap2];

}

// 需要dismissVc!
- (void)tapAction:(UITapGestureRecognizer *)sender {

    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];

}


// 需要dismissVc!
- (void)tapAction2:(UITapGestureRecognizer *)sender {
    
    // 获取触摸点的y值
    CGFloat y = [sender locationInView:self.presentedView].y;
    
    if (y > 59) {
        return;
    }
    
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    
}

@end
