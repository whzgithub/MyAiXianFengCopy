//
//  AXFGuideController.m
//  AiXianFeng
//
//  Created by whz on 16/10/12.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFGuideController.h"
#import "AXFGuideView.h"
#import "Masonry.h"
#import "AXFNavigationController.h"

// 图片个数
#define KImageCount 4


@implementation AXFGuideController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    BOOL isNewVersion = YES;
    
    if (isNewVersion) {
        
        // 1.添加新特性
        [self addGuideView];
    }
    
    // 2.跳转到主界面
    [self setupUI];
}

- (void) setupUI {

    // 创建四个子控制器并设置它的相应内容
    UIViewController *vc1 = [self loadChildViewControllerWithClassName:@"AXFHomeController" andTitle:@"首页" andImageName:@"v2_home"];
    
    UIViewController *vc2 = [self loadChildViewControllerWithClassName:@"AXFMarketController" andTitle:@"闪送超市" andImageName:@"v2_order"];
    
    UIViewController *vc3 = [self loadChildViewControllerWithClassName:@"AXFOrderController" andTitle:@"新鲜预定" andImageName:@"freshReservation"];
    
    UIViewController *vc4 = [self loadChildViewControllerWithClassName:@"AXFShopCarController" andTitle:@"购物车" andImageName:@"shopCart"];
    
    UIViewController *vc5 = [self loadChildViewControllerWithClassName:@"AXFMineController" andTitle:@"我的" andImageName:@"v2_my"];
    
    // 给标签控制器添加子控制器
    self.viewControllers = @[vc1, vc2, vc3, vc4, vc5];
    
    // 让tabBar没有半透明效果,还会影响它里面view的高度"默认view的最底部是贴着屏幕的最底部,如果氢此属性设置为NO,view的底部只到tabBar的顶部"
    self.tabBar.translucent = NO;
    
    // 设置标签栏的主题颜色"它会影响标签栏上的所有文字颜色"
    self.tabBar.tintColor = [UIColor grayColor];
}

/**
 此方法中通过alloc方式创建及设置子控制器的内容
 
 @param className 控制器类名字符串
 @param title     标签上显示的标题
 @param imageName 标签栏上显示的图片
 */
- (UIViewController *)loadChildViewControllerWithClassName:(NSString *)className andTitle:(NSString *)title andImageName:(NSString *)imageName {
    
    
    // 把类名的字符串转成类的类型
    Class class =  NSClassFromString(className);
    // 通过转换出来的类的类型来创建控制器
    UIViewController *vc = [[class alloc] init];
    
    // 返回导航控制器"导航控制器中又添加了一个根控制器"
    return [self setupWithViewController:vc andTitle:title andImageName:imageName];
}


/**
 此方法中通过加载sb来创建控制器及设置子控制器的内容
 
 @param className 控制器类名字符串
 @param title     标签上显示的标题
 @param imageName 标签栏上显示的图片
 */
- (UIViewController *)loadChildViewControllerWithStoryBoard:(NSString *)sbName andTitle:(NSString *)title andImageName:(NSString *)imageName {
    
    // 加载指定名称的sb
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    // 实例化sb中箭头所指定的控制器
    UIViewController *vc = [sb instantiateInitialViewController];
    
    // 返回导航控制器"导航控制器中又添加了一个根控制器"
    return [self setupWithViewController:vc andTitle:title andImageName:imageName];
}


/**
 返回一个导航控制器
 
 @param vc        要设置内容的普通的子控制器
 @param title     控制器的标题
 @param imageName 标签栏上显示的图片
 */
- (UIViewController *)setupWithViewController:(UIViewController *)vc andTitle:(NSString *)title andImageName:(NSString *)imageName {
    
    // 设置控制器的标题会影响它的导航条或标签栏上的标题
    vc.title = title;
    
    // 设置默认状态的图片
    vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 拼接选中状态的图片
    NSString *selectedImageName = [imageName stringByAppendingString:@"_r"];
    
    // 设置选中图片
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 创建导航控制器
    AXFNavigationController *nav = [[AXFNavigationController alloc] initWithRootViewController:vc];
    
    return nav;
}


/**
 什么时候用frame什么时候用AutoLayout
 如果一个控件它是全屏的就直接写frame
 如果是一个小控件,不是全屏的最好用AutoLayout去约束它的位置和尺寸
 */
#pragma mark - 添加新特性界面
- (void)addGuideView {
    
    // 1.实例化界面
    AXFGuideView *guideView = [[AXFGuideView alloc] initWithFrame:self.view.bounds];
    
    // 2.传递数据
    guideView.imageNames = [self loadImageNames];
    // 3.把新特性界面添加到控制器根视图上
    [self.view addSubview:guideView];
}

- (NSArray *)loadImageNames {
    // Capacity 容量
    // 创建可变数组的同时就分配好空间
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:KImageCount];
    
    // 循环拼接图片名称
    for (NSInteger i = 0; i < KImageCount; i++) {
        NSString *imageName = [NSString stringWithFormat:@"guide_35_%ld", i + 1];
        // 添加图片名称
        [arrM addObject:imageName];
    }
    return arrM.copy;
}

@end
