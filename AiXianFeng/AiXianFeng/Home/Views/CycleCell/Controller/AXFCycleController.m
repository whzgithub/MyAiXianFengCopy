//
//  AXFCycleController.m
//  AiXianFeng
//
//  Created by apple on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFCycleController.h"

@interface AXFCycleController ()

@end

@implementation AXFCycleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UIWebView* webV = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:webV];
    
    // 创建网络请求
    NSURL *url=[NSURL URLWithString:@"http://www.beequick.cn/"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    // 伸缩内容适应屏幕尺寸
    webV.scalesPageToFit=YES;
    // 加载网络请求
    [webV loadRequest:request];
}





@end
