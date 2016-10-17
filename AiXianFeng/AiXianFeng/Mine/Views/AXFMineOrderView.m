//
//  AXFMineOrderView.m
//  AiXianFeng
//
//  Created by whz on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMineOrderView.h"
#import "NSAttributedString+Additon.h"
@interface AXFMineOrderView ()
@property(nonatomic,copy)NSArray* btnAll;
@end
@implementation AXFMineOrderView

- (instancetype) initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}


- (void) setupUI {
    
    UIView *money = [[UIView alloc] init];
    money.backgroundColor = [UIColor whiteColor];
    [self addSubview:money];
    [money mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(3);
        make.bottom.mas_equalTo(-3);
        make.width.offset(375);
    }];
    
    UIImageView *imgM = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"H62"]];
    [self addSubview:imgM];
    imgM.backgroundColor = [UIColor redColor];
    [imgM mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(money);
        make.left.equalTo(money).offset(6);
        make.width.offset(80);
        make.height.offset(40);
        
    }];
    
    UIButton *btn = [[UIButton alloc]init];
    [self addSubview:btn];
    [btn setBackgroundImage:[UIImage imageNamed:@"H22"] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor greenColor];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(money);
        make.right.equalTo(money).offset(-6);
        make.width.offset(120);
        make.height.offset(40);
        
    }];
    
    UIButton *btn1 = [self loadHomeTopBtnWithTitle:@"待付款" andImageName:@"icon_daifukuan" andBtnType:BtnOne];
    
    [self addSubview:btn1];
    // 待付款
    btn1.backgroundColor = [UIColor clearColor];
    
    
    UIButton *btn2 = [self loadHomeTopBtnWithTitle:@"待收货" andImageName:@"icon_daishouhuo" andBtnType:BtnTwo];
    
    [self addSubview:btn2];
    btn2.backgroundColor = [UIColor clearColor];
    
    
    
    UIButton *btn3 = [self loadHomeTopBtnWithTitle:@"待评价" andImageName:@"icon_daipingjia" andBtnType:BtnThree];
    [self addSubview:btn3];
    btn3.backgroundColor = [UIColor clearColor];
    
    UIButton *btn4 = [self loadHomeTopBtnWithTitle:@"退款/售后" andImageName:@"icon_tuikuan" andBtnType:BtnFour];
    
    
    [self addSubview:btn4];

    btn4.backgroundColor = [UIColor clearColor];
    
    NSArray *arrB = @[btn1,btn2,btn3,btn4];
    

    
    // 给四个子按钮都设置一个上下约束
    [arrB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(15);
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
    
    // 给按钮添加点击事件
    NSArray* btnAll = @[btn,btn1,btn2,btn3];
    
    [btnAll enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 添加按钮监听事件
        [obj addTarget:self action:@selector(categoryBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }];
    
    _btnAll = btnAll;
    
}

- (UIButton *)loadHomeTopBtnWithTitle:(NSString *)title andImageName:(NSString *)imageName andBtnType:(BtnNumber)btnType{
    // 添加四分按钮
    UIButton *btn = [[UIButton alloc] init];
    // 创建图文混排"创建属性文字"
    NSAttributedString *attrStr = [NSAttributedString imageTextWithImage:[UIImage imageNamed:imageName] imageWH:30 title:title fontSize:12 titleColor:[UIColor blackColor] spacing:8];
    // 设置按钮中属性标题"设置图片混排"
    [btn setAttributedTitle:attrStr forState:UIControlStateNormal];
    // 设置按钮中的文字自动换行
    btn.titleLabel.numberOfLines = 0;
    // 设置按钮中label文字局中
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:btn];
    
    // 给每一个按钮设置tag
    btn.tag = btnType;
    
 
    return btn;
}

// 点击分类按钮时调用
- (void)categoryBtnClick:(UIButton *)sender {
    
    
    // 获取按钮所在集合中的索引
    NSInteger idx = [_btnAll indexOfObject:sender];
    
    _idx = idx;
    
    // 发送事件,让scrollView滚动!
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    
    
}

@end