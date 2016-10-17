//
//  AXFAddAddressController.h
//  AiXianFeng
//
//  Created by 美琳 on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AXFAddAddressController : UITableViewController<UIPickerViewDelegate, UIPickerViewDataSource>
//{
//    UIButton *addressBtn;
//    NSArray *provinceArray;//省的数组
//    NSArray *cityArray;//市的数组
//    NSArray *districtArray;//区的数组
//    
//    
//    NSString *provinceStr;//省的名字
//    NSString *provinceId;//省id
//    NSString *cityStr;//市的名字
//    NSString *districtStr;//区的名字
//    
//    
//    NSMutableDictionary *cityDic ;
//    NSMutableDictionary *districtDic;
//    
//    UIView *baseView;
//    UIView *_pickerView;
//    
//    UIPickerView *picker;
//}
//定义block
@property(nonatomic,copy)void(^addAddressClick)(NSString*name, NSString *phoneNum,NSString *cityName,NSString *pretureName,NSString *detail);
@end
