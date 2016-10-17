//
//  UIColor+UIColor_extra_h.m
//  PAChat
//
//  Created by xiao on 8/12/14.
//  Copyright (c) 2014 FreeDo. All rights reserved.
//

 
#import <UIKit/UIKit.h>
@implementation UIColor (UIColor_extra_h)

@end
#import <UIKit/UIKit.h>
@implementation UIColor (Hex)

+ (UIColor*) colorWithHex:(long)hexColor;
{
    return [UIColor colorWithHex:hexColor alpha:1.];
}

+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity
{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

@end
