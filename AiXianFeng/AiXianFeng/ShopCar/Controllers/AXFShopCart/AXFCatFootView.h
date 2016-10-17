//
//  AXFFootView.h
//  AiXianFeng
//
//  Created by mac on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AXFCatFootView,AXFIDModel;
@protocol AXFCatFootViewDelegate <NSObject>

@end
@interface AXFCatFootView : UIControl

@property(nonatomic,assign)CGFloat sum;

@property(nonatomic,strong)NSArray<AXFIDModel *>* modelList;

@end
