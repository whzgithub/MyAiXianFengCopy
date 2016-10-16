//
//  AXFact_infoModel.m
//  AiXianFeng
//
//  Created by Apple on 16/10/12.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFact_infoModel.h"
#import "AXFact_rowsModel.h"
@implementation AXFact_infoModel

+(nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    
    return @{
             @"act_rows" : AXFact_rowsModel.class,
             };
}

//{
//    "name" : "Happy Birthday",
//    "photos" : [
//    {
//    "url":"http://example.com/1.png",
//    "desc":"Happy~"
//    },
//    {
//    "url":"http://example.com/2.png",
//    "desc":"Yeah!"
//    }
//               ],
//    "likedUsers" : {
//    "Jony" : {"uid":10001,"name":"Jony"},
//    "Anna" : {"uid":10002,"name":"Anna"}
//    },
//    "likedUserIds" : [10001,10002]
//    }"];
//}
//- (void)setValue:(id)value forKey:(NSString *)key {
//
//    [super setValue:value forKey:key];
//
//    // 单独处理处理spus对应的信息 -> 转为菜品模型数组!
//    if ([key isEqualToString:@"act_rows"]) {
//
//        // 1.类型转换
//        NSArray<NSDictionary *> *dictFoodArr = (NSArray *)value;
//
//        // 2.遍历转模型
//        NSMutableArray<AXFact_rowsModel *> *tempArrM = [NSMutableArray array];
//        
//        [dictFoodArr enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            
//            AXFact_rowsModel *foodModel = [[AXFact_rowsModel alloc] init];
//            
//            [foodModel setValuesForKeysWithDictionary:obj];
//            
//            [tempArrM addObject:foodModel];
//            
//        }];
//        
//        [super setValue:tempArrM forKey:key];
//    }
//    
//}
//
//// 重写此方法,避免崩溃!
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

@end
