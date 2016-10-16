//
//  AXFCategoriesModel.m
//  AiXianFeng
//
//  Created by Apple on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFCategoriesModel.h"

@implementation AXFCategoriesModel

/// 针对数组类型字段处理
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper;
{
    NSDictionary *dic=@{@"foodId" :@"id",
                        };
    return dic;
}

@end
