//
//  AXFMyListController.m
//  AiXianFeng
//
//  Created by apple on 16/10/14.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMyListController.h"
#import "AXFMyListView.h"
#import "AXFMineController.h"

@interface AXFMyListController ()<UIScrollViewDelegate>

// 分类视图
@property (nonatomic, weak) AXFMyListView* buttonView;

// 滚动视图
@property (nonatomic, weak) UIScrollView *scrollView;
@end

@implementation AXFMyListController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 1.获取页码数
    NSUInteger pageNumber = self.tag;
    [self.view layoutIfNeeded];
    // 2.让scrollView滚动
    CGRect rect = CGRectMake(_scrollView.bounds.size.width * pageNumber, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
    [_scrollView scrollRectToVisible:rect animated:NO];
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}

- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我的订单";
    AXFMyListView* buttonView = [[AXFMyListView alloc] init];
    
    _buttonView = buttonView;

    // 监听分类视图的值改变事件
    [buttonView addTarget:self action:@selector(categoryViewValueChanged:) forControlEvents:UIControlEventValueChanged];
    

    
    [self.view addSubview:buttonView];
    
    // 约束条件
    [buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view).mas_equalTo(UIEdgeInsetsMake( 0, 0,550, 0));
        
        
    }];
    
    
    // 滚动视图 scrollView
    UIScrollView *scrollV = [self setupContentView];
    
    [self.view addSubview:scrollV];
    
    [scrollV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.offset(0);
        make.top.equalTo(buttonView.mas_bottom);
        make.bottom.equalTo(self.view);
    }];
    
 
    _buttonView = buttonView;
    _scrollView = scrollV;
    
    
}

#pragma mark - 代理方法

// scrollView在滚动时的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    // 1.获取滚动视图的内容的偏移量 x
    CGFloat offsetX = scrollView.contentOffset.x;
    //    NSLog(@"%f", offsetX);
    // 2.需要将偏移量交给分类视图!
    _buttonView.offset_X = offsetX / 4;
    
}

#pragma mark - 监听事件
// MARK: - 2.分类视图值改变事件
- (void)categoryViewValueChanged:(AXFMyListView*)sender{
    
    // 1.获取页码数
   NSUInteger pageNumber = sender.pageNumber;
 
    // 2.让scrollView滚动
    CGRect rect = CGRectMake(_scrollView.bounds.size.width * pageNumber, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
    [_scrollView scrollRectToVisible:rect animated:NO];
    
}
// 负责创建底部滚动视图的方法
- (UIScrollView *)setupContentView {
    
    UIScrollView *scrollV = [[UIScrollView alloc] init];
    scrollV.backgroundColor = [UIColor whiteColor];
    scrollV.pagingEnabled = YES;
    
    // 设置代理
    scrollV.delegate = self;
    
    // MARK: - 添加3个控制器的视图!
    // 1.确定要添加子控制器的名称
    NSArray<NSString *> *vcNamesArr = @[@"AXFMyListAllViewController", @"AXFNoPayController", @"AXFTakeGoodsController", @"AXFAssessController"];
    
    // 2.遍历创建vc对象,并建立父子关系
    NSMutableArray<UIView *> *vcViewsArrM = [NSMutableArray array];
    
    [vcNamesArr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 2.1 创建vc对象
        Class cls = NSClassFromString(obj);
        UIViewController *vc = [[cls alloc] init];
        
        // 2.2 建立控制器的父子关系
        [self cz_addChildController:vc intoView:scrollV];
        
        // 2.3添加控制器的视图到view中
        [vcViewsArrM addObject:vc.view];
        
    }];
    
    [vcViewsArrM mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [vcViewsArrM mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(scrollV);
        // 确定内容的高度
        make.bottom.top.equalTo(scrollV);
        
    }];
    
    return scrollV;
}

@end
