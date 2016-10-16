//
//  AXFFoodCell.h
//  AiXianFeng
//
//  Created by Long on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AXFFoodActInfoModel.h"

@interface AXFFoodCell : UITableViewCell

@property(nonatomic, strong)AXFFoodActInfoModel *actInfoModel;

/// 保存每组返回的数据下标
@property(nonatomic, assign)NSInteger indexForRow;


@end
