//
//  AXFAddressOneCell.h
//  AiXianFeng
//
//  Created by 美琳 on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AXFAddressOneCell;
@protocol AXFAddressOneCellDelegate <NSObject>

@optional
- (void)addressOneCell:(AXFAddressOneCell *)cell;


@end

@interface AXFAddressOneCell : UITableViewCell
@property (nonatomic, weak) id <AXFAddressOneCellDelegate>delegate;


@end
