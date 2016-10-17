//
//  AXF_act_rows_hxx.m
//  AiXianFeng
//
//  Created by Long on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXF_act_rows_hxx.h"
#import "AXF_act_rows2_hxx.h"

@implementation AXF_act_rows_hxx

+(nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    
    return @{
             @"act_rows" : AXF_act_rows2_hxx.class,
             };
}
@end
