//
//  AXFFreshToHomeCell.m
//  AiXianFeng
//
//  Created by Long on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFFreshToHomeCell.h"
#import "Masonry.h"
#import "AXFgoodsModel.h"
#import "AXFcgoods_detailModel.h"
@interface AXFFreshToHomeCell ()
///图片
@property (nonatomic, weak) UIButton* btn3t;
///图片2
@property (nonatomic, weak)  UIButton* btn4t;
/// 名称
@property (nonatomic, weak)  UILabel *nameL;
/// 名称2
@property (nonatomic, weak)  UILabel *nameLt;
/// 容量
@property (nonatomic, weak)  UILabel *nameL2;
/// 容量2
@property (nonatomic, weak)  UILabel *nameL2t;
/// 价格
@property (nonatomic, weak)  UILabel *price;
/// 价格2
@property (nonatomic, weak)  UILabel *pricer;
@end
@implementation AXFFreshToHomeCell
//  重写cell的样式方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle =UITableViewCellSelectionStyleNone;
        
        [self setupUI];
    }
    return self;
}


#pragma 创建控件界面
- (void)setupUI{
    
    
    //1.View
    UIView* v = [[UIView alloc]init];
    
    [self.contentView addSubview:v];
    //  2,水平布局
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).offset(0);
    }];
    
    // 图片http://img01.bqstatic.com//upload/activity/2016092414294451.png@90Q.png
    UIImageView * iconV = [[UIImageView alloc]init];
    iconV.image = [UIImage imageNamed:@"2016092414294451.png@90Q"];
    [v addSubview:iconV];
    
    
    [iconV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(v);
        make.right.equalTo(v);
        make.left.equalTo(v);
    }];
    
    //  定义一个用来放图片的数组
    NSArray* btns = [NSArray array];
    
    //2.新鲜推介图片
    
    UIButton* btn1 = [[UIButton alloc]init];
    //  设置按钮的背景图片http://img01.bqstatic.com//upload/activity/2016092414525284.png@90Q.png
    [btn1 setBackgroundImage:[UIImage imageNamed:@"2016092414525284.png@90Q"] forState:UIControlStateNormal];
    
    [v addSubview:btn1];
    
    ///MRAK:-给按钮添1加点击事件http://img01.bqstatic.com//upload/activity/2016092418581322.png@90Q.png
    
    [btn1 addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton* btn2 = [[UIButton alloc]init];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"2016092418581322.png@90Q"] forState:UIControlStateNormal];
    [v addSubview:btn2];
    
    ///MRAK:给按钮2添加点击事件
    
    [btn2 addTarget:self action:@selector(btnClick2) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    btns = @[btn1,btn2 ];
    
    // 水平布局按钮的约束
    [btns mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:8 leadSpacing:8 tailSpacing:8];
    [btns mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(iconV.mas_bottom);
        make.height.offset(60);
        
    }];
    
    // 3.实物图片320160114110732_538131.jpg@!goods_recom
    UIButton* btn3 = [[UIButton alloc]init];
    //  设置按钮的背景图片20160114110732_538131.jpg@!goods_recom
    [btn3 setBackgroundImage:[UIImage imageNamed:@"author"] forState:UIControlStateNormal];
    
    [v addSubview:btn3];
    
    ///MRAK:给按钮3添加点击事件
    
    [btn3 addTarget:self action:@selector(btnClick3) forControlEvents:UIControlEventTouchUpInside];
    
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn1.mas_bottom);
        make.width.mas_equalTo(([UIScreen mainScreen].bounds.size.width) / 3);
        make.left.equalTo(v);
        make.height.offset(100);
    }];
    
    // 3.实物图片4
    UIButton* btn4 = [[UIButton alloc]init];
    //  设置按钮的背景图片20160918161056_049453.jpg@!goods_recom
    [btn4 setBackgroundImage:[UIImage imageNamed:@"author"] forState:UIControlStateNormal];
    
    [v addSubview:btn4];
    
    ///MRAK:给按钮4添加点击事件
    
    [btn4 addTarget:self action:@selector(btnClick4) forControlEvents:UIControlEventTouchUpInside];
    [btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn1.mas_bottom);
        make.width.mas_equalTo(([UIScreen mainScreen].bounds.size.width) / 3);
        make.left.equalTo(btn3.mas_right);
        make.height.offset(100);
        
    }];
    
    // 2.名称
    UILabel *nameL = [[UILabel alloc]init];
    nameL.text = @" [次日达]进口牛油果";
    nameL.font = [UIFont systemFontOfSize:10];
    nameL.textColor = [UIColor blackColor];
    [v addSubview:nameL];
    
    
    [nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(v);
        make.top.equalTo(btn3.mas_bottom);
        make.right.equalTo(btn3);
        
    }];
    
    // 2.名称2
    UILabel *nameLr = [[UILabel alloc]init];
    nameLr.text = @" [次日达]进口猪食果";
    nameLr.font = [UIFont systemFontOfSize:10];
    nameLr.textColor = [UIColor blackColor];
    [v addSubview:nameLr];
    
    
    [nameLr mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(nameL.mas_right);
        make.top.equalTo(btn3.mas_bottom);
        make.right.equalTo(btn4);
        
    }];
    
    
    //     2.精选
    UILabel *nameL1 = [[UILabel alloc]init];
    nameL1.text = @" 精选";
    nameL1.font = [UIFont systemFontOfSize:12];
    nameL1.textColor = [UIColor redColor];
    [v addSubview:nameL1];
    
    [nameL1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(v);
        make.top.equalTo(nameL.mas_bottom);
        make.right.equalTo(btn3);
    }];
    
    //     2.精选2
    UILabel *nameL1r = [[UILabel alloc]init];
    nameL1r.text = @" 精选";
    nameL1r.font = [UIFont systemFontOfSize:12];
    nameL1r.textColor = [UIColor redColor];
    [v addSubview:nameL1r];
    
    [nameL1r mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(nameL1.mas_right);
        make.top.equalTo(nameLr.mas_bottom);
        make.right.equalTo(btn4);
    }];
    
    
    //     2.容量
    UILabel *nameL2 = [[UILabel alloc]init];
    nameL2.text = @" 560-720/4粒";
    nameL2.font = [UIFont systemFontOfSize:12];
    nameL2.textColor = [UIColor blackColor];
    [v addSubview:nameL2];
    
    [nameL2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(v);
        make.top.equalTo(nameL1.mas_bottom);
        make.right.equalTo(btn3);
    }];
    
    //     2.容量2
    UILabel *nameL2r = [[UILabel alloc]init];
    nameL2r.text = @" 560-720/4粒";
    nameL2r.font = [UIFont systemFontOfSize:12];
    nameL2r.textColor = [UIColor blackColor];
    [v addSubview:nameL2r];
    
    [nameL2r mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(nameL2.mas_right);
        make.top.equalTo(nameL1r.mas_bottom);
        make.right.equalTo(btn4);
    }];
    
    // 2.价格
    UILabel *price = [[UILabel alloc]init];
    price.text = @"  ¥29.9";
    price.font = [UIFont systemFontOfSize:12];
    price.textColor = [UIColor redColor];
    price.textAlignment = NSTextAlignmentCenter;
    [v addSubview:price];
    
    [price mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(v);
        make.top.equalTo(nameL2.mas_bottom);
        make.width.mas_equalTo(([UIScreen mainScreen].bounds.size.width) / 6);
    }];
    
    
    // 添加图片
    UIButton* btnimage = [[UIButton alloc]init];
    
    
    [btnimage setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
    btnimage.contentMode = UIViewContentModeCenter;
    [v addSubview:btnimage];
    
    [btnimage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(price.mas_right);
        make.bottom.equalTo(price);
        make.right.equalTo(btn3);
    }];
    
    // 2.价格2
    UILabel *pricer = [[UILabel alloc]init];
    pricer.text = @"  ¥45.4";
    pricer.font = [UIFont systemFontOfSize:12];
    pricer.textColor = [UIColor redColor];
    pricer.textAlignment = NSTextAlignmentCenter;
    [v addSubview:pricer];
    
    [pricer mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(btnimage.mas_right);
        make.top.equalTo(nameL2r.mas_bottom);
        make.width.mas_equalTo(([UIScreen mainScreen].bounds.size.width) / 6);
    }];
    
    // 添加图片2
    UIButton* btnimage2 = [[UIButton alloc]init];
    
    
    [btnimage2 setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
    btnimage2.contentMode = UIViewContentModeCenter;
    [v addSubview:btnimage2];
    
    [btnimage2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(pricer.mas_right);
        make.bottom.equalTo(price);
        make.right.equalTo(btn4);
    }];
    
    
    // 3.实物图片5
    UIButton* btnt = [[UIButton alloc]init];
    UIImageView* images1 = [[UIImageView alloc]init];
    
    [images1 sd_setImageWithURL:[NSURL URLWithString:@"http://img01.bqstatic.com//upload/activity/201609241500124.jpg@90Q.jpg"] placeholderImage:[UIImage imageNamed:@"author"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [btnt setBackgroundImage:images1.image forState:(UIControlStateNormal)];
        
    }];
    
    [v addSubview:btnt];
    
    ///MRAK:给按钮5添加点击事件http://img01.bqstatic.com//upload/activity/201609241500124.jpg@90Q.jpg
    
    [btnt addTarget:self action:@selector(btnClick5) forControlEvents:UIControlEventTouchUpInside];
    
    [btnt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(([UIScreen mainScreen].bounds.size.width) / 3);
        make.right.equalTo(v);
        make.bottom.equalTo(btnimage);
        make.top.equalTo(btn2.mas_bottom);
        make.height.offset(150);
    }];
    
    /// 集体赋值
    self.btn3t = btn3;
    self.btn4t = btn4;
    self.nameL = nameL;
    self.nameLt = nameLr;
    self.nameL2 = nameL2;
    self.nameL2t = nameL2r;
    self.price = price;
    self.pricer = pricer;
}



#pragma 监听点击按钮1事件
- (void)btnClick{
    
    
    if ([_delegate respondsToSelector:@selector(axffreshToHomeCell:)]) {
        [_delegate axffreshToHomeCell:self];
    }
    
    
}
#pragma 监听点击按钮去2事件
- (void)btnClick2{
    
    if ([_delegate respondsToSelector:@selector(axffreshToHomeCell2:)]) {
        [_delegate axffreshToHomeCell2:self];
    }
    
    
}

#pragma 监听点击按钮去3事件
- (void)btnClick3{
    
    if ([_delegate respondsToSelector:@selector(axffreshToHomeCell3:)]) {
        [_delegate axffreshToHomeCell3:self];
    }
    
    
}
#pragma 监听点击按钮去4事件
- (void)btnClick4{
    
    if ([_delegate respondsToSelector:@selector(axffreshToHomeCell4:)]) {
        [_delegate axffreshToHomeCell4:self];
    }
    
    
}
#pragma 监听点击按钮去5事件
- (void)btnClick5{
    
    if ([_delegate respondsToSelector:@selector(axffreshToHomeCell5:)]) {
        [_delegate axffreshToHomeCell5:self];
    }
    
}


#pragma 重写set 方法
- (void)setFgoodsModel:(AXFcgoods_detailModel *)fgoodsModel{
    _fgoodsModel = fgoodsModel;
    
    UIImageView* images = [[UIImageView alloc]init];
    
    [images sd_setImageWithURL:[NSURL URLWithString:fgoodsModel.goods[0].img] placeholderImage:[UIImage imageNamed:@"author"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [self.btn3t setBackgroundImage:images.image forState:(UIControlStateNormal)];
        
    }];
    
    UIImageView* images2 = [[UIImageView alloc]init];
    
    [images2 sd_setImageWithURL:[NSURL URLWithString:fgoodsModel.goods[1].img] placeholderImage:[UIImage imageNamed:@"author"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [self.btn4t setBackgroundImage:images2.image forState:(UIControlStateNormal)];
        
    }];
    
    self.nameL.text = fgoodsModel.goods[0].name;
    self.nameLt.text = fgoodsModel.goods[1].name;
    self.nameL2.text = fgoodsModel.goods[0].specifics;
    self.nameL2t.text = fgoodsModel.goods[1].specifics;
    self.price.text = fgoodsModel.goods[0].partner_price;
    self.price.text = fgoodsModel.goods[1].partner_price;
}

@end

