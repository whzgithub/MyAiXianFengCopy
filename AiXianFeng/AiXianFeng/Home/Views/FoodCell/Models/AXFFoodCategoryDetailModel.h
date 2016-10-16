//
//  AXFFoodCategoryDetailModel.h
//  AiXianFeng
//
//  Created by whz on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXFFoodGoodsModel.h"

@interface AXFFoodCategoryDetailModel : NSObject

/// cell显示的标题
@property(nonatomic, copy)NSString *name;
/// cell显示的category_color颜色
@property(nonatomic, copy)NSString *category_color;
/// goods 数组字段
@property(nonatomic, strong)NSArray<AXFFoodGoodsModel *> *goods;

@end
