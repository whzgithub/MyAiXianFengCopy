//
//  AXFSignatureCell.m
//  AiXianFeng
//
//  Created by Long on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFSignatureCell.h"
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
        //        self.userInteractionEnabled = NO;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //        self.isUserInteractionEnabled = NO;
    }
    return self;
}
- (void)setupUI
{
    UIButton *btn1 = [self loadSignatureBtnWithTitle:@"每日签到" andImageName:@"icon_dao_gray" andBtnNum :AXFSignatureBtnNum1];
    UIButton *btn2 = [self loadSignatureBtnWithTitle:@"鲜货直供" andImageName:@"icon_dao_gray"andBtnNum :AXFSignatureBtnNum2];
    UIButton *btn3 = [self loadSignatureBtnWithTitle:@"大闸蟹" andImageName:@"icon_dao_gray"andBtnNum :AXFSignatureBtnNum3];
    UIButton *btn4 = [self loadSignatureBtnWithTitle:@"水果" andImageName:@"icon_dao_gray"andBtnNum :AXFSignatureBtnNum4];
    [self.contentView addSubview:btn1];
    [self.contentView addSubview:btn2];
    [self.contentView addSubview:btn3];
    [self.contentView addSubview:btn4];
    
    [self.contentView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
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
#pragma mark - 按钮的点击方法
- (void)btn1Click:(UIButton *)btn
{
    NSLog(@"我被点了一下");
}
//创建button的方法
- (UIButton *)loadSignatureBtnWithTitle:(NSString *)title andImageName:(NSString *)imageName andBtnNum:(AXFSignatureBtn)btnNum
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
    //    imageV.backgroundColor = [UIColor redColor];
    
    [btn addSubview:label];
    [btn addSubview:imageV];
    
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(btn.mas_centerX);
        make.top.mas_equalTo(btn).offset(10);
    }];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(btn.mas_centerX);
        make.top.equalTo(imageV.mas_bottom).offset(10);
        make.bottom.equalTo(btn.mas_bottom).offset(-10);
    }];
    btn.backgroundColor = [UIColor redColor];
    [btn sizeToFit];
    //给每一个按钮设置tag
    btn.tag = btnNum;
    //给四个btn添加点击事件
    [btn addTarget:self action:@selector(signatureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
- (void)signatureBtnClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(signatureCell:andBtnNum:)]) {
        [self.delegate signatureCell:self andBtnNum:btn.tag];
    }
}

@end

