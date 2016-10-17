//
//  AXFCartController.h
//  AiXianFeng
//
//  Created by mac on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AXFIDModel;
@interface AXFCartController : UIViewController
///  接收购物车的数据
@property (nonatomic, strong)NSMutableArray <AXFIDModel*>* marketmodel;
@end
