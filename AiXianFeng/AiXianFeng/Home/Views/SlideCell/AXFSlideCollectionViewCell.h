//
//  AXFSlideCollectionViewCell.h
//  AiXianFeng
//
//  Created by Apple on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AXFActivityModel.h"
@class AXFSlideCollectionViewCell;
@protocol AXFSlideCollectionViewCellDelegate <NSObject>

-(void)slideCollectionViewCell:(AXFSlideCollectionViewCell *)cell andActivityModel:(AXFActivityModel *)activityModel;

@end
@interface AXFSlideCollectionViewCell : UICollectionViewCell

// 图片地址属性
@property(nonatomic,strong)AXFActivityModel *activityModel;
@property(nonatomic,weak)id<AXFSlideCollectionViewCellDelegate>delegate;
@end
