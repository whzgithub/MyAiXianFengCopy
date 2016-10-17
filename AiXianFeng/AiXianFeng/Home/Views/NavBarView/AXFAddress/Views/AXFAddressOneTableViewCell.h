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
//姓名
@property(nonatomic,copy)NSString *name;
//电话
@property(nonatomic,copy) NSString *phoneNum;
//地址
@property(nonatomic,copy)NSString *detail;


@end
