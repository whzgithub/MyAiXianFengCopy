//
//  ViewController.m
//  ZFProgresssViewDemo
//
//  Created by wzf on 16/10/11.
//  Copyright © 2016年 wzf. All rights reserved.
//

#import "ViewController.h"
#import "wendu_yuan2.h"
#import "UICountingLabel.h"
#define MAS_SHORTHAND
#import "Masonry.h"
#import "UIColor+Hex.h"
#import "AXFVipController.h"
@interface ViewController ()
@property (nonatomic,strong) wendu_yuan2 *progressView;
@property (nonatomic,strong) UIImageView *boardImgView;
@property (nonatomic,strong) UICountingLabel *pointLab;//分数
@property (nonatomic,strong) UILabel *judgeLab;//评价等级
@property (nonatomic,assign) int point;
@property (nonatomic,strong) UIButton *checkBtn;

@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.pointLab.method = UILabelCountingMethodLinear;
    self.pointLab.format = @"%d";
    [self.pointLab countFrom:1 to:self.point withDuration:2.0];
    [self.progressView start];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithHex:0x0d87cd];
    [self initCircleView];

}
-(void)initCircleView
{
    [self.view addSubview:self.boardImgView];
    [self.view addSubview:self.progressView];
    
    [self.boardImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY).offset(-110);
        make.width.mas_equalTo(330);
        make.height.mas_equalTo(330);
    }];
    
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.size.mas_equalTo(CGSizeMake(AUTO_3PX(980), AUTO_3PX(980)));
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(40);
        make.width.mas_equalTo(self.boardImgView).mas_offset(-30);
        make.height.mas_equalTo(self.boardImgView).mas_offset(-30);
    }];
    self.point = 800;
    self.progressView.progress = (800.0-300)/(850-300.0);
    
    
    self.boardImgView.backgroundColor = [UIColor clearColor];
    [self.view bringSubviewToFront:self.progressView];
    
    [self.progressView addSubview:self.pointLab];
    [self.pointLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.progressView.mas_width);
        make.height.mas_equalTo(60);
    
           make.centerX.equalTo(self.progressView.mas_centerX);
        make.centerY.equalTo(self.progressView.mas_centerY).mas_offset(-10);
    }];
    
    
    [self.progressView addSubview:self.judgeLab];
    [self.judgeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.progressView);
        make.top.mas_equalTo(self.pointLab.mas_bottom);
        make.left.mas_equalTo(self.progressView.mas_left);
    }];
    self.judgeLab.text = @"信用极好";
    
    [self.view addSubview:self.checkBtn];
    [self.checkBtn addTarget:self action:@selector(startAnim) forControlEvents:UIControlEventTouchUpInside];
    [self.checkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(-178);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(66);
    }];
}
-(void)startAnim
{
    // 1.创建对象
    AXFVipController *twoVc = [[AXFVipController alloc] init];
    
    // 2.显示控制器
    [self presentViewController:twoVc animated:YES completion:nil];
    
    

}
#pragma mark - property
-(UIButton *)checkBtn
{
    if (_checkBtn == nil) {
        _checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_checkBtn setBackgroundImage:[UIImage imageNamed:@"whiteBtn"] forState:UIControlStateNormal];
        [_checkBtn setTitle:@"查看积分详情" forState:UIControlStateNormal];
        [_checkBtn setTitleColor:[UIColor colorWithHex:0x0d87cd] forState:UIControlStateNormal];
        _checkBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        
        _checkBtn.backgroundColor = [UIColor clearColor];
        _checkBtn.titleEdgeInsets = UIEdgeInsetsMake(-18, 0, 0, 0);
    }
    return _checkBtn;
}
-(wendu_yuan2*)progressView
{
    if (_progressView  == nil) {
        _progressView = [[wendu_yuan2 alloc]init];
        _progressView.backgroundColor = [UIColor clearColor];
        ;
    }
    return _progressView;
}
-(UICountingLabel *)pointLab
{
    if (!_pointLab) {
        _pointLab = [[UICountingLabel alloc]init];
        _pointLab.textAlignment = NSTextAlignmentCenter;
        _pointLab.font = [UIFont systemFontOfSize:60];
        _pointLab.textColor = [UIColor whiteColor];
    }
    return _pointLab;
}
-(UILabel *)judgeLab
{
    if (!_judgeLab) {
        _judgeLab = [[UILabel alloc]init];
        _judgeLab.textAlignment = NSTextAlignmentCenter;
        _judgeLab.font = [UIFont systemFontOfSize:16];
        _judgeLab.textColor = [UIColor whiteColor];
    }
    return _judgeLab;
}
-(UIImageView*)boardImgView
{
    if (_boardImgView  == nil) {
        _boardImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"board"]];
    }
    return _boardImgView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
