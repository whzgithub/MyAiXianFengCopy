//
//  AXFCategoriesDataModel.h
//  AiXianFeng
//
//  Created by Apple on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXFCategoriesModel.h"
#import "AXFProductsModel.h"

@interface AXFCategoriesDataModel : NSObject

/// categories 数组字段
@property(nonatomic,strong)NSArray<AXFCategoriesModel *> *categories;
/// products 字典字段
@property(nonatomic,strong)AXFProductsModel *products;

@end
