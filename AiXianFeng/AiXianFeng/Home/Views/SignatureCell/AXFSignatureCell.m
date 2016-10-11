//
//  AXFSignatureCell.m
//  AiXianFeng
//
//  Created by Long on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFSignatureCell.h"
#import "NSAttributedString+CZAdditon.h"
#import <Masonry.h>

@interface AXFSignatureCell ()

@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak) UIButton *btn;
@property(nonatomic,weak) UIImageView *imgV;

@end

@implementation AXFSignatureCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI
{
    UIButton *btn1 = [self loadSignatureBtnWithTitle:@"每日签到" andImageName:@"icon_qq"];
    UIButton *btn2 = [self loadSignatureBtnWithTitle:@"鲜货直供" andImageName:@"icon_qq"];
    UIButton *btn3 = [self loadSignatureBtnWithTitle:@"大闸蟹" andImageName:@"icon_qq"];
    UIButton *btn4 = [self loadSignatureBtnWithTitle:@"水果" andImageName:@"icon_qq"];
    [self addSubview:btn1];
    [self addSubview:btn2];
    [self addSubview:btn3];
    [self addSubview:btn4];
    
    [self.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
    }];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
    }];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btn1.mas_right).offset(0);
        make.width.equalTo(btn1.mas_width).offset(0);
    }];
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btn2.mas_right).offset(0);
        make.width.equalTo(btn2.mas_width).offset(0);
    }];
    [btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btn3.mas_right).offset(0);
        make.width.equalTo(btn3.mas_width).offset(0);
        make.right.offset(0);
    }];
    
    
}
//创建button的方法
- (UIButton *)loadSignatureBtnWithTitle:(NSString *)title andImageName:(NSString *)imageName
{
    //创建四分按钮
    UIButton *btn = [[UIButton alloc] init];
    self.btn = btn;
    UILabel *label = [[UILabel alloc] init];
    self.nameLabel = label;
    label.text = title;
    label.textAlignment =  NSTextAlignmentCenter;
    [label setFont:[UIFont systemFontOfSize:13]];
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    self.imgV = imageV;
    imageV.backgroundColor = [UIColor redColor];
    
    [self.btn addSubview:label];
    [self.btn addSubview:imageV];
    
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(btn.mas_centerX);
        make.top.mas_equalTo(btn).offset(10);
    }];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(btn.mas_centerX);
        make.top.equalTo(imageV.mas_bottom).offset(10);
    }];
    
    [btn sizeToFit];
    
    
    return btn;
}


@end
