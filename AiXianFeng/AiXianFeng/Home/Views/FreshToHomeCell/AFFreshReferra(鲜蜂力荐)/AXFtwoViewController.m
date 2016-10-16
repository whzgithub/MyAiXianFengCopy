//
//  AXFtwoViewController.m
//  AiXianFeng
//
//  Created by mac on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFtwoViewController.h"

@interface AXFtwoViewController ()
@property (nonatomic, weak) UIWebView* webView;
@end

@implementation AXFtwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"新鲜预定-更多商品";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"v2_refresh"] style:UIBarButtonItemStylePlain target:self action:@selector(btnClickSuaXin:)];
    
    [self setupUI];
    
    //加载数据
    [self loadData];
    
}

#pragma 创建控件
- (void)setupUI{
    
    UIWebView* weB = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:weB];
    self.webView = weB;
    
}


#pragma 加载数据
- (void)loadData{
    
    // 1.URL
    NSURL *URL = [NSURL URLWithString:@"http://weibo.com/login.php"];
    //设置 可变,且可以设置额外请求信息
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL cachePolicy:0 timeoutInterval:15.0];
    [request setValue:@"iphone AppleWebKit" forHTTPHeaderField:@"User-Agent"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        // 4.处理响应
        if (connectionError == nil && data != nil) {
            
            NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            // 要回到主线程
            [self.webView loadHTMLString:html baseURL:URL];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma 点击界面
- (void)btnClickSuaXin:(NSString*)tab{
    
}
@end
