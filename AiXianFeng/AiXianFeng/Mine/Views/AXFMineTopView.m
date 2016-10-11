//
//  AXFMineView.m
//  AiXianFeng
//
//  Created by whz on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMineTopView.h"
#import "UIColor+CZAddition.h"

@interface AXFMineTopView ()

@end

@implementation AXFMineTopView

- (instancetype) initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame] ) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - 初始化界面
/// 初始化界面
- (void) setupUI {

    // 创建mineView
    self.backgroundColor = [UIColor cz_colorWithRed:252 green:200 blue:9];
}

@end
