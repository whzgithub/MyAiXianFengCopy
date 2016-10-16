//
//  AXFMarketController.m
//  AiXianFeng
//
//  Created by Long on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMarketController.h"
#import "AXFMarketProductView.h"
#import "NetworkTool.h"
#import "AXFCategoriesDataModel.h"
#import <YYModel.h>
#import "AXFMarketCategoryCell.h"
#import "AXFIDModel.h"
#import "AXFCartController.h"
#import "AXFNavigationController.h"
#import "AXFScanViewController.h"
#import "AXFCommonHeaderView.h"
#import "AXFAddressViewController.h"
#import "MBProgressHUD.h"

#define CELLID @"cellID"

@interface AXFMarketController ()<UITableViewDelegate, UITableViewDataSource,AXFCommonHeaderViewDelegate>

/// 记录选中的cell
@property(nonatomic, assign)NSInteger selectIndexNum;
/// 选中的products数组
@property(nonatomic, strong)NSArray<AXFIDModel *> *selectProducts;
/// 分类的模型
@property(nonatomic, strong)AXFCategoriesDataModel *dataModel;
/// 存放全部模型（给购物车提供接口获取id）
@property(nonatomic, strong)NSMutableArray *numArrayM;
/// 右侧整体的productView
@property(nonatomic, strong)AXFMarketProductView *productView;

@end


@implementation AXFMarketController
{
    /// 返回json数组最外层:act_info数组
    NSArray<AXFCategoriesModel *> *_modelList;
    UIImageView *_imageV;
    MBProgressHUD *_hud;
}

- (void) viewDidLoad {
    
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dropImage:) name:@"dropClick" object:nil];
    
    /// 初始化界面
    [self setupUI];
    [self setNavBar];
    [self addWaitIcon];
    
}

#pragma mark - 添加等待图片
/// 添加等待图片
- (void)addWaitIcon
{
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"llll"]];
    imageV.frame = CGRectMake(0, 64, AXFMainScreenWidth, AXFMainScreenHeight);
    _imageV = imageV;
    [self.navigationController.view addSubview:imageV];
    [self labelExample];
}

#pragma mark - 添加等待标签
/// 添加等待标签
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

#pragma mark - 设置导航栏
/// 设置导航栏
-(void)setNavBar
{
    //     self.automaticallyAdjustsScrollViewInsets = NO;
    AXFCommonHeaderView *vc = [[AXFCommonHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    self.navigationItem.titleView = vc;
    vc.delegate = self;
}

#pragma mark - 上面导航栏的按钮的代理的实现
/// 上面导航栏的按钮的代理的实现
- (void)aXFCommonHeaderView:(AXFCommonHeaderView *)view
{
    AXFScanViewController *vc = [[AXFScanViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark - 上面导航栏的按钮的代理的实现（搜索）
/// 上面导航栏的按钮的代理的实现（搜索）
- (void)aXFCommonHeaderSearchView:(AXFCommonHeaderView *)searchView
{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"CXShearchStoryboard" bundle:nil];
    UIViewController *vc = [sb instantiateInitialViewController];
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark - 上面导航栏的按钮的代理的实现（地址）
/// 上面导航栏的按钮的代理的实现（地址）
- (void)aXFCommonHeaderAdressView:(AXFCommonHeaderView *)adressView
{
    
    AXFAddressViewController *vc = [[AXFAddressViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 与购物车网络数据联动，即将显示界面刷新对应数据
- (void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.productView.productTableView reloadData];
}

#pragma mark - 与购物车网络数据联动，即将失去界面时处理model提供相应接口数据
- (void) viewWillDisappear:(BOOL)animated {
    
    self.numArrayM = [NSMutableArray array];
    
    [self enumAllProductModel:self.dataModel.products.a];
    [self enumAllProductModel:self.dataModel.products.b];
    [self enumAllProductModel:self.dataModel.products.c];
    [self enumAllProductModel:self.dataModel.products.d];
    [self enumAllProductModel:self.dataModel.products.e];
    [self enumAllProductModel:self.dataModel.products.f];
    [self enumAllProductModel:self.dataModel.products.g];
    [self enumAllProductModel:self.dataModel.products.h];
    [self enumAllProductModel:self.dataModel.products.i];
    [self enumAllProductModel:self.dataModel.products.j];
    [self enumAllProductModel:self.dataModel.products.k];
    [self enumAllProductModel:self.dataModel.products.l];
    
    AXFNavigationController *nvc = self.tabBarController.viewControllers[3];
    AXFCartController *vc = nvc.childViewControllers[0];
    vc.marketmodel = self.numArrayM;
    
}

#pragma mark - 遍历productModel给全局numArrayM赋值提供接口数组的方法
- (void) enumAllProductModel:(NSMutableArray<AXFIDModel *> *) productX {
    
    [productX enumerateObjectsUsingBlock:^(AXFIDModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj.labelNum > 0) {
            [self.numArrayM addObject:obj];
        }
    }];
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

#pragma mark - 加减按钮的逻辑实现
-(void)dropImage:(NSNotification *)sender
{
    if (((UIButton *)sender.userInfo[@"type"]).tag == 0) {
        
        [self animationWithIndex:3];
        [self addProductsAnimation:sender.userInfo[@"imageView"] dropToPoint:CGPointMake(AXFMainScreenWidth*0.75, self.view.layer.bounds.size.height - 40) isNeedNotification:NO];
        
        __weak typeof(self) weakSelf = self;
        //        self.addShopCarFinished = ^{
        UIViewController *vc = weakSelf.tabBarController.viewControllers[3];
        NSInteger badgeValue = [vc.tabBarItem.badgeValue integerValue];
        badgeValue += 1;
        vc.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", badgeValue];
        //        };
        
    }else
    {
        [self animationWithIndex:3];
        [self addProductsAnimation:sender.userInfo[@"imageView"] dropToPoint:CGPointMake(10, -200) isNeedNotification:NO];
        
        __weak typeof(self) weakSelf = self;
        //        self.addShopCarFinished = ^{
        UIViewController *vc = weakSelf.tabBarController.viewControllers[3];
        NSInteger badgeValue = [vc.tabBarItem.badgeValue integerValue];
        badgeValue -= 1;
        vc.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", badgeValue];
        //等0的时候隐藏红点
        if (badgeValue == 0) {
            
            vc.tabBarItem.badgeValue = nil;
        };
    }
}

#pragma mark - 移除对通知的监听
- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 初始化界面
/// 初始化界面
- (void) setupUI {
    
    // MARK: - 左侧分类的CategoryView
    /// 左侧分类的CategoryView
    UITableView *categoryView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 80, AXFMainScreenHeight - 113)];
    categoryView.rowHeight = 50;
    
    /// 设置代理，数据源
    categoryView.delegate = self;
    categoryView.dataSource = self;
    
    [categoryView registerClass:[AXFMarketCategoryCell class] forCellReuseIdentifier:CELLID];
    
    [self.view addSubview:categoryView];
    
    
    // MARK: - 右侧的整体的ProductView
    /// 右侧的整体的ProductView
    self.productView = [[AXFMarketProductView alloc] initWithFrame:CGRectMake(80, 0, AXFMainScreenWidth - 80, AXFMainScreenHeight - 113)];
    
    
    [self.view addSubview:self.productView];
    
    
    // MARK: - AFNetworking二次封装加载网络数据
    // 网络请求工具类加载网络数据
    [[NetworkTool sharedTool] GETWithURLString:@"http://m.beequick.cn/data/getCategoryProduct?lat=39.977846184473&lng=116.49718705041&simulate_mobile=true&asid=57fb0b407b9698754&_r=0.16089709132451635&reflogid=57fda5d63bb4b7348&zchtid=3248&bigids=2,0" parameters:nil success:^(NSDictionary* responseObject) {
        
        NSDictionary *dictData = responseObject[@"data"];
        AXFCategoriesDataModel *dataModel = [AXFCategoriesDataModel yy_modelWithDictionary:dictData];
        self.dataModel = dataModel;
        
        // MARK: - 刷新显示categories数据
        // 主线程刷新UI
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            _modelList = dataModel.categories;
            [categoryView reloadData];
            self.productView.allIDModel = dataModel.products;
        }];
        
    } failed:^(NSError *error) {
        NSLog(@"失败");
    }];
    
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _modelList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AXFMarketCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // MARK: - 判断黄色线显示状态
    // 判断点击的是第几个cell（黄色横线显示/隐藏）
    if (self.selectIndexNum == indexPath.row) {
        [cell selectCell];
        
    }else {
        [cell unselectCell];
    }
    
    cell.model = _modelList[indexPath.row];
    return cell;
}

#pragma mark - 协议方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // MARK: - 获取点击所对应的cell设置背景视图并设置该视图的背景颜色
    // 获取点击所对应的cell设置背景视图并设置该视图的背景颜色
    AXFMarketCategoryCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.backgroundView.backgroundColor = [UIColor whiteColor];
    
    // 点击cell没有颜色
    [self.productView marketController:self andModel:_modelList[indexPath.row]];
    
    // MARK: - 记录选中的cell
    // 记录选中的cell
    self.selectIndexNum = indexPath.row;
    
    // 刷新UI(为主线程)
    [tableView reloadData];
}

@end
