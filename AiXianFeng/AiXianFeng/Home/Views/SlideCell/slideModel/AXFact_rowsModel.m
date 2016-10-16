//
//  AXFact_rowsModel.m
//  AiXianFeng
//
//  Created by Apple on 16/10/12.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFact_rowsModel.h"
#import "AXFActivityModel.h"

@implementation AXFact_rowsModel

- (void)setValue:(id)value forKey:(NSString *)key {
    
    [super setValue:value forKey:key];
    
    if ([key isEqualToString:@"activity"]) {

        // 1.类型转换
        NSDictionary *dictActivity = (NSDictionary *)value;
        
        AXFActivityModel *ActivityModel = [[AXFActivityModel alloc] init];
        
        [ActivityModel setValuesForKeysWithDictionary:dictActivity];
        
        [super setValue:ActivityModel forKey:key];
    }
    
}

// 重写此方法,避免崩溃!
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}


@end
