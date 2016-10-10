//
//  AXFHomeHeaderView.m
//  AiXianFeng
//
//  Created by whz on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFHomeHeaderView.h"

@implementation AXFHomeHeaderView

- (instancetype) initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

- (void) setupUI {

    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 280);
}

@end
