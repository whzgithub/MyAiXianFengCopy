//
//  AXFAddressViewController.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFAddressViewController.h"
#import "AXFAddressOneCell.h"
#import "AXFAddressTwoCell.h"
#import "AXFAddressOneTableViewCell.h"
#import "AXFAddressTwoTableViewCell.h"
#import "AXFHomeController.h"
#import "AXFAddressBottomView.h"
#import "AXFAddAddressController.h"
#import "AXFSearchPositionController.h"


@interface AXFAddressViewController ()<UITableViewDataSource,UITableViewDelegate,AXFAddressOneCellDelegate,AXFAddressTwoCellDelegate,AXFAddressBottomViewDelegate,AXFAddressOneTableViewCellDelegate>

@property(nonatomic,strong) UISegmentedControl *segmentedC;
@property(nonatomic,strong) UITableView *addressTable;

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *phoneNum;
@property( nonatomic,copy) NSString *address;

@end

@implementation AXFAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
}

#pragma mark - cell的代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.segmentedC.selectedSegmentIndex == 1) {
        return 17;
    }
    return 0.1;
}
- (void)addressOneTabelViewCell:(AXFAddressOneTableViewCell *)addressOneTableViewCell
{
    AXFAddAddressController *addAddressVc = [[AXFAddAddressController alloc] init];
    [self.navigationController pushViewController:addAddressVc animated:YES];
    }
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.segmentedC.selectedSegmentIndex == 1 && section == 1) {
        return @"附近的自提点";
    }
    return nil;
}

- (void)addressOneCell:(AXFAddressOneCell *)cell
{
//    AXFHomeController *VC = [[AXFHomeController alloc] init];
//    [self.navigationController pushViewController:VC animated:YES];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"定位失败，请手动填写当前位置" preferredStyle:  UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert presentedViewController];
    }]];
    //弹出提示框；
    [self presentViewController:alert animated:true completion:nil];
}
- (void)addressTwoCell:(AXFAddressTwoCell *)addressTwoCell
{
    AXFSearchPositionController *searchVC = [[AXFSearchPositionController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
}
- (void)setupUI
{
    NSArray *items = @[@"送货上门",@"店铺自提"];

    UISegmentedControl *segmentedC = [[UISegmentedControl alloc] initWithItems:items];
    self.segmentedC = segmentedC;
    segmentedC.frame = CGRectMake(0, 0, 150, 25);
    segmentedC.selectedSegmentIndex = 0;
    [segmentedC addTarget:self action:@selector(indexDidChangeForSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    [self.navigationItem setTitleView: segmentedC];
    //创建tableView
    UITableView *addressTabel = [[UITableView alloc] initWithFrame:CGRectNull style:UITableViewStyleGrouped];
    [self.view addSubview:addressTabel] ;
    self.addressTable = addressTabel;
    
    addressTabel.delegate = self;
    addressTabel.dataSource = self;
        [addressTabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.bottom.offset(-44);
    }];
    if (self.segmentedC.selectedSegmentIndex == 0) {
        AXFAddressBottomView *view = [[AXFAddressBottomView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.delegate = self;
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.offset(0);
            make.top.equalTo(addressTabel.mas_bottom).offset(0);
        }];
        self.segmentedC.tintColor = [UIColor yellowColor ];
    }
   
    //注册cell
    //送货上门第0组CELL
    [self.addressTable registerClass:[AXFAddressOneCell class] forCellReuseIdentifier:@"ADDRESS_ONE_CELL"];
    //送货上门第1组cell
        [self.addressTable registerClass:[AXFAddressOneTableViewCell class] forCellReuseIdentifier:@"ADDRESS_ONETABEL_CELL"];
    //店铺自提第0组CELL
    [self.addressTable registerClass:[AXFAddressTwoCell class] forCellReuseIdentifier:@"ADDRESS_TWO_CELL"];
    //店铺自提第1组CELL
    [self.addressTable registerClass:[AXFAddressTwoTableViewCell class] forCellReuseIdentifier:@"ADDRESS_TWOTABEL_CELL"];
    
}

//分段控件的触发控件事件方法
- (void)indexDidChangeForSegmentedControl:(UISegmentedControl *)sender
{
    [self.addressTable reloadData];
    [self.segmentedC setTintColor:[UIColor yellowColor]];
    if (sender.selectedSegmentIndex == 0) {
        NSLog(@"送货上门");
        AXFAddressBottomView *view = [[AXFAddressBottomView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.delegate = self;
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.offset(0);
            make.top.equalTo(self.addressTable.mas_bottom).offset(0);
        }];
        
        
    }else{
        NSLog(@"店铺自提");
        UIView *view  = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.offset(0);
            make.top.equalTo(self.addressTable.mas_bottom).offset(0);
        }];
        
    }
}

//下面的添加地址Btn的点击代理方法
- (void)addressBottomView:(AXFAddressBottomView *)addressBottomView
{
    AXFAddAddressController *AddAddressVC = [[AXFAddAddressController alloc] init];
    [self.navigationController pushViewController:AddAddressVC animated:YES];
//    AddAddressVC.addAddressClick = ^(NSString*name, NSString *phoneNum,NSString *cityName,NSString *pretureName,NSString *detail){
//        self.name = name;
//        self.phoneNum = phoneNum;
//        self.address = [NSString stringWithFormat:@"%@%@%@",cityName,pretureName,detail];
//    };
//   

}
#pragma mark - 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.segmentedC.selectedSegmentIndex == 0) {
        if (section == 0) {
            return 1;
        }else{
            return 4;
        }
    }else{
        if (section == 0) {
            return 1;
        }else{
            return 2;
        };
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.segmentedC.selectedSegmentIndex == 0) {
       
        if (indexPath.section == 0) {
            AXFAddressOneCell *one_cell = [tableView dequeueReusableCellWithIdentifier:@"ADDRESS_ONE_CELL"];
            one_cell.delegate = self;
            return one_cell;
        }else{
            AXFAddressOneTableViewCell *one_cell_table = [tableView dequeueReusableCellWithIdentifier:@"ADDRESS_ONETABEL_CELL"];
            one_cell_table.delegate = self;
            one_cell_table.name =self.name;
            one_cell_table.phoneNum = self.phoneNum;
            one_cell_table.detail = self.address;
            
            return one_cell_table;
        }
    }else{
        if (indexPath.section == 0) {
            AXFAddressTwoCell *two_cell = [tableView dequeueReusableCellWithIdentifier:@"ADDRESS_TWO_CELL"];
            two_cell.delegate = self;
            return two_cell;
        }else{
            AXFAddressTwoTableViewCell *two_cell_table = [tableView dequeueReusableCellWithIdentifier:@"ADDRESS_TWOTABEL_CELL"];
            return two_cell_table;
        }
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.segmentedC.selectedSegmentIndex == 0) {
        if (indexPath.section == 0) {
            return 44;
        }
        return 67;
    }else{
        if (indexPath.section == 0) {
            return 44;
        }
        return 85;
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
