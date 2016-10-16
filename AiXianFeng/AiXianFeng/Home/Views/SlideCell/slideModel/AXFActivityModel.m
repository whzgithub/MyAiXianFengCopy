//
//  AXFActivityModel.m
//  AiXianFeng
//
//  Created by Apple on 16/10/12.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFActivityModel.h"
#import "AXFExt_paramsModel.h"

@implementation AXFActivityModel


- (void)setValue:(id)value forKey:(NSString *)key {
    
    [super setValue:value forKey:key];
    
    if ([key isEqualToString:@"ext_params"]) {
        
        // 1.类型转换
        NSDictionary *dictExt_params = (NSDictionary *)value;
        
        AXFExt_paramsModel *ext_paramsModel = [[AXFExt_paramsModel alloc] init];
        
        [ext_paramsModel setValuesForKeysWithDictionary:dictExt_params];
        
        [super setValue:ext_paramsModel forKey:key];
    }
    
}

// 重写此方法,避免崩溃!
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

@end
