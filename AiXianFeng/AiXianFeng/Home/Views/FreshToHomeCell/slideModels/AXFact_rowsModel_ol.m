
//
//  AXFact_rowsModel.m
//  AiXianFeng
//
//  Created by mac on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//


#import "AXFact_rowsModel_ol.h"
#import "AXFact2_rowsModel.h"

@implementation AXFact_rowsModel_ol : NSObject

+(nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    
    return @{
             @"act_rows" : AXFact2_rowsModel.class,
             };
}

@end
