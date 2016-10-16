//
//  AXFSlideCell.h
//  AiXianFeng
//
//  Created by Long on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AXFActivityModel.h"
#import "AXFact_rowsModel.h"
@class AXFSlideCell;
@protocol AXFSlideCellDelegate <NSObject>

-(void)slideCell:(AXFSlideCell *)slideCell andActivityModel:(AXFActivityModel *)activityModel;


@end
@interface AXFSlideCell : UITableViewCell

// 定义接收slide图片地址的数组
@property(nonatomic,strong)NSArray<AXFact_rowsModel *> *imageList;
@property(nonatomic,weak)id<AXFSlideCellDelegate>delegate;
@end
