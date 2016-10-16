//
//  AXFCategoriesDataModel.m
//  AiXianFeng
//
//  Created by Apple on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFCategoriesDataModel.h"
#import "AXFCategoriesModel.h"

@implementation AXFCategoriesDataModel

/// 针对数组类型的字段处理
+(nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    
    return @{
             @"categories" : AXFCategoriesModel.class,
             };
}

@end
