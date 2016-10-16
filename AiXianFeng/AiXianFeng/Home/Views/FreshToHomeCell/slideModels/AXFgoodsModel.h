//
//  AXFgoodsModel.h
//  AiXianFeng
//
//  Created by mac on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AXFgoodsModel : NSObject
///产品 名称
@property (nonatomic, copy) NSString* name;
/// 容量
@property (nonatomic, copy) NSString* specifics;
/// 价格
@property (nonatomic, copy) NSString* partner_price;
/// 图片链接
@property (nonatomic, copy) NSString* img;
@end

