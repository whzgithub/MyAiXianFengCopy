//
//  AXFMarketProductAllCategory.m
//  AiXianFeng
//
//  Created by whz on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMarketProductAllCategoryView.h"
#import "Masonry.h"

@implementation AXFMarketProductAllCategoryView

- (instancetype) initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - 初始化界面
/// 初始化界面
- (void) setupUI {

    UIImageView *imageViewCategories = [[UIImageView alloc] init];
    imageViewCategories.image = [UIImage imageNamed:@"Categories.png"];
    [self addSubview:imageViewCategories];
    [imageViewCategories mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(0);
        make.left.equalTo(self).offset(6);
        make.width.offset(AXFMainScreenWidth - 90);
        make.height.mas_equalTo(140);
    }];
}

@end
