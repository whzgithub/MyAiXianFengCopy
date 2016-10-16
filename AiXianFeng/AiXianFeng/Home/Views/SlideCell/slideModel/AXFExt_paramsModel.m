//
//  AXFExt_paramsModel.m
//  AiXianFeng
//
//  Created by Apple on 16/10/12.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFExt_paramsModel.h"

@implementation AXFExt_paramsModel

- (void)setValue:(id)value forKey:(NSString *)key {
    
    [super setValue:value forKey:key];
    
}

// 防止崩溃!
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}


@end
