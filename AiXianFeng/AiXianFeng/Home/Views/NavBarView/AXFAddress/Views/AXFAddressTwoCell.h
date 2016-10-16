//
//  AXFAddressTwoCell.h
//  AiXianFeng
//
//  Created by 美琳 on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AXFAddressTwoCell;
@protocol AXFAddressTwoCellDelegate <NSObject>

@optional
- (void)addressTwoCell :(AXFAddressTwoCell *)addressTwoCell;

@end

@interface AXFAddressTwoCell : UITableViewCell

@property(nonatomic,weak)id<AXFAddressTwoCellDelegate>delegate;
@end
