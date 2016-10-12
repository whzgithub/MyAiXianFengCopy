//
//  AXFCycleFlowLayout.m
//  AiXianFeng
//
//  Created by apple on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFCycleFlowLayout.h"

@implementation AXFCycleFlowLayout
- (void)prepareLayout {
    [super prepareLayout];
    
    self.itemSize = self.collectionView.bounds.size;
    // 设置水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    
    
}
@end
