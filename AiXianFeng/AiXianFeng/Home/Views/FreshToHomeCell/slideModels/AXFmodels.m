
//
//  AXFmodels.m
//  AiXianFeng
//
//  Created by mac on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFmodels.h"
#import "AXFact_rowsModel_ol.h"
@implementation AXFmodels


+(nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    
    return @{
             @"act_rows" : AXFact_rowsModel_ol.class,
             };
}



@end
