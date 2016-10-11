//
//  AXFFoodCell.m
//  AiXianFeng
//
//  Created by Long on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFFoodCell.h"
#import "Masonry.h"
#import "UIColor+CZAddition.h"

@implementation AXFFoodCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - 初始化UI
/// 初始化UI
- (void) setupUI {
    
    /// 橙色的标题线
    UIImageView *imageViewOrangeLine = [[UIImageView alloc] init];
    imageViewOrangeLine.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:imageViewOrangeLine];
    [imageViewOrangeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(5);
        make.height.mas_equalTo(15);
    }];
    
    /// cell标题
    UILabel *labelCellTitle = [[UILabel alloc] init];
    labelCellTitle.text = @"优选水果";
    labelCellTitle.textColor = [UIColor orangeColor];
    labelCellTitle.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:labelCellTitle];
    [labelCellTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageViewOrangeLine.mas_right).offset(8);
        make.centerY.equalTo(imageViewOrangeLine);
    }];
    
    /// 更多标签箭头图标
    UIImageView *imageViewMore = [[UIImageView alloc] init];
    imageViewMore.image = [UIImage imageNamed:@"icon_go"];
    [self.contentView addSubview:imageViewMore];
    [imageViewMore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(labelCellTitle);
        make.width.mas_equalTo(5);
        make.height.mas_equalTo(10);
    }];
    
    /// 更多标签
    UILabel *labelMore = [[UILabel alloc] init];
    labelMore.text = @"更多";
    labelMore.textColor = [UIColor lightGrayColor];
    labelMore.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:labelMore];
    [labelMore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(imageViewMore.mas_left).offset(-10);
        make.centerY.equalTo(imageViewMore);
    }];
    
    /// cell主图片logo
    UIImageView *imageViewLogo = [[UIImageView alloc] init];
    imageViewLogo.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:imageViewLogo];
    [imageViewLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(imageViewOrangeLine.mas_bottom).offset(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(100);
    }];
    
    /// cell中纵向分割线1
    UIImageView *imageViewGrayLine1 = [[UIImageView alloc] init];
    imageViewGrayLine1.backgroundColor = [UIColor cz_colorWithRed:231 green:231 blue:231];
    [self.contentView addSubview:imageViewGrayLine1];
    [imageViewGrayLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageViewLogo.mas_bottom).offset(10);
        make.left.equalTo(imageViewLogo).offset(([UIScreen mainScreen].bounds.size.width - 20) / 3);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(200);
    }];
    
    /// cell中纵向分割线2
    UIImageView *imageViewGrayLine2 = [[UIImageView alloc] init];
    imageViewGrayLine2.backgroundColor = [UIColor cz_colorWithRed:231 green:231 blue:231];
    [self.contentView addSubview:imageViewGrayLine2];
    [imageViewGrayLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageViewLogo.mas_bottom).offset(10);
        make.right.equalTo(imageViewLogo).offset(-([UIScreen mainScreen].bounds.size.width - 20) / 3);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(200);
    }];
    
    /// cell内容详情图片1
    UIImageView *imageViewCellContentInfo1 = [[UIImageView alloc] init];
    imageViewCellContentInfo1.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:imageViewCellContentInfo1];
    [imageViewCellContentInfo1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(imageViewGrayLine1.mas_left).offset(0);
        make.top.equalTo(imageViewLogo.mas_bottom).offset(10);
        make.width.mas_equalTo(([UIScreen mainScreen].bounds.size.width - 20) / 3);
        make.height.mas_equalTo(120);
    }];
    
    /// cell内容详情图片2
    UIImageView *imageViewCellContentInfo2 = [[UIImageView alloc] init];
    imageViewCellContentInfo2.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:imageViewCellContentInfo2];
    [imageViewCellContentInfo2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageViewGrayLine1.mas_right).offset(0);
        make.right.equalTo(imageViewGrayLine2.mas_left).offset(0);
        make.top.equalTo(imageViewLogo.mas_bottom).offset(10);
        make.height.mas_equalTo(120);
    }];
    
    /// cell内容详情图片3
    UIImageView *imageViewCellContentInfo3 = [[UIImageView alloc] init];
    imageViewCellContentInfo3.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:imageViewCellContentInfo3];
    [imageViewCellContentInfo3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageViewGrayLine2.mas_right).offset(0);
        make.top.equalTo(imageViewLogo.mas_bottom).offset(10);
        make.width.mas_equalTo(([UIScreen mainScreen].bounds.size.width - 20) / 3);
        make.height.mas_equalTo(120);
    }];
    
    /// cell内容详情1的名字
    UILabel *labelGoodsName1 = [[UILabel alloc] init];
    labelGoodsName1.text = @"爱鲜蜂·商品1名称";
    labelGoodsName1.textColor = [UIColor blackColor];
    labelGoodsName1.font = [UIFont systemFontOfSize:13];
    [self. contentView addSubview:labelGoodsName1];
    [labelGoodsName1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageViewCellContentInfo1.mas_bottom).offset(5);
        make.left.equalTo(imageViewCellContentInfo1).offset(0);
    }];
    
    /// cell内容详情2的名字
    UILabel *labelGoodsName2 = [[UILabel alloc] init];
    labelGoodsName2.text = @"爱鲜蜂·商品2名称";
    labelGoodsName2.textColor = [UIColor blackColor];
    labelGoodsName2.font = [UIFont systemFontOfSize:13];
    [self. contentView addSubview:labelGoodsName2];
    [labelGoodsName2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageViewCellContentInfo1.mas_bottom).offset(5);
        make.left.equalTo(imageViewGrayLine1.mas_right).offset(8);
    }];
    
    /// cell内容详情3的名字
    UILabel *labelGoodsName3 = [[UILabel alloc] init];
    labelGoodsName3.text = @"爱鲜蜂·商品3名称";
    labelGoodsName3.textColor = [UIColor blackColor];
    labelGoodsName3.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:labelGoodsName3];
    [labelGoodsName3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageViewCellContentInfo1.mas_bottom).offset(5);
        make.left.equalTo(imageViewGrayLine2.mas_right).offset(8);
    }];
    
    /// 精选标签1
    UILabel *labelBest1 = [[UILabel alloc] init];
    labelBest1.text = @"精选1";
    labelBest1.textColor = [UIColor redColor];
    labelBest1.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:labelBest1];
    [labelBest1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelGoodsName1.mas_bottom).offset(5);
        make.left.mas_equalTo(self).offset(10);
    }];
    
    /// 精选标签2
    UILabel *labelBest2 = [[UILabel alloc] init];
    labelBest2.text = @"精选2";
    labelBest2.textColor = [UIColor redColor];
    labelBest2.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:labelBest2];
    [labelBest2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelGoodsName1.mas_bottom).offset(5);
        make.left.mas_equalTo(labelGoodsName2);
    }];
    
    /// 精选标签3
    UILabel *labelBest3 = [[UILabel alloc] init];
    labelBest3.text = @"精选2";
    labelBest3.textColor = [UIColor redColor];
    labelBest3.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:labelBest3];
    [labelBest3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelGoodsName1.mas_bottom).offset(5);
        make.left.mas_equalTo(labelGoodsName3);
    }];
    
    /// 商品信息1
    UILabel *labelGoodsInfo1 = [[UILabel alloc] init];
    labelGoodsInfo1.text = @"1~2g 1粒/盒";
    labelGoodsInfo1.textColor = [UIColor lightGrayColor];
    labelGoodsInfo1.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:labelGoodsInfo1];
    [labelGoodsInfo1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelBest1.mas_bottom).offset(5);
        make.left.mas_equalTo(labelBest1);
    }];
    
    /// 商品信息2
    UILabel *labelGoodsInfo2 = [[UILabel alloc] init];
    labelGoodsInfo2.text = @"1~2g 1粒/盒";
    labelGoodsInfo2.textColor = [UIColor lightGrayColor];
    labelGoodsInfo2.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:labelGoodsInfo2];
    [labelGoodsInfo2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelBest2.mas_bottom).offset(5);
        make.left.mas_equalTo(labelBest2);
    }];
    
    /// 商品信息3
    UILabel *labelGoodsInfo3 = [[UILabel alloc] init];
    labelGoodsInfo3.text = @"1~2g 1粒/盒";
    labelGoodsInfo3.textColor = [UIColor lightGrayColor];
    labelGoodsInfo3.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:labelGoodsInfo3];
    [labelGoodsInfo3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelBest3.mas_bottom).offset(5);
        make.left.mas_equalTo(labelBest3);
    }];
    
    /// 商品价格1
    UILabel *labelGoodsMoney1 = [[UILabel alloc] init];
    labelGoodsMoney1.text = @"¥10";
    labelGoodsMoney1.textColor = [UIColor redColor];
    labelGoodsMoney1.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:labelGoodsMoney1];
    [labelGoodsMoney1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelGoodsInfo1.mas_bottom).offset(5);
        make.left.mas_equalTo(labelGoodsInfo1);
    }];
    
    /// 商品价格2
    UILabel *labelGoodsMoney2 = [[UILabel alloc] init];
    labelGoodsMoney2.text = @"¥20";
    labelGoodsMoney2.textColor = [UIColor redColor];
    labelGoodsMoney2.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:labelGoodsMoney2];
    [labelGoodsMoney2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelGoodsInfo1.mas_bottom).offset(5);
        make.left.mas_equalTo(labelGoodsInfo2);
    }];
    
    /// 商品价格3
    UILabel *labelGoodsMoney3 = [[UILabel alloc] init];
    labelGoodsMoney3.text = @"¥30";
    labelGoodsMoney3.textColor = [UIColor redColor];
    labelGoodsMoney3.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:labelGoodsMoney3];
    [labelGoodsMoney3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelGoodsInfo1.mas_bottom).offset(5);
        make.left.mas_equalTo(labelGoodsInfo3);
    }];
    
    /// 添加商品圆形按钮1
    UIButton *buttonAdd1 = [[UIButton alloc] init];
    [buttonAdd1 setImage:[UIImage imageNamed:@"v2_increase-1"] forState:UIControlStateNormal];
    [self.contentView addSubview:buttonAdd1];
    [buttonAdd1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(imageViewGrayLine1.mas_left).offset(-1);
        make.bottom.mas_equalTo(-1);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    /// 添加商品圆形按钮2
    UIButton *buttonAdd2 = [[UIButton alloc] init];
    [buttonAdd2 setImage:[UIImage imageNamed:@"v2_increase-1"] forState:UIControlStateNormal];
    [self.contentView addSubview:buttonAdd2];
    [buttonAdd2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(imageViewGrayLine2.mas_left).offset(-1);
        make.bottom.mas_equalTo(-1);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    /// 添加商品圆形按钮3
    UIButton *buttonAdd3 = [[UIButton alloc] init];
    [buttonAdd3 setImage:[UIImage imageNamed:@"v2_increase-1"] forState:UIControlStateNormal];
    [self.contentView addSubview:buttonAdd3];
    [buttonAdd3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-1);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
}

@end
