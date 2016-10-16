//
//  AXFStroesModels.m
//  AiXianFeng
//
//  Created by 何香绪 on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFStroesModels.h"
#import "AXF_act_rows_hxx.h"

@implementation AXFStroesModels
+(nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    
    return @{
             @"act_rows" : AXF_act_rows_hxx.class,
             };
}
@end
