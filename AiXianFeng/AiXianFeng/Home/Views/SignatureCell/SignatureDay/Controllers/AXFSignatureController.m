//
//  AXFSignatureController.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFSignatureController.h"
#import <Masonry.h>
#import "AXFSignatureBottomView.h"
#import "AXFSignatureTopView.h"

@interface AXFSignatureController ()<AXFSignatureTopViewDelegate>

@property(nonatomic,strong)UIView *topView;

@end

@implementation AXFSignatureController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
//    self.topView.wasSelected = NO
}
- (void)setupUI
{
    self.navigationItem.title= @"每日签到";
    //创建上面的UIView
    AXFSignatureTopView *topView = [[AXFSignatureTopView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height *0.4)];
    topView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:topView];
    topView.delegate = self;
    self.topView = topView;
    //创建下面的UIView
    AXFSignatureBottomView *bottomView = [[AXFSignatureBottomView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom);
    }];


}
- (void)signatureTopView:(AXFSignatureTopView *)signatureTopView 
{

}


@end
