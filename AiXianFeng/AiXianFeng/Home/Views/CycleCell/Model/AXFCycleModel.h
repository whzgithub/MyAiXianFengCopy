//
//  AXFCycleModel.h
//  AiXianFeng
//
//  Created by apple on 16/10/12.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AXFCycleModel : NSObject
//轮播图片
@property(nonatomic,copy) NSString* img;
@property(nonatomic,copy) NSString* name;
@property(nonatomic,copy) NSDictionary* ext_params;
@property(nonatomic,copy) NSString* trackid;

@end
