//
//  AXFSignatureCell.h
//  AiXianFeng
//
//  Created by Long on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//


#import <UIKit/UIKit.h>

@class AXFSignatureCell;

//定义区分按钮的枚举
typedef enum :NSInteger
{
    AXFSignatureBtnNum1,
    AXFSignatureBtnNum2,
    AXFSignatureBtnNum3,
    AXFSignatureBtnNum4
}AXFSignatureBtn;

//声明协议
@protocol AXFSignatureCellDelegate <NSObject>

@optional
- (void)signatureCell:(AXFSignatureCell *)signatureCell andBtnNum:(AXFSignatureBtn)btnNum;

@end
@interface AXFSignatureCell : UITableViewCell
//定义代理属性
@property(nonatomic,weak)id<AXFSignatureCellDelegate>delegate;
@property(nonatomic,copy) NSDictionary *dict;
//@property(nonatomic,strong)AXFSignatureModel *signatureModel;
@property(nonatomic,strong) NSArray *model;

@end
