//
//  AXFCycleViewCell.h
//  AiXianFeng
//
//  Created by apple on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AXFCycleViewCell : UICollectionViewCell
// 传入cell的索引
@property (nonatomic, strong) NSIndexPath *indexPath;
// 用来接收所有的广告图片
@property (nonatomic, strong) NSArray *imagesList;

@end
