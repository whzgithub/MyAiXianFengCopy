//
//  AXFMarketProductCell.m
//  AiXianFeng
//
//  Created by whz on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMarketProductCell.h"
#import <UIImageView+WebCache.h>

@interface AXFMarketProductCell ()

// 商品的图片
@property(nonatomic,strong)UIImageView *imageViewProduct;
// 商品的精品字段显示
@property(nonatomic,strong)UILabel *labelBest;
// 商品的名称
@property(nonatomic,strong)UILabel *labelName;
// 商品的重量
@property(nonatomic,strong)UILabel *labelWeight;
// 商品的现价
@property(nonatomic,strong)UILabel *labelPrice;
// 商品的原价
@property(nonatomic,strong)UILabel *labelPriceBack;
// 商品的增加减少的实时数量
@property(nonatomic,strong)UILabel *labelNum;
// 商品的减号
@property(nonatomic, strong)UIButton *buttonMinus;

@end


@implementation AXFMarketProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - setModel方法中给cell赋值
// 在setModel方法中给cell赋值
-(void)setModel:(AXFIDModel *)model
{
    _model = model;
    self.labelName.text = model.name;
    self.labelWeight.text = model.specifics;
    self.labelPrice.text = model.market_price;
    self.labelPriceBack.text = model.partner_price;
    [self.imageViewProduct sd_setImageWithURL:[NSURL URLWithString:model.img]];
    
    // 删除线
    NSMutableAttributedString *lineDelete = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"￥%@",self.labelPriceBack.text]];
    [lineDelete addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, lineDelete.length)];
    self.labelPriceBack.attributedText = lineDelete;
    
    // MARK: - 判断实时数量、减号 隐藏处理 （解决重用问题）
    self.labelNum.text = [NSNumber numberWithInteger:model.labelNum].description;
    if ([self.labelNum.text intValue] != 0) {
        
        self.labelNum.hidden = NO;
        self.buttonMinus.hidden = NO;
        
    }else{
        
        self.labelNum.hidden = YES;
        self.buttonMinus.hidden = YES;
    }
}

#pragma mark - 增加减少商品的逻辑处理
/// 增加减少商品的逻辑处理
-(void)addBtnClick:(UIButton *)sender 
{
    /// 点减号逻辑
    if (sender.tag == 1) {
        
        self.labelNum.text = @(self.labelNum.text.intValue - 1).description;
        self.model.labelNum --;
        if (!self.labelNum.text.intValue) {
            
            self.buttonMinus.hidden = YES;
            self.labelNum.hidden = YES;
        }
    }
    
    /// 点加号逻辑
    if (sender.tag == 0) {
        
        self.labelNum.text = @(self.labelNum.text.intValue + 1).description;
        self.model.labelNum ++;
        if (self.labelNum.text.intValue) {
            
            self.buttonMinus.hidden = NO;
            self.labelNum.hidden = NO;
        }
    }
    
    NSNotificationCenter *center= [NSNotificationCenter defaultCenter];
    
    NSDictionary *userInfo = @{
                               @"imageView" : self.imageViewProduct,
                               @"type"      : sender,
                               };
    
    [center postNotificationName:@"dropClick" object:self userInfo:userInfo];
    
}

#pragma mark - 初始化界面
/// 初始化界面
- (void) setupUI {
    
    /// 商品的图片
    UIImageView *imageViewProduct = [[UIImageView alloc] init];
    self.imageViewProduct = imageViewProduct;
    [self.contentView addSubview:imageViewProduct];
    [imageViewProduct mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(8);
        make.bottom.equalTo(self.contentView).offset(-8);
        make.width.mas_equalTo(62);
    }];
    
    /// 商品类型 精选
    UILabel *labelBest = [[UILabel alloc] init];
    self.labelBest = labelBest;
    labelBest.text = @"精选";
    labelBest.textColor = [UIColor redColor];
    labelBest.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:labelBest];
    [labelBest mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(8);
        make.left.equalTo(imageViewProduct.mas_right).offset(8);
    }];
    
    /// 商品的名字
    UILabel *labelName = [[UILabel alloc] init];
    self.labelName = labelName;
    labelName.text = @"名字假数据";
    labelName.textColor = [UIColor blackColor];
    labelName.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:labelName];
    [labelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(8);
        make.left.equalTo(labelBest.mas_right).offset(8);
    }];
    
    /// 商品的重量
    UILabel *labelWeight = [[UILabel alloc] init];
    self.labelWeight = labelWeight;
    labelWeight.text = @"重量假数据";
    labelWeight.textColor = [UIColor blackColor];
    labelWeight.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:labelWeight];
    [labelWeight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelBest.mas_bottom).offset(8);
        make.left.equalTo(imageViewProduct.mas_right).offset(8);
    }];
    
    /// 商品的现价
    UILabel *labelPrice = [[UILabel alloc] init];
    self.labelPrice = labelPrice;
    labelPrice.text = [@"¥ " stringByAppendingString:@"现价假数据"];
    labelPrice.textColor = [UIColor redColor];
    labelPrice.font = [UIFont systemFontOfSize:14];
    labelPrice.font = [UIFont fontWithName:@"Helvetica" size:15.f];
    [self.contentView addSubview:labelPrice];
    [labelPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelWeight.mas_bottom).offset(8);
        make.left.equalTo(imageViewProduct.mas_right).offset(8);
    }];
    
    /// 商品的原价
    UILabel *labelPriceBack = [[UILabel alloc] init];
    self.labelPriceBack = labelPriceBack;
    labelPriceBack.text = [@"¥ " stringByAppendingString:@"原价假数据"];
    labelPriceBack.textColor = [UIColor lightGrayColor];
    labelPriceBack.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:labelPriceBack];
    [labelPriceBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(labelPrice);
        make.left.equalTo(labelPrice.mas_right).offset(8);
    }];
    
    /// 商品添加按钮 v2_increase
    UIButton *buttonAdd = [[UIButton alloc] init];
    [buttonAdd setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
    [self.contentView addSubview:buttonAdd];
    [buttonAdd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-8);
        make.bottom.equalTo(self.contentView).offset(-8);
        make.width.height.offset(20);
    }];
    //根据tag确定点击的是什么按钮
    buttonAdd.tag = 0;
    
    [buttonAdd addTarget:self action:@selector(addBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    /// 商品数量  （要隐藏）
    self.labelNum = [[UILabel alloc] init];
    self.labelNum.text = @"0";
    self.labelNum.textColor = [UIColor blackColor];
    self.labelNum.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.labelNum];
    [self.labelNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(buttonAdd.mas_left).offset(-10);
        make.centerY.equalTo(buttonAdd);
    }];
    self.labelNum.hidden = YES;
    
    /// 商品减少按钮 v2_reduce  （要隐藏）
    self.buttonMinus = [[UIButton alloc] init];
    [self.buttonMinus setImage:[UIImage imageNamed:@"v2_reduce"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.buttonMinus];
    [self.buttonMinus mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(buttonAdd.mas_left).offset(-30);
        make.centerY.equalTo(buttonAdd);
        make.width.height.offset(20);
    }];
    self.buttonMinus.hidden = YES;

    //根据tag确定点击的是什么按钮
    self.buttonMinus.tag = 1;
    [self.buttonMinus addTarget:self action:@selector(addBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
}

@end
