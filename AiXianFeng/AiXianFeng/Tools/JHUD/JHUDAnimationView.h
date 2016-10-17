//
//  JHUDAnimationView.h
//  JHudViewDemo
//
//  Created by Long on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JHUDAnimationType) {
    JHUDAnimationTypeCircle = 0,
    JHUDAnimationTypeCircleJoin,
    JHUDAnimationTypeDot,
};

@interface JHUDAnimationView : UIView

@property (nonatomic,assign) NSInteger  count;

@property (nonatomic) UIColor  *defaultBackGroundColor;//

@property (nonatomic) UIColor  *foregroundColor;

- (void)showAnimationAtView:(UIView *)view animationType:(JHUDAnimationType)animationType;

-(void)removeSubLayer;

@end

