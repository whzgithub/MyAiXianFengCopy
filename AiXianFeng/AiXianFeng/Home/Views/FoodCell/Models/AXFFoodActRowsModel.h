//
//  AXFFoodActivityModel.h
//  AiXianFeng
//
//  Created by whz on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXFFoodActivityModel.h"
#import "AXFFoodCategoryDetailModel.h"

@interface AXFFoodActRowsModel : NSObject

/// activity 字典字段
@property(nonatomic, strong)AXFFoodActivityModel *activity;

/// activity 字典字段
@property(nonatomic, strong)AXFFoodCategoryDetailModel *category_detail;

@end
