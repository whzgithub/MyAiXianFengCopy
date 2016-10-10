//
//  AXFNavigationController.m
//  AiXianFeng
//
//  Created by Long on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFNavigationController.h"
#import "UIColor+CZAddition.h"

@interface AXFNavigationController ()

@end

@implementation AXFNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // 把导航条自带的背景图片清空
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    // 给导航条下面的阴影图片清空
    self.navigationBar.shadowImage = [[UIImage alloc] init];
    
    // 让导航条没有半透明效果
    self.navigationBar.translucent = NO;
    
    // 设置导航条的背景颜色"包括状态栏后面的颜色也一起改了"
    self.navigationBar.barTintColor = [UIColor cz_colorWithHex:0x1e82d2];

    self.navigationBar.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:14], NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    // 设置导航条上的主题颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
    
}

// 让状态栏为白色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}



#pragma mark - 重写此方法拦截到导航控制器的push操作在里面来判断是否要隐藏tabBar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    // 只要不是导航控制器的根控制器就让tabBar隐藏
    if (self.viewControllers.count > 0) {
    // 隐藏那个控制器下面的tabBar就用那个控制器去调用下面这个方法
        viewController.hidesBottomBarWhenPushed = YES;
    }
    // 隐藏tabBar这句话一定要放在push操作之前
    [super pushViewController:viewController animated:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

