//
//  AXFVipTableViewCell.h
//  AiXianFeng
//
//  Created by apple on 16/10/16.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AXFVipTableViewCell : UITableViewCell
// 图片
@property (weak, nonatomic) IBOutlet UIImageView *img;
// 标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
// 内容
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@end
