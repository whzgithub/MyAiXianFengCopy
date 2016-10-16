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
#import "UIImageView+WebCache.h"

@interface AXFFoodCell ()

/// cell显示的标题
@property(nonatomic, weak)UILabel *labelCellTitle;
/// cell显示的顶部logo
@property(nonatomic, weak)UIImageView *imageViewLogo;
/// cell显示的商品图片1
@property(nonatomic, weak)UIImageView *imageViewCellContentInfo1;
/// cell显示的商品图片2
@property(nonatomic, weak)UIImageView *imageViewCellContentInfo2;
/// cell显示的商品图片3
@property(nonatomic, weak)UIImageView *imageViewCellContentInfo3;
/// cell显示的商品名字1
@property(nonatomic, weak)UILabel *labelGoodsName1;
/// cell显示的商品名字2
@property(nonatomic, weak)UILabel *labelGoodsName2;
/// cell显示的商品名字3
@property(nonatomic, weak)UILabel *labelGoodsName3;
/// cell显示的商品的精选标签
@property(nonatomic, assign)BOOL BoolLabelBest;
/// cell显示的商品重量1
@property(nonatomic, weak)UILabel *labelGoodsInfo1;
/// cell显示的商品重量2
@property(nonatomic, weak)UILabel *labelGoodsInfo2;
/// cell显示的商品重量3
@property(nonatomic, weak)UILabel *labelGoodsInfo3;
/// cell显示的商品现价1
@property(nonatomic, weak)UILabel *labelGoodsMoney1;
/// cell显示的商品现价2
@property(nonatomic, weak)UILabel *labelGoodsMoney2;
/// cell显示的商品现价3
@property(nonatomic, weak)UILabel *labelGoodsMoney3;
/// cell显示的商品原价1
@property(nonatomic, weak)UILabel *labelGoodsMoneyBack1;
/// cell显示的商品原价2
@property(nonatomic, weak)UILabel *labelGoodsMoneyBack2;
/// cell显示的商品原价2
@property(nonatomic, weak)UILabel *labelGoodsMoneyBack3;

@end

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
    
    /// cell显示的标题
    UILabel *labelCellTitle = [[UILabel alloc] init];
    labelCellTitle.text = @"优选水果死数据";
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
    
    /// cell显示的顶部logo
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
    
    /// cell显示的商品图片1
    UIImageView *imageViewCellContentInfo1 = [[UIImageView alloc] init];
    imageViewCellContentInfo1.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:imageViewCellContentInfo1];
    [imageViewCellContentInfo1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(imageViewGrayLine1.mas_left).offset(0);
        make.top.equalTo(imageViewLogo.mas_bottom).offset(10);
        make.width.mas_equalTo(([UIScreen mainScreen].bounds.size.width - 20) / 3);
        make.height.mas_equalTo(120);
    }];
    
    /// cell显示的商品图片2
    UIImageView *imageViewCellContentInfo2 = [[UIImageView alloc] init];
    imageViewCellContentInfo2.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:imageViewCellContentInfo2];
    [imageViewCellContentInfo2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageViewGrayLine1.mas_right).offset(0);
        make.right.equalTo(imageViewGrayLine2.mas_left).offset(0);
        make.top.equalTo(imageViewLogo.mas_bottom).offset(10);
        make.height.mas_equalTo(120);
    }];
    
    /// cell显示的商品图片3
    UIImageView *imageViewCellContentInfo3 = [[UIImageView alloc] init];
    imageViewCellContentInfo3.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:imageViewCellContentInfo3];
    [imageViewCellContentInfo3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageViewGrayLine2.mas_right).offset(0);
        make.top.equalTo(imageViewLogo.mas_bottom).offset(10);
        make.width.mas_equalTo(([UIScreen mainScreen].bounds.size.width - 20) / 3);
        make.height.mas_equalTo(120);
    }];
    
    /// cell显示的商品名字1
    UILabel *labelGoodsName1 = [[UILabel alloc] init];
    labelGoodsName1.text = @"爱鲜蜂·商品1名称死数据";
    labelGoodsName1.textColor = [UIColor blackColor];
    labelGoodsName1.font = [UIFont systemFontOfSize:13];
    [self. contentView addSubview:labelGoodsName1];
    [labelGoodsName1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageViewCellContentInfo1.mas_bottom).offset(5);
        make.left.equalTo(imageViewCellContentInfo1).offset(0);
        make.width.mas_equalTo((AXFMainScreenWidth - 30) / 3);
    }];
    labelGoodsName1.lineBreakMode = NSLineBreakByTruncatingTail;
    
    /// cell显示的商品名字2
    UILabel *labelGoodsName2 = [[UILabel alloc] init];
    labelGoodsName2.text = @"爱鲜蜂·商品2名称死数据";
    labelGoodsName2.textColor = [UIColor blackColor];
    labelGoodsName2.font = [UIFont systemFontOfSize:13];
    [self. contentView addSubview:labelGoodsName2];
    [labelGoodsName2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageViewCellContentInfo1.mas_bottom).offset(5);
        make.left.equalTo(imageViewGrayLine1.mas_right).offset(8);
        make.width.mas_equalTo((AXFMainScreenWidth - 40) / 3);
    }];
    labelGoodsName2.lineBreakMode = NSLineBreakByTruncatingTail;
    
    /// cell显示的商品名字3
    UILabel *labelGoodsName3 = [[UILabel alloc] init];
    labelGoodsName3.text = @"爱鲜蜂·商品3名称死数据";
    labelGoodsName3.textColor = [UIColor blackColor];
    labelGoodsName3.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:labelGoodsName3];
    [labelGoodsName3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageViewCellContentInfo1.mas_bottom).offset(5);
        make.left.equalTo(imageViewGrayLine2.mas_right).offset(8);
        make.width.mas_equalTo((AXFMainScreenWidth - 30) / 3);
    }];
    labelGoodsName3.lineBreakMode = NSLineBreakByTruncatingTail;
    
    /// 精选标签1
    UILabel *labelBest1;
    if (!self.BoolLabelBest) {
        
        labelBest1 = [[UILabel alloc] init];
        labelBest1.text = @"精选";
        labelBest1.textColor = [UIColor redColor];
        labelBest1.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:labelBest1];
        [labelBest1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(labelGoodsName1.mas_bottom).offset(5);
            make.left.mas_equalTo(self).offset(10);
        }];
    }
    
    /// 精选标签2
    UILabel *labelBest2;
    if (!self.BoolLabelBest) {
        
        labelBest2 = [[UILabel alloc] init];
        labelBest2.text = @"精选";
        labelBest2.textColor = [UIColor redColor];
        labelBest2.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:labelBest2];
        [labelBest2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(labelGoodsName2.mas_bottom).offset(5);
            make.left.mas_equalTo(labelGoodsName2);
        }];
    }
    
    /// 精选标签3
    UILabel *labelBest3;
    if (!self.BoolLabelBest) {
        
        labelBest3 = [[UILabel alloc] init];
        labelBest3.text = @"精选";
        labelBest3.textColor = [UIColor redColor];
        labelBest3.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:labelBest3];
        [labelBest3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(labelGoodsName3.mas_bottom).offset(5);
            make.left.mas_equalTo(labelGoodsName3);
        }];
    }
    
    /// cell显示的商品重量1
    UILabel *labelGoodsInfo1 = [[UILabel alloc] init];
    labelGoodsInfo1.text = @"1~2g 1粒/盒死数据";
    labelGoodsInfo1.textColor = [UIColor lightGrayColor];
    labelGoodsInfo1.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:labelGoodsInfo1];
    [labelGoodsInfo1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelBest1.mas_bottom).offset(5);
        make.left.mas_equalTo(labelBest1);
    }];
    
    /// cell显示的商品重量2
    UILabel *labelGoodsInfo2 = [[UILabel alloc] init];
    labelGoodsInfo2.text = @"1~2g 1粒/盒死数据";
    labelGoodsInfo2.textColor = [UIColor lightGrayColor];
    labelGoodsInfo2.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:labelGoodsInfo2];
    [labelGoodsInfo2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelBest2.mas_bottom).offset(5);
        make.left.mas_equalTo(labelBest2);
    }];
    
    /// cell显示的商品重量3
    UILabel *labelGoodsInfo3 = [[UILabel alloc] init];
    labelGoodsInfo3.text = @"1~2g 1粒/盒死数据";
    labelGoodsInfo3.textColor = [UIColor lightGrayColor];
    labelGoodsInfo3.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:labelGoodsInfo3];
    [labelGoodsInfo3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelBest3.mas_bottom).offset(5);
        make.left.mas_equalTo(labelBest3);
    }];
    
    /// cell显示的商品现价1
    UILabel *labelGoodsMoney1 = [[UILabel alloc] init];
    labelGoodsMoney1.text = @"¥10死数据";
    labelGoodsMoney1.textColor = [UIColor redColor];
    labelGoodsMoney1.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:labelGoodsMoney1];
    [labelGoodsMoney1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelGoodsInfo1.mas_bottom).offset(5);
        make.left.mas_equalTo(labelGoodsInfo1);
    }];
    
    /// cell显示的商品现价2
    UILabel *labelGoodsMoney2 = [[UILabel alloc] init];
    labelGoodsMoney2.text = @"¥20死数据";
    labelGoodsMoney2.textColor = [UIColor redColor];
    labelGoodsMoney2.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:labelGoodsMoney2];
    [labelGoodsMoney2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelGoodsInfo2.mas_bottom).offset(5);
        make.left.mas_equalTo(labelGoodsInfo2);
    }];
    
    /// cell显示的商品现价3
    UILabel *labelGoodsMoney3 = [[UILabel alloc] init];
    labelGoodsMoney3.text = @"¥30死数据";
    labelGoodsMoney3.textColor = [UIColor redColor];
    labelGoodsMoney3.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:labelGoodsMoney3];
    [labelGoodsMoney3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelGoodsInfo3.mas_bottom).offset(5);
        make.left.mas_equalTo(labelGoodsInfo3);
    }];
    
    /// cell显示的商品原价1
    UILabel *labelGoodsMoneyBack1 = [[UILabel alloc] init];
    labelGoodsMoneyBack1.text = @"¥10死数据";
    labelGoodsMoneyBack1.textColor = [UIColor lightGrayColor];
    labelGoodsMoneyBack1.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:labelGoodsMoneyBack1];
    [labelGoodsMoneyBack1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelGoodsInfo1.mas_bottom).offset(6);
        make.left.equalTo(labelGoodsMoney1.mas_right).offset(5);
    }];
    
    /// cell显示的商品原价2
    UILabel *labelGoodsMoneyBack2 = [[UILabel alloc] init];
    labelGoodsMoneyBack2.text = @"¥20死数据";
    labelGoodsMoneyBack2.textColor = [UIColor lightGrayColor];
    labelGoodsMoneyBack2.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:labelGoodsMoneyBack2];
    [labelGoodsMoneyBack2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelGoodsInfo2.mas_bottom).offset(6);
        make.left.equalTo(labelGoodsMoney2.mas_right).offset(5);
    }];
    
    /// cell显示的商品原价3
    UILabel *labelGoodsMoneyBack3 = [[UILabel alloc] init];
    labelGoodsMoneyBack3.text = @"¥30死数据";
    labelGoodsMoneyBack3.textColor = [UIColor lightGrayColor];
    labelGoodsMoneyBack3.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:labelGoodsMoneyBack3];
    [labelGoodsMoneyBack3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelGoodsInfo3.mas_bottom).offset(6);
        make.left.equalTo(labelGoodsMoney3.mas_right).offset(5);
    }];

    
    /// 添加商品圆形按钮1
    UIButton *buttonAdd1 = [[UIButton alloc] init];
    [buttonAdd1 setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
    [self.contentView addSubview:buttonAdd1];
    [buttonAdd1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(imageViewGrayLine1.mas_left).offset(-1);
        make.bottom.mas_equalTo(-1);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    /// 添加商品圆形按钮2
    UIButton *buttonAdd2 = [[UIButton alloc] init];
    [buttonAdd2 setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
    [self.contentView addSubview:buttonAdd2];
    [buttonAdd2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(imageViewGrayLine2.mas_left).offset(-1);
        make.bottom.mas_equalTo(-1);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    /// 添加商品圆形按钮3
    UIButton *buttonAdd3 = [[UIButton alloc] init];
    [buttonAdd3 setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
    [self.contentView addSubview:buttonAdd3];
    [buttonAdd3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-1);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    /// 赋值
    self.labelCellTitle = labelCellTitle;
    self.imageViewLogo = imageViewLogo;
    self.imageViewCellContentInfo1 = imageViewCellContentInfo1;
    self.imageViewCellContentInfo2 = imageViewCellContentInfo2;
    self.imageViewCellContentInfo3 = imageViewCellContentInfo3;
    self.labelGoodsName1 = labelGoodsName1;
    self.labelGoodsName2 = labelGoodsName2;
    self.labelGoodsName3 = labelGoodsName3;
    self.labelGoodsInfo1 = labelGoodsInfo1;
    self.labelGoodsInfo2 = labelGoodsInfo2;
    self.labelGoodsInfo3 = labelGoodsInfo3;
    self.labelGoodsMoney1 = labelGoodsMoney1;
    self.labelGoodsMoney2 = labelGoodsMoney2;
    self.labelGoodsMoney3 = labelGoodsMoney3;
    self.labelGoodsMoneyBack1 = labelGoodsMoneyBack1;
    self.labelGoodsMoneyBack2 = labelGoodsMoneyBack2;
    self.labelGoodsMoneyBack3 = labelGoodsMoneyBack3;
}

- (void) setActInfoModel:(AXFFoodActInfoModel *)actInfoModel {

    _actInfoModel = actInfoModel;
    
    /// cell显示的标题
    self.labelCellTitle.text = actInfoModel.act_rows[self.indexForRow].category_detail.name;
    
    /// cell显示的顶部logo
    [self.imageViewLogo sd_setImageWithURL:[NSURL URLWithString:actInfoModel.act_rows[self.indexForRow].activity.img] placeholderImage:[UIImage imageNamed:@"imageViewLogo"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    }];
    
    /// cell显示的商品图片1
    [self.imageViewCellContentInfo1 sd_setImageWithURL:[NSURL URLWithString:actInfoModel.act_rows[self.indexForRow].category_detail.goods[0].img] placeholderImage:[UIImage imageNamed:@"imageViewCellContentInfo1"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    }];
    
    /// cell显示的商品图片2
    [self.imageViewCellContentInfo2 sd_setImageWithURL:[NSURL URLWithString:actInfoModel.act_rows[self.indexForRow].category_detail.goods[1].img] placeholderImage:[UIImage imageNamed:@"imageViewCellContentInfo2"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    }];
    
    /// cell显示的商品图片3
    [self.imageViewCellContentInfo3 sd_setImageWithURL:[NSURL URLWithString:actInfoModel.act_rows[self.indexForRow].category_detail.goods[2].img] placeholderImage:[UIImage imageNamed:@"imageViewCellContentInfo3"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    }];
    
    /// cell显示的商品名字1
    self.labelGoodsName1.text = actInfoModel.act_rows[self.indexForRow].category_detail.goods[0].name;
    
    /// cell显示的商品名字2
    self.labelGoodsName2.text = actInfoModel.act_rows[self.indexForRow].category_detail.goods[1].name;
    
    /// cell显示的商品名字3
    self.labelGoodsName3.text = actInfoModel.act_rows[self.indexForRow].category_detail.goods[2].name;
    
    /// cell显示的商品重量1
    self.labelGoodsInfo1.text = actInfoModel.act_rows[self.indexForRow].category_detail.goods[0].specifics;
    
    /// cell显示的商品重量2
    self.labelGoodsInfo2.text = actInfoModel.act_rows[self.indexForRow].category_detail.goods[1].specifics;
    
    /// cell显示的商品重量3
    self.labelGoodsInfo3.text = actInfoModel.act_rows[self.indexForRow].category_detail.goods[2].specifics;
    
    /// cell显示的商品现价1
    self.labelGoodsMoney1.text = [@"¥ " stringByAppendingString:actInfoModel.act_rows[self.indexForRow].category_detail.goods[0].partner_price];
    
    /// cell显示的商品现价2
    self.labelGoodsMoney2.text = [@"¥ " stringByAppendingString:actInfoModel.act_rows[self.indexForRow].category_detail.goods[1].partner_price];
    
    /// cell显示的商品现价3
    self.labelGoodsMoney3.text = [@"¥ " stringByAppendingString:actInfoModel.act_rows[self.indexForRow].category_detail.goods[2].partner_price];
    
    /// cell显示的商品原价1
    self.labelGoodsMoneyBack1.text = actInfoModel.act_rows[self.indexForRow].category_detail.goods[0].market_price;
    // 删除线
    NSMutableAttributedString *newPrice1 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"￥%@",self.labelGoodsMoneyBack1.text]];
    [newPrice1 addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, newPrice1.length)];
    self.labelGoodsMoneyBack1.attributedText = newPrice1;
    
    /// cell显示的商品原价2
    self.labelGoodsMoneyBack2.text = actInfoModel.act_rows[self.indexForRow].category_detail.goods[1].market_price;
    // 删除线
    NSMutableAttributedString *newPrice2 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"￥%@",self.labelGoodsMoneyBack2.text]];
    [newPrice2 addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, newPrice2.length)];
    self.labelGoodsMoneyBack2.attributedText = newPrice2;
    
    /// cell显示的商品原价3
    self.labelGoodsMoneyBack3.text = actInfoModel.act_rows[self.indexForRow].category_detail.goods[2].market_price;
    // 删除线
    NSMutableAttributedString *newPrice3 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"￥%@",self.labelGoodsMoneyBack3.text]];
    [newPrice3 addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, newPrice3.length)];
    self.labelGoodsMoneyBack3.attributedText = newPrice3;
}

@end
