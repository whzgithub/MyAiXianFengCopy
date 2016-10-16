//
//  AXFMarketProductView.h
//  AiXianFeng
//
//  Created by whz on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AXFProductsModel.h"
#import "AXFMarketController.h"

@interface AXFMarketProductView : UIView

@property(nonatomic,strong)UITableView *productTableView;
@property(nonatomic,strong)AXFProductsModel *allIDModel;

-(void)marketController:(AXFMarketController *)AXFMarketController andModel:(AXFCategoriesModel *)model;

@end
