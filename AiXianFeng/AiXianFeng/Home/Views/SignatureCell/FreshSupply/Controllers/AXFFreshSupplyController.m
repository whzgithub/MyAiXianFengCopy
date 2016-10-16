//
//  AXFFreshSupplyController.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/12.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFFreshSupplyController.h"

#define URL @"http://m.beequick.cn/show/active?id=21749&locationHash=43d28ftYMir7WSorsc8YwqjPTQYXH7EN40bxedhSR3scK4m8ogjZfJGv+b&zchtid=12140&location_time=1476543968&cityid=2&bigids=2%2C0&hide_cart=0&trackid=icon1%7C21749&show_reload=1&activitygroup=xianhuozhigong&name=%E9%B2%9C%E8%B4%A7%E7%9B%B4%E4%BE%9B&zchtauth=5c5c82AtH17ATeYubCOFaxrhlFzvjtx4NwDCzR%252BPp4pz7835U&__v=ios5.8&__d=d14ryS1fQUolKedjqvAvQD755g6rBvsFxgw3aFMYlvRGa5Tr85M5HpHJlnwAZPd5UyoGAl9WrRnngyf7VNPSZRvw3fmfnrrGjEtg%2F%2FKqimLd4IS8aQuY%2FZjbqBMrx14eK17f&timestamp=1476560491070726&token=6e87d5a65097b2eb64aa657ea039f109&mac=8f03217cc0735ea1ab338a020d59e517"

@interface AXFFreshSupplyController ()

@end

@implementation AXFFreshSupplyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航条
    [self setNavigationBar];
    // 1. 创建webView, 展示京东首页
    UIWebView *homeWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    // 根据屏幕大小自动调整页面尺寸
    homeWebView.scalesPageToFit = YES;
    
    [self.view addSubview:homeWebView];
    
    // 2. 设置请求URL
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URL]];
    
    // 加载页面
    [homeWebView loadRequest:request];

}


#pragma mark - 设置导航条的方法
- (void)setNavigationBar
{
self.navigationItem.title = @"鲜货直供";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshData1)];
//    self.navigationItem.rightBarButtonItem.tintColor = [UIColor grayColor];
}

//导航条右侧刷新按钮的刷新方法
- (void)refreshData1
{
//    [self refreshData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
