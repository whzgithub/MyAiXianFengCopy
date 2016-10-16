//
//  AXFFoodGoodsModel.h
//  AiXianFeng
//
//  Created by whz on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AXFFoodGoodsModel : NSObject

/// cell 显示的商品名字
@property(nonatomic, copy)NSString *name;
/// cell 显示的商品图片
@property(nonatomic, copy)NSString *img;
/// cell 显示的商品跳转后的内容图片
@property(nonatomic, copy)NSString *app_mimg;
/// cell 显示的商品重量
@property(nonatomic, copy)NSString *specifics;
/// cell 显示的商品跳转后的品牌名
@property(nonatomic, copy)NSString *brand_name;
/// cell 显示的商品原价
@property(nonatomic, copy)NSString *market_price;
/// cell 显示的商品现价
@property(nonatomic, copy)NSString *partner_price;
/// cell 显示的商品类型
@property(nonatomic, assign)BOOL goods_type;


@end
