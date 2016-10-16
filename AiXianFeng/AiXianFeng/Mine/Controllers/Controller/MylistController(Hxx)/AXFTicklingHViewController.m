//
//  AXFTicklingHViewController.m
//  AiXianFeng
//
//  Created by 何香绪 on 16/10/16.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFTicklingHViewController.h"

@interface AXFTicklingHViewController ()

@end

@implementation AXFTicklingHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"客服/反馈";
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self setupUI];
    
}


-(void)setupUI
{
    //在线客服
    
    UIView *view1 = [[UIView alloc]init];
    
    [self.view addSubview:view1];
    view1.backgroundColor = [UIColor whiteColor];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(10);
        make.left.right.equalTo(self.view);
        make.height.offset(60);
        
    }];
    
    //在线客服头像
    UIButton *btn1 =[[UIButton alloc]init];
    [view1 addSubview:btn1];
    btn1.backgroundColor = [UIColor blueColor];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"H103"] forState:UIControlStateNormal];
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view1).offset(6);
        make.left.equalTo(view1).offset(6);
        make.width.offset(60);
        make.bottom.equalTo(view1).offset(-6);
        
    }];
    
    
    // 箭头按钮
    UIButton *btn2 = [[UIButton alloc]init];
    [view1 addSubview:btn2];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"icon_go"] forState:UIControlStateNormal];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view1).offset(25);
        make.right.equalTo(view1).offset(-10);
        
        
    }];
    
    UILabel *nameL = [[UILabel alloc]init];
    nameL.text = @"在线客服";
    nameL.font = [UIFont systemFontOfSize:14];
    nameL.textColor = [UIColor blackColor];
    [view1 addSubview:nameL];
    
    
    [nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(btn1.mas_right).offset(10);
        make.top.equalTo(view1).offset(10);
        make.right.equalTo(btn2);
        
    }];
    
    
    UILabel *nameB = [[UILabel alloc]init];
    nameB.text = @"只有半夜服务哦😏";
    nameB.font = [UIFont systemFontOfSize:12];
    nameB.textColor = [UIColor lightGrayColor];
    [view1 addSubview:nameB];
    
    
    [nameB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(nameL);
        make.top.equalTo(nameL.mas_bottom).offset(5);
        
        
    }];
    
    //创建下面的界面view
    
    UIView *view2 = [[UIView alloc]init];
    
    [self.view addSubview:view2];
    view2.backgroundColor = [UIColor whiteColor];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view1.mas_bottom).offset(10);
        make.left.right.equalTo(self.view);
        make.height.offset(180);
        
    }];
    
    //创建意见反馈
    UIButton *btnY =[[UIButton alloc]init];
    [view2 addSubview:btnY];
    [btnY setBackgroundImage:[UIImage imageNamed:@"H110"] forState:UIControlStateNormal];
    
    
    [btnY mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view2).offset(10);
        make.left.equalTo(view2).offset(10);
        
        
    }];
    
    
    // 箭头按钮
    UIButton *btnJ = [[UIButton alloc]init];
    [view2 addSubview:btnJ];
    [btnJ setBackgroundImage:[UIImage imageNamed:@"icon_go"] forState:UIControlStateNormal];
    [btnJ mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view2).offset(25);
        make.right.equalTo(view2).offset(-10);
        
        
    }];
    
    //意见反馈文字
    UILabel *nameQ = [[UILabel alloc]init];
    nameQ.text = @"意见反馈";
    nameQ.font = [UIFont systemFontOfSize:14];
    nameQ.textColor = [UIColor blackColor];
    [view2 addSubview:nameQ];
    
    
    [nameQ mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(btnY.mas_right).offset(10);
        make.top.equalTo(view2).offset(10);
        make.right.equalTo(btnJ);
        
    }];
    
    
    UILabel *nameQ2= [[UILabel alloc]init];
    nameQ2.text = @"1-2个工作日内反馈";
    nameQ2.font = [UIFont systemFontOfSize:12];
    nameQ2.textColor = [UIColor lightGrayColor];
    [view2 addSubview:nameQ2];
    
    
    [nameQ2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(nameQ);
        make.top.equalTo(nameQ.mas_bottom).offset(5);
        
        
    }];
    
    
    //创建常见问题
    UIButton *btnY1 =[[UIButton alloc]init];
    [view2 addSubview:btnY1];
    [btnY1 setBackgroundImage:[UIImage imageNamed:@"H111"] forState:UIControlStateNormal];
    
    
    [btnY1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view2).offset(70);
        make.left.equalTo(view2).offset(10);
        
        
    }];
    
    
    // 箭头按钮
    UIButton *btnJ1 = [[UIButton alloc]init];
    [view2 addSubview:btnJ1];
    [btnJ1 setBackgroundImage:[UIImage imageNamed:@"icon_go"] forState:UIControlStateNormal];
    [btnJ1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view2).offset(85);
        make.right.equalTo(view2).offset(-10);
        
        
    }];
    
    //意见反馈文字
    UILabel *nameQ1 = [[UILabel alloc]init];
    nameQ1.text = @"常见问题";
    nameQ1.font = [UIFont systemFontOfSize:14];
    nameQ1.textColor = [UIColor blackColor];
    [view2 addSubview:nameQ1];
    
    
    [nameQ1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(btnY1.mas_right).offset(10);
        make.top.equalTo(view2).offset(70);
        make.right.equalTo(btnJ1);
        
    }];
    
    
    UILabel *nameQ3= [[UILabel alloc]init];
    nameQ3.text = @"配送时间，优惠券和退款流程等";
    nameQ3.font = [UIFont systemFontOfSize:12];
    nameQ3.textColor = [UIColor lightGrayColor];
    [view2 addSubview:nameQ3];
    
    
    [nameQ3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(nameQ1);
        make.top.equalTo(nameQ1.mas_bottom).offset(5);
        
        
    }];
    
    
    //创建客服电话
    UIButton *btnY2 =[[UIButton alloc]init];
    [view2 addSubview:btnY2];
    [btnY2 setBackgroundImage:[UIImage imageNamed:@"H112"] forState:UIControlStateNormal];
    
    
    [btnY2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view2).offset(130);
        make.left.equalTo(view2).offset(10);
        
        
    }];
    
    
    // 箭头按钮
    UIButton *btnJ2 = [[UIButton alloc]init];
    [view2 addSubview:btnJ2];
    [btnJ2 setBackgroundImage:[UIImage imageNamed:@"icon_go"] forState:UIControlStateNormal];
    [btnJ2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view2).offset(145);
        make.right.equalTo(view2).offset(-10);
        
        
    }];
    
    //意见反馈文字
    UILabel *nameQ5 = [[UILabel alloc]init];
    nameQ5.text = @"客服电话";
    nameQ5.font = [UIFont systemFontOfSize:14];
    nameQ5.textColor = [UIColor blackColor];
    [view2 addSubview:nameQ5];
    
    
    [nameQ5 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(btnY2.mas_right).offset(10);
        make.top.equalTo(view2).offset(130);
        make.right.equalTo(btnJ2);
        
    }];
    
    
    UILabel *nameQ6= [[UILabel alloc]init];
    nameQ6.text = @"400-8484-842";
    nameQ6.font = [UIFont systemFontOfSize:12];
    nameQ6.textColor = [UIColor blueColor];
    [view2 addSubview:nameQ6];
    
    
    [nameQ6 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(nameQ5);
        make.top.equalTo(nameQ5.mas_bottom).offset(5);
        
    }];
}
@end

