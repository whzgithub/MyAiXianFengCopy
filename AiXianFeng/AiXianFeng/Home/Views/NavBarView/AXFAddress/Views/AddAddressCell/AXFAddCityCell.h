//
//  AXFAddCityCell.h
//  AiXianFeng
//
//  Created by 美琳 on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AXFAddCityCell;
@protocol AXFAddCityCellDelegate <NSObject>

@optional
- (void)addCityCell:(AXFAddCityCell*)addCityCell textField: (UITextField *)textField;

@end

@interface AXFAddCityCell : UITableViewCell
@property(nonatomic,copy)NSString *cityName;
@property(nonatomic,weak)id<AXFAddCityCellDelegate>delegate;



@end
