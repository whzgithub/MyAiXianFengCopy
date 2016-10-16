//
//  AXFHomeController.m
//  AiXianFeng
//
//  Created by Long on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFHomeController.h"
#import "AXFTableHeaderView.h"
#import <Masonry.h>
#import "SDCycleScrollView.h"
#import "NetworkTool.h"
#import "AXFSlideCell.h"
#import "AXFact_rowsModel_ol.h"
#import "AXFact_infoModel.h"
#import <YYModel.h>
#import "AXFScanViewController.h"
#import "AXFFoodCell.h"
#import "AXFSignatureCell.h"
#import "AXFStoresCell.h"
#import "AXFFreshToHomeCell.h"
#import "AXFSignatureController.h"
#import "AXFFreshSupplyController.h"
#import "AXFmodels.h"
#import "MJRefresh.h"
#import "CXSearchController.h"
#import "UIViewController+NavBarHidden.h"
#import "AXFCommonHeaderView.h"
#import "AXFAddressViewController.h"
#import "AXFStroesModels.h"
#import "MBProgressHUD.h"
#import "AXFWebViewController.h"
#import "AXFStoresViewController.h"
#import "AXFAVPlayerController.h"


@interface AXFHomeController ()<SDCycleScrollViewDelegate,AXFSignatureCellDelegate,AXFCommonHeaderViewDelegate,AXFSlideCellDelegate,MBProgressHUDDelegate,SDCycleScrollViewDelegate,AXFStoresCellDelegate>

@end
@implementation AXFHomeController

{
    /// 返回json数组最外层:act_info数组
    NSArray<NSDictionary *> *_dataList;
    UIImageView *_imageV;
    MBProgressHUD *_hud;
    UIView *_navBackView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    // 添加下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(reloadData:fromFile:)];
    // 自动启动下拉刷新
    [self.tableView headerBeginRefreshing];
    // 初始化UI
    [self setupUI];
    _dataList = [NSArray array];
    if (self.navigationController.childViewControllers[0] == self) {
        [self setNavBar];
        [self getBackView:self.navigationController.navigationBar];
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.navigationController.navigationBar.translucent = YES;
    }
    [self addWaitIcon];


}
- (void)viewWillDisappear:(BOOL)animated
{
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.navigationController.navigationBar.translucent = NO;

}
- (void)viewWillAppear:(BOOL)animated
{
    [self setNavBar];
    [self getBackView:self.navigationController.navigationBar];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = YES;

}

/// 设置导航颜色渐变并且不向下偏移的主方法
-(void)getBackView:(UIView*)superView
{
    if ([superView isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]){
        //移除分割线
        for (UIView *view in superView.subviews){
            if ([view isKindOfClass:[UIImageView class]]){
                [view removeFromSuperview];
            }
        }
        _navBackView = superView;
        //在这里可设置背景色
        _navBackView.backgroundColor = [UIColor orangeColor];
    }else if ([superView isKindOfClass:NSClassFromString(@"_UIBackdropView")]){
        //_UIBackdropEffectView是_UIBackdropView的子视图，这是只需隐藏父视图即可
        superView.hidden = YES;
    }
    
    for (UIView *view in superView.subviews){
        [self getBackView:view];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat alaph = (self.tableView.contentOffset.y -50) / 66.0;
    alaph = alaph < 0 ? 0 : alaph;
    _navBackView.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:alaph];
}

- (void)addWaitIcon
{
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"llll"]];
    imageV.frame = CGRectMake(0, 0, AXFMainScreenWidth, AXFMainScreenHeight);
    _imageV = imageV;
    [self.navigationController.view addSubview:imageV];
    [self labelExample];
}
- (void)labelExample {
    _hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
    _hud.label.text = NSLocalizedString(@"主人请稍等...", @"HUD loading title");
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        sleep(3);
        dispatch_async(dispatch_get_main_queue(), ^{
            [_hud hideAnimated:YES];
            // 为了保证跳转界面后在回来能100%移除
            [_imageV removeFromSuperview];
        });
    });
}

//设置导航栏
-(void)setNavBar
{
//     self.automaticallyAdjustsScrollViewInsets = NO;
    AXFCommonHeaderView *vc = [[AXFCommonHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    self.navigationItem.titleView = vc;
    vc.delegate = self;
}
#pragma mark - 上面导航栏的按钮的代理的实现
- (void)aXFCommonHeaderView:(AXFCommonHeaderView *)view
{
    AXFScanViewController *vc = [[AXFScanViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)aXFCommonHeaderSearchView:(AXFCommonHeaderView *)searchView
{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"CXShearchStoryboard" bundle:nil];
    UIViewController *vc = [sb instantiateInitialViewController];
    [self.navigationController pushViewController:vc animated:YES];

}
- (void)aXFCommonHeaderAdressView:(AXFCommonHeaderView *)adressView
{
    
    AXFAddressViewController *vc = [[AXFAddressViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 实现签到cell的代理方法
- (void)signatureCell:(AXFSignatureCell *)signatureCell andBtnNum:(AXFSignatureBtn)btnNum
{
    switch (btnNum) {
        case 0:{
            AXFSignatureController *vc1 = [[AXFSignatureController alloc] init];
            [self.navigationController pushViewController:vc1 animated:YES];
            break;
        }
        case 1:{
            AXFFreshSupplyController *vc = [[AXFFreshSupplyController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:{
            AXFAVPlayerController *vc = [[AXFAVPlayerController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:{
            AXFSignatureController *vc = [[AXFSignatureController alloc] init];
            [self.navigationController pushViewController:vc animated:NO];
            break;
        }
        default:
            break;
    }
    
}
- (void)downLoadNetWorkData
{
    [[NetworkTool sharedTool] GETWithURLString:@"http://m.beequick.cn/data/home?lat=39.977846184473&lng=116.49718705041&simulate_mobile=true&asid=57fb0b407b9698754&_r=0.292587641548531&reflogid=57fdaf800f1241935&cart_pids=&location=116.50965201661,39.985310454316&defPid=&designated_dealerid=" parameters:nil success:^(NSDictionary* responseObject) {
        
        NSDictionary *dictData = responseObject[@"data"];
        
        NSArray *arr_act_info = dictData[@"act_info"];
        
        _dataList = arr_act_info;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            

            [self setHeaderViewWithData];
            [self.tableView reloadData];
//            [_imageV removeFromSuperview];
//            [_hud removeFromSuperview];
            
        }];
        
        
    } failed:^(NSError *error) {
        
    }];
}



// 下来刷新数据方法
- (void)reloadData:(BOOL)reload fromFile:(BOOL)fromFile {
    
    //需要刷新的数据（刷新数据需要懒加载）
    [self downLoadNetWorkData];
    
    
    
    // 停止下拉刷新
    [self.tableView headerEndRefreshing];
}

-(void)setupUI
{
    // 加载网络数据
    [self downLoadNetWorkData];

    // 注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"homeCell"];
    // 注册签到cell
    [self.tableView registerClass:[AXFSignatureCell class] forCellReuseIdentifier:@"signatureCell"];
    
    // 滑动cell
    [self.tableView registerClass:[AXFSlideCell class] forCellReuseIdentifier:@"slideCell"];
    
    // 便利店cell
    [self.tableView registerClass:[AXFStoresCell class] forCellReuseIdentifier:@"storeCell"];
    
    // 新鲜到家cell
    [self.tableView registerClass:[AXFFreshToHomeCell class] forCellReuseIdentifier:@"freshToHome"];
    
    // 食品cell
    [self.tableView registerClass:[AXFFoodCell class] forCellReuseIdentifier:@"foodCellID"];
    

    
    // 创建自定义tableHeaderView并设置
    AXFTableHeaderView *tableHeaderView = [[AXFTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, AXFMainScreenWidth, 200)];
    tableHeaderView.backgroundColor = [UIColor purpleColor];
    self.tableView.tableHeaderView = tableHeaderView;
    // 设置数据源
    tableHeaderView.cycleScrollView.delegate = self;

}

- (void)setHeaderViewWithData
{
    // 创建自定义tableHeaderView并设置
    AXFTableHeaderView *tableHeaderView = [[AXFTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, AXFMainScreenWidth, 200)];
    // 传输数据
    tableHeaderView.arr = _dataList;
    // 设置背景颜色
    tableHeaderView.backgroundColor = [UIColor purpleColor];
    
    self.tableView.tableHeaderView = tableHeaderView;
    
    // 设置数据源
    tableHeaderView.cycleScrollView.delegate = self;
    
}
 #pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
   // NSLog(@"---点击了第%ld张图片", (long)index);
    
    [self.navigationController pushViewController:[NSClassFromString(@"AXFCycleController") new] animated:YES];
}

//代理方法
#pragma mark - 实现签到cell的代理方法
- (void)homeTopView:(AXFStoresCell *)homeTopView andButtonType:(AXFStoresViewBtnType)btnType
{
    
    switch (btnType) {
        case 0:{
            AXFStoresViewController *vc = [[AXFStoresViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES ];
            break;
        }
        case 1:{
            AXFStoresViewController *vc = [[AXFStoresViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case 2:{
            AXFStoresViewController *vc = [[AXFStoresViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case 3:{
            AXFStoresViewController *vc = [[AXFStoresViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 4:{
            AXFStoresViewController *vc = [[AXFStoresViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 5:{
            AXFStoresViewController *vc = [[AXFStoresViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 6:{
            AXFStoresViewController *vc = [[AXFStoresViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 7:{
            AXFStoresViewController *vc = [[AXFStoresViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        default:
            break;
    }
}

// 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _dataList.count * 2 - 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        AXFSignatureCell *cell = [tableView dequeueReusableCellWithIdentifier:@"signatureCell" forIndexPath:indexPath];
        cell.delegate = self;
        return cell;
    }

    
    if (indexPath.row == 1) {
        
        AXFSlideCell *cell = [tableView dequeueReusableCellWithIdentifier:@"slideCell" forIndexPath:indexPath];
        cell.delegate = self;
        AXFact_infoModel *act_infoModel = [AXFact_infoModel yy_modelWithDictionary:_dataList[3]];
        cell.imageList = act_infoModel.act_rows;
        return cell;
    }
    
    if(indexPath.row == 2)
    {
        AXFStoresCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storeCell" forIndexPath:indexPath];
        AXFStroesModels *model = [AXFStroesModels yy_modelWithDictionary:_dataList[4]];
        cell.delegate = self;
        cell.model = model;
        return cell;
    }
    
    if (indexPath.row == 3) {
        AXFFreshToHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"freshToHome" forIndexPath:indexPath];
        AXFmodels *models = [AXFmodels yy_modelWithDictionary:_dataList[5]];
        cell.fgoodsModel = models.act_rows[2].act_rows[0].cgoods_detail;
        
        // 点击cell的时候没有点击的动画效果和选中效果
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    if (indexPath.row > 3) {
        
        AXFFoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"foodCellID" forIndexPath:indexPath];
        cell.indexForRow = indexPath.row - 4;
        cell.actInfoModel = [AXFFoodActInfoModel yy_modelWithDictionary:_dataList[6]];
        
        // 点击cell的时候没有点击的动画效果和选中效果
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        return cell;
    }
    return 0;
//        else {
//
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell" forIndexPath:indexPath];
//        
//        cell.backgroundColor = [UIColor whiteColor];
//        
//        // 点击cell的时候没有点击的动画效果和选中效果
//        cell.selectionStyle =UITableViewCellSelectionStyleNone;
//        cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
//        return cell;
//    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) return 85;

    if(indexPath.row == 1) return 130;
    
    if (indexPath.row == 2) return 300;
    
    if (indexPath.row == 3) return 280;
    
    if (indexPath.row > 3) return 350;
    else return 200;
}

//slide里边的图片点击连续代理方法
-(void)slideCell:(AXFSlideCell *)slideCell andActivityModel:(AXFActivityModel *)activityModel
{
    AXFWebViewController * vc = [[AXFWebViewController alloc] init];
    vc.urlString = @"http://www.topit.me/broad?type=taghot&t=%E6%80%A7%E6%84%9F";
    [self.navigationController pushViewController:vc animated:YES];

}

@end

