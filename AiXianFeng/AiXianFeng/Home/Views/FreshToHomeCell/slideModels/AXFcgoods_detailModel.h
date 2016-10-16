//
//  AXFcgoods_detailModel.h
//  AiXianFeng
//
//  Created by mac on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXFgoodsModel.h"
@interface AXFcgoods_detailModel : NSObject
@property (nonatomic, strong) NSArray<AXFgoodsModel*>* goods;
/// 第三张图片更多图片
@property (nonatomic, copy) NSString* img;
@end
