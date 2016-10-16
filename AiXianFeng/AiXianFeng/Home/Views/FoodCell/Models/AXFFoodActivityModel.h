//
//  AXFFoodActivityModel.h
//  AiXianFeng
//
//  Created by whz on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXFFoodExtParams.h"

@interface AXFFoodActivityModel : NSObject

/// cell显示的顶部图片url
@property(nonatomic, copy)NSString *img;
/// cell显示的顶部图片点击跳转后的标题名
@property(nonatomic, copy)NSString *name;
/// cell显示的顶部图片点击跳转后的标题图片
@property(nonatomic, copy)NSString *topimg;
/// ext_params 字典字段
@property(nonatomic, strong)AXFFoodExtParams *ext_params;

@end
