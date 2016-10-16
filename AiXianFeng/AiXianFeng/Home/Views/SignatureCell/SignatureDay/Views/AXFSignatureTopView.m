//
//  AXFSignatureTopView.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFSignatureTopView.h"
#import <Masonry.h>
#import "AXFPointsView.h"
#import "CommonTool.h"


@interface AXFSignatureTopView ()

@property (assign,nonatomic) SystemSoundID soundID;
@property (nonatomic, strong)CAEmitterLayer * emitterLayer;//粒子动画
@property (weak, nonatomic) UILabel *descriptionLabel;
@property (weak, nonatomic)  UIButton *signBtn;
//显示积分数的label
@property(nonatomic,strong)UILabel *pointLabel;
//显示签到天数的label
@property(nonatomic,strong)UILabel *daysLabel;
@property(nonatomic,strong)AXFPointsView *totalPointV;



@end
@implementation AXFSignatureTopView
{
    int temp;
    NSInteger _points;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        [self initMyEmitter];//初始化粒子发射源

    }
    return self;
}
- (void)setupUI
{
//创建显示积分数的label
    UILabel *pointLabel = [[UILabel alloc] init];
    [self addSubview:pointLabel];
//    pointLabel.numberOfLines = 0;
    pointLabel.text = @"5积分";
    self.pointLabel = pointLabel;
    pointLabel.textAlignment = NSTextAlignmentCenter;
    pointLabel.textColor = [UIColor yellowColor];
    [pointLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(30);
        make.left.right.equalTo(self).offset(0);
    }];
//创建显示签到天数的label
    UILabel *daysLabel = [[UILabel alloc] init];
    [self addSubview:daysLabel];
    daysLabel.text = @"已连续签到1天";
    self.daysLabel = daysLabel;
    daysLabel.textAlignment = NSTextAlignmentCenter;
    daysLabel.textColor = [UIColor whiteColor];
    daysLabel.font = [UIFont systemFontOfSize:14];
    [daysLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(pointLabel.mas_bottom).offset(15);
    }];
    
//创建显示签到总积分的View
     AXFPointsView *totalpointV = [[AXFPointsView alloc] init];
    [self addSubview:totalpointV];
    totalpointV.backgroundColor = [UIColor clearColor];
    [totalpointV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(daysLabel.mas_bottom).offset(30);
//        make.width.equalTo(self);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(270);
    }];
    self.totalPointV = totalpointV;
    _points = 5;
    totalpointV.points = _points;
    
    
//创建签到按钮
    UIButton *signatureBtn = [[UIButton alloc] init];
    [self addSubview:signatureBtn];
    [signatureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-30);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(40);
        make.centerX.equalTo(self);
    }];
    [signatureBtn setTitle:@"点击签到" forState:UIControlStateNormal];
    [signatureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [signatureBtn setTitle:@"明日再来" forState:UIControlStateSelected];
    [signatureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    signatureBtn.backgroundColor = [UIColor yellowColor];
    //设置圆角
    signatureBtn.layer.cornerRadius = 20;
    signatureBtn.layer.masksToBounds = YES;
    //添加点击事件
    [signatureBtn addTarget:self action:@selector(signatureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}
//签到按钮的点击事件
- (void)signatureBtnClick:(UIButton *)signatureBtn
{
    signatureBtn.selected = YES;
    signatureBtn.backgroundColor = [UIColor darkGrayColor];
    signatureBtn.userInteractionEnabled = NO;
    self.pointLabel.text = @"10积分";
    self.daysLabel.text = @"已连续签到2天";
    
    _totalPointV.points = _points;
    self.wasSelected = self.signBtn.isSelected;
    _points = 30;
    //播放音效
    [self playSound];
    //动画撒金币效果
    [self startAnimation];

    temp = 0;
}


- (void)startAnimation{
    CABasicAnimation * effectAnimation = [CABasicAnimation animationWithKeyPath:@"emitterCells.zanShape.birthRate"];
    effectAnimation.fromValue = [NSNumber numberWithFloat:30];
    effectAnimation.toValue = [NSNumber numberWithFloat:0];
    effectAnimation.duration = 2.0f;
    effectAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    effectAnimation.delegate = self;
    [self.emitterLayer addAnimation:effectAnimation forKey:@"zanCount"];
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        //停止播放音效
        AudioServicesDisposeSystemSoundID(self.soundID);
    }
}
//初始化粒子
-(void)initMyEmitter{
    //发射源
    CAEmitterLayer * emitter = [CAEmitterLayer layer];
    emitter.frame = CGRectMake(0, 0, CGRectGetWidth(self.signBtn.frame), CGRectGetHeight(self.signBtn.frame));
    [self.signBtn.layer addSublayer:self.emitterLayer = emitter];
    //发射源形状
    emitter.emitterShape = kCAEmitterLayerCircle;
    //发射模式
    emitter.emitterMode = kCAEmitterLayerOutline;
    //渲染模式
    //    emitter.renderMode = kCAEmitterLayerAdditive;
    //发射位置
    emitter.emitterPosition = CGPointMake(self.signBtn.frame.size.width/2.0, self.signBtn.frame.size.height/2.0);
    //发射源尺寸大小
    emitter.emitterSize = CGSizeMake(20, 20);
    
    // 从发射源射出的粒子
    
    CAEmitterCell * cell = [CAEmitterCell emitterCell];
    cell.name = @"zanShape";
    //粒子要展现的图片
    cell.contents = (__bridge id)[UIImage imageNamed:@"coin"].CGImage;
//        cell.contents = (__bridge id)[UIImage imageNamed:@"EffectImage"].CGImage;
//                cell.contentsRect = CGRectMake(100, 100, 100, 100);
    //粒子透明度在生命周期内的改变速度
    cell.alphaSpeed = -0.5;
    //生命周期
    cell.lifetime = 3.0;
    //粒子产生系数(粒子的速度乘数因子)
    cell.birthRate = 0;
    //粒子速度
    cell.velocity = 300;
    //速度范围
    cell.velocityRange = 100;
    //周围发射角度
    cell.emissionRange = M_PI / 8;
    //发射的z轴方向的角度
    cell.emissionLatitude = -M_PI;
    //x-y平面的发射方向
    cell.emissionLongitude = -M_PI / 2;
    //粒子y方向的加速度分量
    cell.yAcceleration = 250;
    emitter.emitterCells = @[cell];
}

//播放音效的方法
-(void)playSound{
    
    self.soundID = [CommonTool creatSoundIDWithSoundName:@"签到金币音效.mp3"];
    [CommonTool playSoundWithSoundID:self.soundID];
}


@end
