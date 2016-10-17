//
//  AXFMineController.m
//  AiXianFeng
//
//  Created by Long on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMineController.h"
#import "AXFMineTopView.h"
#import "AXFMineScrollView.h"
#import "AXFMineOrderView.h"
#import "AXFMyListController.h"
#import "AXFShopCollectController.h"
#import "AXFCollectViewController.h"
#import "AXFVipController.h"
#import "AXFIntegralViewController.h"
#import "AXFMineOthersFunctionView.h"
#import "AXFSiteViewController.h"
#import "AXFNewsViewController.h"
#import "AXFTicklingHViewController.h"
#import "AXFJoinViewController.h"
#import "AXFVacanciesViewController.h"
#import "AXFCouponViewController.h"
#import "AXFHscoringViewController.h"
#import "ViewController.h"
#import "AXFSettingTabviewVC.h"

@implementation AXFMineController{
    
    NSUInteger _idx;
}

- (void) viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
//    self.navigationController.navigationBarHidden = YES;
    
    [self setupUI];
}

- (void) setupUI {
    
    CGFloat mineTopViewY = 180;
    CGFloat mineScrollViewH = 508;
    
    // 自定义“我的”顶部布局
    AXFMineTopView *mineTopView = [[AXFMineTopView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, mineTopViewY)];
    [self.view addSubview:mineTopView];
    
    // 监听分类视图的值改变事件
    [mineTopView addTarget:self action:@selector(TopViewValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    // 自定义“我的”scrollView布局
    AXFMineScrollView *mineScrollView = [[AXFMineScrollView alloc] initWithFrame:CGRectMake(0, mineTopViewY, [UIScreen mainScreen].bounds.size.width, mineScrollViewH)];
    [self.view addSubview:mineScrollView];
    mineScrollView.ckBlock = ^(AXFMineOthersFunctionView *sender)
    {
        switch (sender.index) {
            case 4:
            {AXFIntegralViewController *vc = [[AXFIntegralViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];}
                break;
            case 5:
            {AXFSiteViewController *vc = [[AXFSiteViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];}
                break;
            case 6:
            {AXFNewsViewController *vc = [[AXFNewsViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];}
                break;
            case 7:
            {AXFTicklingHViewController *vc = [[AXFTicklingHViewController alloc]init];
                
                [self.navigationController pushViewController:vc animated:YES];}
                
                break;
                
            case 8:
            {AXFJoinViewController *vc = [[AXFJoinViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];}
                break;
            case 10:
            {AXFVacanciesViewController *vc = [[AXFVacanciesViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];}
                break;
            case 11:
            {AXFCouponViewController *vc = [[AXFCouponViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];}
                break;
            case 12:
            {AXFHscoringViewController *vc = [[AXFHscoringViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];}
                break;

            default:
                break;
        }
        

    };
    // 自定义“我的”订单详情布局
    AXFMineOrderView *mineOrderView = [[AXFMineOrderView alloc] initWithFrame:CGRectMake(0, 12, [UIScreen mainScreen].bounds.size.width, 132)];
    [mineScrollView addSubview:mineOrderView];
    
    // 监听分类视图的值改变事件
    [mineOrderView addTarget:self action:@selector(orderViewValueChanged:) forControlEvents:UIControlEventValueChanged];
    
}
- (void)TopViewValueChanged:(AXFMineTopView*)sender{
    
    if (sender.idx==4) {
        
        AXFCollectViewController* conVc = [[AXFCollectViewController alloc] init];
        
        [self.navigationController pushViewController:conVc animated:YES];
        
    }
    
    else if (sender.idx==5) {
        AXFShopCollectController* shopVc = [[AXFShopCollectController alloc] init];
        [self.navigationController pushViewController:shopVc animated:YES];
    }
    else if (sender.idx == 6)
    {
        AXFSettingTabviewVC *settingVC = [[AXFSettingTabviewVC alloc]init];
        settingVC.title = @"设置";
        settingVC.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.navigationController pushViewController:settingVC animated:YES];
    }
    else{
        ViewController* vipVc = [[ViewController alloc] init];
        
        [self.navigationController pushViewController:vipVc animated:YES];
        
    }
    
}
- (void)orderViewValueChanged:(AXFMineOrderView *)sender {
    
    // 1.获取按钮下标
    _idx = sender.idx;
    
    AXFMyListController* listVc = [[AXFMyListController alloc] init];
    
    [self.navigationController pushViewController:listVc animated:YES];
    
    listVc.tag = sender.idx;
    
}

@end
