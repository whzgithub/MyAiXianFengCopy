//
//  AXFSlideFlowLayout.m
//  AiXianFeng
//
//  Created by Apple on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFSlideFlowLayout.h"

@implementation AXFSlideFlowLayout

- (void)prepareLayout {
    [super prepareLayout];

    // 设置最小列和行间距
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 1;
    self.itemSize = CGSizeMake(100, self.collectionView.bounds.size.height);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

@end
