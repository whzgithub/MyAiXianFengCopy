//
//  AXFMyListView.h
//  AiXianFeng
//
//  Created by apple on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AXFMyListView : UIControl
// 接收需要偏移的量
@property (nonatomic, assign) CGFloat offset_X;

// 需要滚动到的页码
@property (nonatomic, assign) NSUInteger pageNumber;

@end
