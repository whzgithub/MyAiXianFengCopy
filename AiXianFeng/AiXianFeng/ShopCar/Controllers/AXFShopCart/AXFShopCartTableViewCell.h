//
//  AXFShopCartTableViewCell.h
//  AiXianFeng
//
//  Created by mac on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AXFShopCartModel.h"
#import "Masonry.h"
#import "AXFIDModel.h"


@interface AXFShopCartTableViewCell : UITableViewCell


@property(nonatomic,strong)AXFIDModel *model;
@property(nonatomic,copy)void(^addClick)(UIButton *btn);
@property(nonatomic,copy)void(^cutClick)(UIButton *btn);
@property(nonatomic,copy)void(^selectClick)(CGFloat OneSum);
@property(nonatomic,copy)void(^deleteClick)(CGFloat OneSum);

//选中按钮
@property (nonatomic,strong) UIButton *selectBtn;

@end
