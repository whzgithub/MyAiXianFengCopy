//
//  ShopCarAnimationViewController.m
//  ShoppingCarAnimation
//
//  Created by 刘豪亮 on 16/3/15.
//  Copyright © 2016年 刘豪亮. All rights reserved.
//

#import "ShopCarAnimationViewController.h"

@interface ShopCarAnimationViewController ()

@property (nonatomic, strong) NSMutableArray *animationLayers;
@property (nonatomic, assign) BOOL isNeedNotification;
@property (nonatomic, assign) BOOL isAnimating;

@end

@implementation ShopCarAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 增加商品的动画实现
/// 增加商品的动画实现
- (void)addProductsAnimation:(UIImageView *)imageView dropToPoint:(CGPoint)dropToPoint isNeedNotification:(BOOL)isNeedNotification {
    
    //若正在做动画，就结束，防止连续点击
    //    if (self.isAnimating) {
    //        return;
    //    }
    
    self.isAnimating = YES;
    
    self.isNeedNotification = isNeedNotification;
    if (self.animationLayers == nil) {
        self.animationLayers = [[NSMutableArray alloc] init];
    }
    
    CGRect frame = [imageView convertRect:imageView.bounds toView:self.view];
    CALayer *transitionLayer = [[CALayer alloc] init];
    transitionLayer.frame = frame;
    transitionLayer.contents = imageView.layer.contents;
    [self.view.layer addSublayer:transitionLayer];
    [self.animationLayers addObject:transitionLayer];
    
    CGPoint point1 = transitionLayer.position;
    
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, point1.x, point1.y);
    CGPathAddCurveToPoint(path, nil, point1.x, point1.y - 30, dropToPoint.x, point1.y - 30, dropToPoint.x, dropToPoint.y);
    positionAnimation.path = path;
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @1;
    opacityAnimation.toValue = @0.9;
    
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.2, 0.2, 1)];
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[positionAnimation, transformAnimation, opacityAnimation];
    groupAnimation.duration = 0.8;
    groupAnimation.delegate = self;
    groupAnimation.fillMode = kCAFillModeForwards;
    groupAnimation.removedOnCompletion = NO;
    
    [transitionLayer addAnimation:groupAnimation forKey:@"cartParabola"];
    
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    
    self.isAnimating = NO;
    
    if (self.animationLayers.count > 0) {
        CALayer *layer = self.animationLayers[0];
        layer.hidden = YES;
        [layer removeFromSuperlayer];
        [self.animationLayers removeObjectAtIndex:0];
        [self.view.layer removeAnimationForKey:@"cartParabola"];
        if (self.isNeedNotification) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"shopCarAnimationEnd" object:nil];
        }
        if (_addShopCarFinished) {
            self.addShopCarFinished();
        }
    }
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
