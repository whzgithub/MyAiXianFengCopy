//
//  AXFSlideCollectionViewCell.m
//  AiXianFeng
//
//  Created by Apple on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFSlideCollectionViewCell.h"
#import <Masonry.h>
@implementation AXFSlideCollectionViewCell

// 重写图片地址属性赋值方法
-(void)setImageURL:(NSString *)imageURL
{
    // 创建图片框对象
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageURL]];
    // 添加到父控件，自动布局
    [self.contentView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).offset(0);
    }];
}
@end
