//
//  AXFMineHeaderView.m
//  AiXianFeng
//
//  Created by whz on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMineHeaderView.h"
#import "Masonry.h"

@implementation AXFMineHeaderView

- (instancetype) initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - 初始化界面
/// 初始化界面
- (void) setupUI {

    // MARK: -  设置headerView尺寸
    // 设置headerView尺寸
    CGFloat mineHeaderViewH = 180;
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, mineHeaderViewH);
    self.backgroundColor = [UIColor orangeColor];
    
    // MARK: - 商品收藏标签
    UILabel *labelGoodsCollect = [[UILabel alloc] init];
    labelGoodsCollect.backgroundColor = [UIColor purpleColor];
    labelGoodsCollect.text = @"商品收藏";
    labelGoodsCollect.textAlignment = NSTextAlignmentCenter;
    labelGoodsCollect.font = [UIFont systemFontOfSize:14];
    labelGoodsCollect.textColor = [UIColor whiteColor];
    [self addSubview:labelGoodsCollect];
    [labelGoodsCollect mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.bottom.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width / 2, 40));
    }];
    
    // MARK: - 店铺收藏标签
    UILabel *labelMarketCollect = [[UILabel alloc] init];
    labelMarketCollect.backgroundColor = [UIColor purpleColor];
    labelMarketCollect.text = @"店铺收藏";
    labelMarketCollect.textAlignment = NSTextAlignmentCenter;
    labelMarketCollect.font = [UIFont systemFontOfSize:14];
    labelMarketCollect.textColor = [UIColor whiteColor];
    [self addSubview:labelMarketCollect];
    [labelMarketCollect mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.bottom.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width / 2, 40));
    }];
    
    // MARK: - 头像
    UIImageView *imageViewHead = [[UIImageView alloc] init];
    imageViewHead.backgroundColor = [UIColor whiteColor];
    imageViewHead.layer.cornerRadius = 40;
    imageViewHead.layer.masksToBounds = YES;
    [self addSubview:imageViewHead];
    [imageViewHead mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(8);
        make.bottom.equalTo(labelGoodsCollect.mas_top).offset(-30);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    // MARK: - 登录的手机号码
    UILabel *labelPhone = [[UILabel alloc] init];
    labelPhone.text = @"XXXXXXXXXXX";
    labelPhone.textAlignment = NSTextAlignmentCenter;
    labelPhone.font = [UIFont systemFontOfSize:16];
    labelPhone.textColor = [UIColor whiteColor];
    [self addSubview:labelPhone];
    [labelPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(imageViewHead.mas_right).offset(10);
        make.top.equalTo(imageViewHead);
    }];
}

@end
