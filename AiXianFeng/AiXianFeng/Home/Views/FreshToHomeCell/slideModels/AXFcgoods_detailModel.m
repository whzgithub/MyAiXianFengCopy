//
//  AXFcgoods_detailModel.m
//  AiXianFeng
//
//  Created by mac on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFcgoods_detailModel.h"
#import "AXFgoodsModel.h"
@implementation AXFcgoods_detailModel
+(nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    
    return @{
             @"goods" : AXFgoodsModel.class,
             };
}

@end
