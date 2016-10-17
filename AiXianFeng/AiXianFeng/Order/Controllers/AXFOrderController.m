//
//  AXFOrderController.m
//  AiXianFeng
//
//  Created by Long on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFOrderController.h"
#import "JHUD.h"
#import "AXFWebViewController.h"

// 格式 0xff3737
#define JHUDRGBHexAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define JHUDRGBA(r,g,b,a)     [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

@interface AXFOrderController ()

@property (nonatomic,strong) UIButton *rightButton;

@property (nonatomic) JHUD *hudView;

@property (nonatomic) CGRect orignalRect;

@end

@implementation AXFOrderController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // 基类中Lazy创建，进行二次封装，使用时直接调用，避免子类中频繁创建产生冗余代码的问题。
    self.hudView = [[JHUD alloc]initWithFrame:self.view.bounds];
    
    [self loadingFailure];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightButton];
    
}

-(void)loadingFailure
{
    self.hudView.indicatorViewSize = CGSizeMake(100, 100);
    self.hudView.messageLabel.text = @"妈妈说菜还没有做好呢!";
    [self.hudView.refreshButton setTitle:@"戳我看菜谱" forState:UIControlStateNormal];
    __block UINavigationController *nav = self.navigationController;
    self.hudView.JHUDReloadButtonClickedBlock = ^()
    {
        AXFWebViewController * vc = [[AXFWebViewController alloc] init];
        vc.urlString = @"http://www.topit.me/broad?type=search&k=%E7%BE%8E%E9%A3%9F";
        [nav pushViewController:vc animated:YES];
    };
    self.hudView.customImage = [UIImage imageNamed:@"null"];
    
    [self.hudView showAtView:self.view hudType:JHUDLoadingTypeFailure];
    
}



@end
