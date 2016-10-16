//
//  AXFMarketCategoryCell.h
//  AiXianFeng
//
//  Created by whz on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AXFCategoriesModel.h"

@interface AXFMarketCategoryCell : UITableViewCell

// categories 模型
@property(nonatomic,strong)AXFCategoriesModel *model;
/// 选中categoryCell
- (void) selectCell;
/// 取消选中categoryCell
- (void) unselectCell;

@end
