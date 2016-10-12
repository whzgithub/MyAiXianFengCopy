//
//  AXFCycleViewCell.m
//  AiXianFeng
//
//  Created by apple on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFCycleViewCell.h"
#import "Masonry.h"
@interface AXFCycleViewCell ()

@property (nonatomic, weak) UIImageView *iconView;

@end

@implementation AXFCycleViewCell
// 如果homeTopView是通过xib或sb创建此就会调用此方法
- (void)awakeFromNib {
    [self setupUI];
}

// 如果homeTopView是通过代码来创建就会调用此方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        _imagesList = [NSArray array];
    }
    return self;
}


// 设置界面
- (void)setupUI {
    // 添加cell中的广告图片
    UIImageView *iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:iconView];
    
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    UILabel *indexLabel = [[UILabel alloc] init];
    indexLabel.font = [UIFont systemFontOfSize:30];
    indexLabel.textAlignment = NSTextAlignmentCenter;
    indexLabel.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:indexLabel];
    
    [indexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
    }];
    
    
    self.iconView = iconView;
    
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
    
    
    
}
- (void)setImagesList:(NSArray *)imagesList
{
    _imagesList = imagesList;
    // 设置图片
    self.iconView.image =_imagesList[_indexPath.item];
    
}

@end
