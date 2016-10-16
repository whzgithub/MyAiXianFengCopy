//
//  AXFCommonHeaderView.m
//  aixianfeng0051
//
//  Created by 汪舟 on 16/10/12.
//  Copyright © 2016年 陈天佑. All rights reserved.
//

#import "AXFCommonHeaderView.h"
#import "UILabel+CZAddition.h"
#import "AXFScanViewController.h"
@interface AXFCommonHeaderView ()
@property(nonatomic,strong) UILabel *adressLabel;

@end

@implementation AXFCommonHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
//<<<<<<< HEAD
		// r self.backgroundColor = [UIColor clearColor];
		self.alpha = 0.1;
//=======
        self.backgroundColor = self.superview.backgroundColor;
//        self.backgroundColor = [UIColor orangeColor];
        
        self.userInteractionEnabled = YES;
//>>>>>>> b4755d92d3809400e5c2292df53da8a159b09b37
		[self setUI];
	}
	return self;
}
- (void)setUI
{
	//	添加扫一扫
	UIButton *Lbtn = [[UIButton alloc]init];
	
	[Lbtn setImage:[UIImage imageNamed:@"icon_black_scancode"] forState:UIControlStateNormal];
	[Lbtn setImage:[UIImage imageNamed:@"scanicon"] forState:UIControlStateHighlighted];
	[self addSubview:Lbtn];
	[Lbtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.offset(8);
		make.centerY.equalTo(self);
		make.size.mas_equalTo(CGSizeMake(30, 30));
	}];
	[Lbtn addTarget:self action:@selector(LbtnClick:) forControlEvents:UIControlEventTouchUpInside];
	
	//	添加查找界面
	UIButton *Rbtn = [[UIButton alloc]init];
	[Rbtn setImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateNormal];
	[self addSubview:Rbtn];
	[Rbtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.equalTo(self).offset(-8);
		make.centerY.equalTo(Lbtn);
		make.height.width.mas_offset(30);
	}];
	
	[Rbtn addTarget:self action:@selector(RbtnClick:) forControlEvents:UIControlEventTouchUpInside];
	//	添加地址
    UILabel *adressLabel = [[UILabel  alloc] init];
    [self addSubview:adressLabel];
    adressLabel.text = @"配送至：西三旗中腾建华大厦";
    adressLabel.font = [UIFont systemFontOfSize:14];
    
    adressLabel.userInteractionEnabled = YES;
    
    	[adressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.centerY.equalTo(self);
	}];
    adressLabel.adjustsFontSizeToFitWidth = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSender:)];
	[adressLabel addGestureRecognizer:tap];
}
- (void)LbtnClick:(UIImageView *)image
{

    if ([self.delegate respondsToSelector:@selector(aXFCommonHeaderView:)]) {
        [self.delegate aXFCommonHeaderView:self];
	}
}
- (void)RbtnClick:(UIImageView *)image
{
    if ([self.delegate respondsToSelector:@selector(aXFCommonHeaderSearchView:)]) {
        [self.delegate aXFCommonHeaderSearchView:self];	}
}
- (void)tapSender:(UILabel *)label
{
    if ([self.delegate respondsToSelector:@selector(aXFCommonHeaderAdressView:)]) {
        [self.delegate aXFCommonHeaderAdressView:self];	}

}

@end












