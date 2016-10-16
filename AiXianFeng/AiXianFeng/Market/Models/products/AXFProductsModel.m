//
//  AXFProductsModel.m
//  AiXianFeng
//
//  Created by Apple on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFProductsModel.h"
#import "AXFIDModel.h"

@implementation AXFProductsModel

/// 针对数字类型的数组字段处理（需要将数字类型转成对象）
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper
{
    
    return @{@"a" : @"103532",
             @"b" : @"103536",
             @"c" : @"103541",
             @"d" : @"103548",
             @"e" : @"103549",
             @"f" : @"103557",
             @"g" : @"103565",
             @"h" : @"103569",
             @"i" : @"103575",
             @"j" : @"103581",
             @"k" : @"104747",
             @"l" : @"104749",
             };
}

/// 针对数组类型转换后的字段处理
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"a" : AXFIDModel.class,
             @"b" : AXFIDModel.class,
             @"c" : AXFIDModel.class,
             @"d" : AXFIDModel.class,
             @"e" : AXFIDModel.class,
             @"f" : AXFIDModel.class,
             @"g" : AXFIDModel.class,
             @"h" : AXFIDModel.class,
             @"i" : AXFIDModel.class,
             @"j" : AXFIDModel.class,
             @"k" : AXFIDModel.class,
             @"l" : AXFIDModel.class,

             
             };
}
@end
