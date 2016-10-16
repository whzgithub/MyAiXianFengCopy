//
//  AXFLocationController.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/16.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFLocationController.h"
#import "AXFLocationManager.h"
@interface AXFLocationController ()

/** 用户位置信息 */
@property (weak, nonatomic)  UILabel *userLocationInfo;

@end

@implementation AXFLocationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    self.userLocationInfo setn
}

//开启定位
- (void)startLocation:(UIButton *)sender {
    [[AXFLocationManager sharedAXFLocationManager] getCurrentLocation:^(CLLocation *location, CLPlacemark *placeMark, NSString *error) {
        if (error) {
            NSLog(@"定位出错,错误信息:%@",error);
        }else{
            NSLog(@"定位成功:经度:%f 纬度:%lf 当前地址:%@  \n location详细信息:%@ \n ",location.coordinate.latitude, location.coordinate.longitude, placeMark.name, location);
            [self.userLocationInfo setText:[NSString stringWithFormat:@"定位成功:经度:%f 纬度:%lf 当前地址:%@  \n location详细信息:%@ \n ",location.coordinate.latitude, location.coordinate.longitude, placeMark.name, location]];
        }
    } onViewController:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
