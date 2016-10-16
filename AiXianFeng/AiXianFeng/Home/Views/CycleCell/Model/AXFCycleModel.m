//
//  AXFCycleModel.m
//  AiXianFeng
//
//  Created by apple on 16/10/12.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFCycleModel.h"
#import "AXFCycleContentModel.h"
@implementation AXFCycleModel



- (void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    
    if ([key isEqualToString:@"ext_params"]) {
        
        
        NSDictionary* dict = _ext_params;
        
        AXFCycleContentModel* contentModel = [[AXFCycleContentModel alloc] init];
        
        [contentModel setValuesForKeysWithDictionary:dict];
        
        
        
    }

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}
@end
