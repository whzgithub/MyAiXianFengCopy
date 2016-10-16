//
//  AXFFoodActRowsModel.m
//  AiXianFeng
//
//  Created by whz on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFFoodActInfoModel.h"
#import "AXFFoodActRowsModel.h"
#import "YYModel.h"

@implementation AXFFoodActInfoModel

/// 如果字段是数组，必须按照一下规定模式实现这个类方法
+(nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    
    return @{
             @"act_rows" : AXFFoodActRowsModel.class,
             };
}

@end
