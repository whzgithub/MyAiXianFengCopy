//
//  UIView+JHUD.h
//  JHudViewDemo
//
//  Created by Long on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JHUD)

- (void)addConstraintWidth:(CGFloat)width
                    height:(CGFloat)height;

- (void)addConstraintCenterXToView:(UIView *)xView
                     centerYToView:(UIView *)yView;

- (NSLayoutConstraint *)addConstraintCenterYToView:(UIView *)yView
                                          constant:(CGFloat)constant;

- (NSLayoutConstraint *)addConstarintWithTopView:(UIView *)topView
                                    toBottomView:(UIView *)bottomView
                                      constarint:(CGFloat)constarint;

- (void)removeConstraintWithAttribte:(NSLayoutAttribute)attribute;

- (void)removeAllConstraints;

@end