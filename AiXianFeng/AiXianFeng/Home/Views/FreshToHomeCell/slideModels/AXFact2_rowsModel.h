//
//  AXFact2_rowsModel.h
//  AiXianFeng
//
//  Created by mac on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXFcgoods_detailModel.h"

@interface AXFact2_rowsModel : NSObject
@property (nonatomic,copy) NSString* sort;
@property (nonatomic, strong) AXFcgoods_detailModel* cgoods_detail;
@end
