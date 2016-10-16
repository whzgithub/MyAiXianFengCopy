//
//  AXFIDModel.h
//  AiXianFeng
//
//  Created by Apple on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AXFIDModel : NSObject

//商品名
@property(nonatomic,copy)NSString *name;
//规格
@property(nonatomic,copy)NSString *specifics;
//出厂价格
@property(nonatomic,copy)NSString *market_price;
//打折价格
@property(nonatomic,copy)NSString *partner_price;
//图片
@property(nonatomic,copy)NSString *img;
//超市商品数量（cell复用bug修复）
@property(nonatomic,assign)NSInteger labelNum;

@end
