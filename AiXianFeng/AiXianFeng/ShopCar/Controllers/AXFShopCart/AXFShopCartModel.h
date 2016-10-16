//
//  AXFShopCartModel.h
//  AiXianFeng
//
//  Created by mac on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

/**
 *  @author LQQ, 16-01-08 19:01:03
 *
 *  购物车商品模型
 *
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AXFShopCartModel : NSObject
///精选
@property (nonatomic,copy) NSString *JsStr_ol;
/// 商品名称
@property (nonatomic,copy) NSString *nameStr_ol;
///数量显示属性
@property (nonatomic,assign) NSInteger number_ol;
///价格
@property (nonatomic,copy) NSString *price_ol;
/// 图片的名称
@property (nonatomic,copy)NSString *image_ol;
/// 选中
@property (nonatomic,assign) BOOL isSelect_ol;
///按钮的点击数量        
@property (nonatomic, assign) NSUInteger* selestbtnnum;
@end
