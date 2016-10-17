//
//  AXFCartController.m
//  AiXianFeng
//
//  Created by mac on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//



#import "AXFCartController.h"
#import "AXFShopCartTableViewCell.h"
#import "NSAttributedString+CZAdditon.h"
#import "AXFHomeController.h"
#import "AXFIDModel.h"
#import <YYModel.h>
#import "AXFCartHeadview.h"
#import "AXFCatFootView.h"
#import "AXFCartEmptyView.h"
#define  TAG_BACKGROUNDVIEW 100

#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width


@interface AXFCartController ()<UITableViewDataSource,UITableViewDelegate,AXFCartEmptyViewDelegate>

@property(nonatomic,strong)AXFCatFootView *catFootView;

@end

@implementation AXFCartController


{
    UITableView *_myTableView;
    //    //全选按钮
    UIButton *_selectAlls;
    //展示数据源数组
    NSMutableArray<AXFIDModel *> *_dataArray;
    //是否全选
    BOOL _isSelect;
    
    //已选的商品集合
    NSMutableArray *_selectGoods;
    
    /// 计算按钮
    UIButton* _btns;
    
}


-(void)viewDidAppear:(BOOL)animated
{
    if (self.marketmodel.count) {
        
        _dataArray = self.marketmodel;
        [_myTableView reloadData];
        _myTableView.hidden = NO;
    }else
    {
        _myTableView.hidden = YES;
    }
    
    self.catFootView.modelList = self.marketmodel;
    [super viewWillAppear:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isSelect = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    /// 结算界面
    [self setupMainView];
    
    /// 没有产品的是界面
    
    self.title = @"购物车";
    
}

#pragma mark - 设置主视图方法
-(void)setupMainView
{
    
    AXFCartEmptyView* backgroundView = [[AXFCartEmptyView alloc]initWithFrame:CGRectMake(0, 64, AXFMainScreenWidth, AXFMainScreenHeight-113)];
    [self.view addSubview:backgroundView];
    backgroundView.delegate = self;
    
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-113) style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.rowHeight = 100;
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _myTableView.backgroundColor = [UIColor whiteColor];
    [_myTableView registerClass:[AXFShopCartTableViewCell class] forCellReuseIdentifier:@"cellID"];
    
#pragma 创建tablehaedView ,footView
    /// 创建tableHeaderView并设置
    AXFCartHeadview* catHeaderView = [[AXFCartHeadview alloc] initWithFrame:CGRectMake(0, 0, AXFMainScreenWidth, 100)];
    catHeaderView.backgroundColor = [UIColor whiteColor];
    _myTableView.tableHeaderView = catHeaderView;
    
    /// 创建tableFootView并设置
    AXFCatFootView* catFootView = [[AXFCatFootView alloc] initWithFrame:CGRectMake(0, 0, AXFMainScreenWidth, 100)];
    [catFootView addTarget:self action:@selector(allSelectedBtnClick) forControlEvents:(UIControlEventValueChanged)];
    self.catFootView = catFootView;
    catFootView.backgroundColor = [UIColor whiteColor];
    _myTableView.tableFooterView = catFootView;
    
    
    [self.view addSubview:_myTableView];
}


//uicontrol事件方法
-(void)allSelectedBtnClick
{
    _isSelect = !_isSelect;
    [_myTableView reloadData];
}

#pragma mark - tableView 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AXFShopCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.model = _dataArray[indexPath.row];
    
    if (_isSelect) {
        
        cell.selectBtn.selected = YES;
    }else{
        
        cell.selectBtn.selected = NO;
    }
    
    
    cell.addClick = ^(UIButton *btn){
        [self animationWithIndex:3];
        NSInteger num = [self.tabBarItem.badgeValue integerValue];
        num ++;
        self.tabBarItem.badgeValue = @(num).description;
    };
    cell.cutClick = ^(UIButton *btn){
         [self animationWithIndex:3];
        NSInteger num = [self.tabBarItem.badgeValue integerValue];
        num --;
        self.tabBarItem.badgeValue = @(num).description;
        
        if (num == 0) {
            self.tabBarItem.badgeValue = nil;
            
        }
        
    };
    
    cell.selectClick = ^(CGFloat OneSum){
        
        self.catFootView.sum = OneSum;
    };
    
    cell.deleteClick = ^(CGFloat sss){
        
        {
            ///MARK:系统样式弹出界面框提示
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要删除该商品?删除后无法恢复!" preferredStyle:1];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                
                NSInteger num = [self.tabBarItem.badgeValue integerValue];
                num = num - _dataArray[indexPath.row].labelNum;
                self.tabBarItem.badgeValue = @(num).description;
                _dataArray[indexPath.row].labelNum = 0;
                
                
                
                /// 移除相对应得cell中的内容数据
                [_dataArray removeObjectAtIndex:indexPath.row];
                //    删除改行cell
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                //延迟0.5s刷新一下,否则数据会乱
                [self performSelector:@selector(reloadTable) withObject:nil afterDelay:0.5];
                
                if (self.tabBarItem.badgeValue.integerValue == 0) {
                    self.tabBarItem.badgeValue = nil;
                    _myTableView.hidden = YES;
                }
            }];
            ///MARK:系统样式弹出界面框提示取消
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            
            
            
            [alert addAction:okAction];
            [alert addAction:cancel];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
        
        

    };
    
    return cell;
}

#pragma amrk-跳转只首界面
- (void)AXFCartEmptyView:(AXFCartEmptyView *)AXFCartEmptyView{
    AXFHomeController* hVc = [[AXFHomeController alloc]init];
    [self.navigationController pushViewController:hVc animated:YES];
    
    
}

#pragma mark-cell滑动出现时允许定制位于“indexPath”的特定单元格的editingStyle。 如果未实现，则当表的编辑属性设置为YES时，所有可编辑单元格@“”内容都将为其设置UITableViewCellEditingStyleDelete。
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

#pragma mark - 超市点击按钮加减对应购物车的动画
/// 超市点击按钮加减对应购物车的动画
- (void)animationWithIndex:(NSInteger) index {
    
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBarController.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.08;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.7];
    pulse.toValue= [NSNumber numberWithFloat:1.3];
    [[tabbarbuttonArray[index] layer]
     addAnimation:pulse forKey:nil];
    
}



#pragma 左侧活动点击删除
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    ///  样式显示为删除样式
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        ///MARK:系统样式弹出界面框提示
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要删除该商品?删除后无法恢复!" preferredStyle:1];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
            NSInteger num = [self.tabBarItem.badgeValue integerValue];
            num = num - _dataArray[indexPath.row].labelNum;
            self.tabBarItem.badgeValue = @(num).description;
            _dataArray[indexPath.row].labelNum = 0;
            
            
            
            /// 移除相对应得cell中的内容数据
            [_dataArray removeObjectAtIndex:indexPath.row];
            //    删除改行cell
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            //延迟0.5s刷新一下,否则数据会乱
            [self performSelector:@selector(reloadTable) withObject:nil afterDelay:0.5];
            
            if (self.tabBarItem.badgeValue.integerValue == 0) {
                self.tabBarItem.badgeValue = nil;
                _myTableView.hidden = YES;
                
            }
        }];
        ///MARK:系统样式弹出界面框提示取消
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:okAction];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

/// 刷新列表数据
-(void)reloadTable
{
    [_myTableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
