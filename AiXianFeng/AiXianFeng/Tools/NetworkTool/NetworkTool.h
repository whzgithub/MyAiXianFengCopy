//
//  NetworkTool.h
//  网易新闻
//
//  Created by HM on 16/10/6.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NetworkTool : AFHTTPSessionManager

/// 单例的全局访问点
+ (instancetype)sharedTool;

/**
 封装的网络请求工具类的GET方法
 
 @param URLString  请求的地址
 @param parameters 请求的参数
 @param success    成功的回调
 @param failed     失败的回调
 */
- (void)GETWithURLString:(NSString *)URLString parameters:(id)parameters success:(void(^)(id responseObject))success failed:(void(^)(NSError *error))failed;

@end
