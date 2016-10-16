//
//  AXFAddressOneTableViewCell.h
//  AiXianFeng
//
//  Created by 美琳 on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AXFAddressOneTableViewCell;

@protocol AXFAddressOneTableViewCellDelegate <NSObject>

@optional
//- (void)signatureCell:(AXFSignatureCell *)signatureCell
- (void)addressOneTabelViewCell:(AXFAddressOneTableViewCell *)addressOneTableViewCell;

@end

@interface AXFAddressOneTableViewCell : UITableViewCell
@property(nonatomic,weak)id<AXFAddressOneTableViewCellDelegate>delegate;

@end
