//
//  AXFFoodCategoryDetailModel.m
//  AiXianFeng
//
//  Created by whz on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFFoodCategoryDetailModel.h"
#import "AXFFoodGoodsModel.h"
#import "YYmodel.h"

@implementation AXFFoodCategoryDetailModel

+ (nullable NSDictionary<NSString *, id> *) modelContainerPropertyGenericClass {

    return @{
             @"goods" : AXFFoodGoodsModel.class
             };
}

@end
