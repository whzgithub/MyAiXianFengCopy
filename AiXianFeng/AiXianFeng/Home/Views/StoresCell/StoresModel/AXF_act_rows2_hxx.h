//
//  AXF_act_rows2_hxx.h
//  AiXianFeng
//
//  Created by Long on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXF_chead_detail_hxx.h"
#import "AXF_cactivity_detail_hxx.h"
#import "AXF_cicons_detail_hxx.h"
#import "AXF_cscene_detail_hxx.h"

@interface AXF_act_rows2_hxx : NSObject

@property(nonatomic, copy) NSString  *sort;

//chead_detail 字典字段
@property(nonatomic, strong) AXF_chead_detail_hxx  *chead_detail;
//chead_detail 字典字段
@property(nonatomic, strong)AXF_cactivity_detail_hxx *cactivity_detail;
//chead_detail 字典字段
@property(nonatomic, strong)AXF_cicons_detail_hxx *cicons_detail;
//chead_detail 字典字段
@property(nonatomic, strong)AXF_cscene_detail_hxx *cscene_detail;

@end
