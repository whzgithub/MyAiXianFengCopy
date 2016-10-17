//
//  AXFShopCartTableViewCell.m
//  AiXianFeng
//
//  Created by mac on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFShopCartTableViewCell.h"

@interface AXFShopCartTableViewCell ()

//商品名
@property (nonatomic,strong) UILabel *nameLabel;
///价格
@property (nonatomic,strong) UILabel *priceLabel;
///图片按钮加载的图片
@property (nonatomic, strong) UIImageView*images;

@property(nonatomic,strong)UILabel *numberLabel;
@end

@implementation AXFShopCartTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupMainView];
    }
    return self;
}
//选中按钮点击事件
-(void)selectBtnClick:(UIButton*)button
{
    button.selected = button.selected?NO:YES;
    CGFloat OneSum = [self.priceLabel.text intValue] * [self.numberLabel.text intValue];
    
    if (button.selected == YES) {
        
        self.selectClick(OneSum);
    }else
    {
        self.selectClick(-OneSum);
    }
    
}

// 数量加按钮
-(void)addBtnClick:(UIButton *)sender
{
    NSInteger num = [_numberLabel.text integerValue];
    num ++;
    _numberLabel.text = @(num).description;
    self.model.labelNum = num;
    if (self.addClick) {
        self.addClick(sender);
    }
}

//数量减按钮
-(void)cutBtnClick:(UIButton *)sender
{
    NSInteger num = [_numberLabel.text integerValue];
    num --;
    if (num == 0) {
        
        if (self.deleteClick) {
            self.deleteClick(0);
        }
        
        
    }
    _numberLabel.text = @(num).description;
    self.model.labelNum = num;
    if (self.cutClick) {
        self.cutClick(sender);
    }
}

-(void)setModel:(AXFIDModel *)model
{
    _model = model;
    
    _nameLabel.text = model.name;
    _priceLabel.text = model.market_price;
    _numberLabel.text = @(model.labelNum).description;
    [_images sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"v2_placeholder_full_size"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    
}


-(void)setupMainView
{
    //白色背景
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor lightGrayColor]);
    bgView.layer.borderWidth = 1;
    [self addSubview:bgView];
    
    //选中按钮
    self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectBtn.selected = self.isSelected;
    [self.selectBtn setImage:[UIImage imageNamed:@"v2_noselected"] forState:UIControlStateNormal];
    [self.selectBtn setImage:[UIImage imageNamed:@"v2_selected"] forState:UIControlStateSelected];
    [self.selectBtn addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:self.selectBtn];
    
    //显示照片
    UIImageView *imageBgView = [[UIImageView alloc]init];
    imageBgView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    self.images = imageBgView;
    [bgView addSubview:imageBgView];
    
    
    
    //商品名
    self.nameLabel = [[UILabel alloc]init];
    //    self.nameLabel.text = @"海报";
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    [bgView addSubview:self.nameLabel];
    
    //精选
    UILabel *Label_ol = [[UILabel alloc]init];
    Label_ol.text = @" 精选";
    Label_ol.textColor = [UIColor redColor];
    Label_ol.font = [UIFont systemFontOfSize:12];
    [bgView addSubview:Label_ol];
    
    
    //价格
    self.priceLabel = [[UILabel alloc]init];
    self.priceLabel.font = [UIFont boldSystemFontOfSize:16];
    self.priceLabel.textColor =[UIColor redColor];
    self.priceLabel.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:self.priceLabel];
    
    //数量加按钮
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateHighlighted];
    [addBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:addBtn];
    addBtn.tag = 0;
    
    //数量减按钮
    UIButton *cutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cutBtn setImage:[UIImage imageNamed:@"v2_reduce"] forState:UIControlStateNormal];
    [cutBtn setImage:[UIImage imageNamed:@"v2_reduce"] forState:UIControlStateHighlighted];
    [cutBtn addTarget:self action:@selector(cutBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:cutBtn];
    cutBtn.tag = 1;
    
    //数量显示
    self.numberLabel = [[UILabel alloc]init];
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    self.numberLabel.text = @"1";
    self.numberLabel.font = [UIFont systemFontOfSize:15];
    [bgView addSubview:self.numberLabel];
    
#pragma mark - 添加约束
    
    //白色背景
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(10);
        make.bottom.equalTo(self);
        make.right.equalTo(self).offset(-10);
        
    }];
    
    //选中按钮
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(5);
        make.centerY.equalTo(bgView);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    //图片背景
    [imageBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView).offset(5);
        make.left.equalTo(self.selectBtn.mas_right).offset(5);
        make.bottom.equalTo(bgView).offset(-5);
        make.width.equalTo(imageBgView.mas_height);
    }];
    
    
    //商品名
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageBgView.mas_right).offset(10);
        make.top.equalTo(bgView).offset(10);
        make.height.equalTo(@30);
        make.width.equalTo(self.priceLabel);
    }];
    
    //商品尺寸
    [Label_ol mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageBgView.mas_right).offset(5);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
        make.height.equalTo(@20);
        make.width.equalTo(self.nameLabel);
    }];
    
    
    //商品价格
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(5);
        make.right.equalTo(bgView);
        make.top.equalTo(bgView).offset(10);
        make.width.equalTo(self.nameLabel);
    }];
    
    //数量加按钮
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(bgView).offset(-5);
        make.bottom.equalTo(bgView).offset(-10);
        make.height.equalTo(@25);
        make.width.equalTo(@25);
    }];
    
    //数量显示
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(addBtn.mas_left);
        make.bottom.equalTo(addBtn);
        make.width.equalTo(addBtn);
        make.height.equalTo(addBtn);
    }];
    
    //数量减按钮
    [cutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.numberLabel.mas_left);
        make.height.equalTo(addBtn);
        make.width.equalTo(addBtn);
        make.bottom.equalTo(addBtn);
    }];
    
}
@end
