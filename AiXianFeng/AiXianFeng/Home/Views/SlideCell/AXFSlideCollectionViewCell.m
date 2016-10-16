//
//  AXFSlideCollectionViewCell.m
//  AiXianFeng
//
//  Created by Apple on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFSlideCollectionViewCell.h"
#import <Masonry.h>
#import "AXFWebViewController.h"
#import "AXFActivityModel.h"
#import <UIImageView+WebCache.h>

@implementation AXFSlideCollectionViewCell

-(void)setActivityModel:(AXFActivityModel *)activityModel
{
    _activityModel = activityModel;
    UIButton *btn = [[UIButton alloc] init];
    UIImageView *imageView = [[UIImageView alloc] init];

    [imageView sd_setImageWithURL:[NSURL URLWithString:activityModel.img] placeholderImage:[UIImage imageNamed:@"v2_placeholder_full_size"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [btn setBackgroundImage:imageView.image forState:(UIControlStateNormal)];
    }];
    // 添加到父控件，自动布局
    [self.contentView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).offset(0);
    }];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(slideCollectionViewCell:andActivityModel:)]) {
        [self.delegate slideCollectionViewCell:self andActivityModel:self.activityModel];
    }
}
@end
