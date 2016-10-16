//
//  AXFActivityModel.h
//  AiXianFeng
//
//  Created by Apple on 16/10/12.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXFExt_paramsModel.h"

@interface AXFActivityModel : NSObject

@property (nonatomic, copy) NSString *img;
@property (nonatomic, strong) AXFExt_paramsModel *ext_params;
@end
