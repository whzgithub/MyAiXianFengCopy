//
//  AXFProductsModel.h
//  AiXianFeng
//
//  Created by Apple on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//  

#import <Foundation/Foundation.h>

@class AXFIDModel;

@interface AXFProductsModel : NSObject

/**
 针对数字类型的字段处理（转字符串）
 @"a" : @"103532",
 @"b" : @"103536",
 @"c" : @"103541",
 @"d" : @"103548",
 @"e" : @"103549",
 @"f" : @"103557",
 @"g" : @"103565",
 @"h" : @"103569",
 @"i" : @"103575",
 @"j" : @"103581",
 @"k" : @"104747",
 @"l" : @"104749",
 */
@property(nonatomic,strong)NSMutableArray<AXFIDModel *> *a;
@property(nonatomic,strong)NSMutableArray<AXFIDModel *> *b;
@property(nonatomic,strong)NSMutableArray<AXFIDModel *> *c;
@property(nonatomic,strong)NSMutableArray<AXFIDModel *> *d;
@property(nonatomic,strong)NSMutableArray<AXFIDModel *> *e;
@property(nonatomic,strong)NSMutableArray<AXFIDModel *> *f;
@property(nonatomic,strong)NSMutableArray<AXFIDModel *> *g;
@property(nonatomic,strong)NSMutableArray<AXFIDModel *> *h;
@property(nonatomic,strong)NSMutableArray<AXFIDModel *> *i;
@property(nonatomic,strong)NSMutableArray<AXFIDModel *> *j;
@property(nonatomic,strong)NSMutableArray<AXFIDModel *> *k;
@property(nonatomic,strong)NSMutableArray<AXFIDModel *> *l;

@end
