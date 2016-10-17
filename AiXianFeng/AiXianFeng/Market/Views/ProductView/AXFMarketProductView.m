//
//  AXFMarketProductView.m
//  AiXianFeng
//
//  Created by whz on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMarketProductView.h"
#import "AXFMarketProductOrderView.h"
#import "AXFMarketProductAllCategoryView.h"
#import "AXFMarketProductCell.h"
#import "AXFCategoriesModel.h"
#import "AXFIDModel.h"

@interface AXFMarketProductView ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong)NSDictionary *dict;

@property(nonatomic,strong)NSMutableArray<AXFIDModel *> *IDModel;

@end

@implementation AXFMarketProductView

- (instancetype) initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

// 重写setAllIDModel方法，给AXFMarketProductTableView类的模型数组属性赋值
-(void)setAllIDModel:(AXFProductsModel *)allIDModel
{
    _allIDModel = allIDModel;
    //初始productTable显示内容
    self.IDModel = allIDModel.l;
    self.dict = @{
                  @"103532" : allIDModel.a,
                  @"103536" : allIDModel.b,
                  @"103541" : allIDModel.c,
                  @"103548" : allIDModel.d,
                  @"103549" : allIDModel.e,
                  @"103557" : allIDModel.f,
                  @"103565" : allIDModel.g,
                  @"103569" : allIDModel.h,
                  @"103575" : allIDModel.i,
                  @"103581" : allIDModel.j,
                  @"104747" : allIDModel.k,
                  @"104749" : allIDModel.l,
                  };
    [self.productTableView reloadData];
}

#pragma mark - 初始化UI
/// 初始化UI
- (void) setupUI {
    
    /// 总View
    UIView *BothView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AXFMainScreenWidth - 80, 200)];
    
    /// 排序View
    AXFMarketProductOrderView *productOrderView = [[AXFMarketProductOrderView alloc] initWithFrame:CGRectMake(0, 0, AXFMainScreenWidth - 80, 60)];
    productOrderView.backgroundColor = [UIColor whiteColor];
    //block传递按钮的tag出来，确定如何排序
    productOrderView.priceOrderBlock = ^(UIButton *btn){
        
        //按价格排序
        if ((int)btn.tag == 2) {
            if (btn.selected == YES) {
                
                for (NSInteger x = 0; x < self.IDModel.count; x++) {
                    for (NSInteger y = x + 1; y < self.IDModel.count; y++) {
                        if ([self.IDModel[y].market_price integerValue] < [self.IDModel[x].market_price integerValue]) {
                            AXFIDModel *temp = self.IDModel[y];
                            self.IDModel[y] = self.IDModel[x];
                            self.IDModel[x] = temp;
                        }
                    }
                }
            }else{
                
                for (NSInteger x = 0; x < self.IDModel.count; x++) {
                    for (NSInteger y = x + 1; y < self.IDModel.count; y++) {
                        if ([self.IDModel[y].market_price integerValue] > [self.IDModel[x].market_price integerValue]) {
                            AXFIDModel *temp = self.IDModel[y];
                            self.IDModel[y] = self.IDModel[x];
                            self.IDModel[x] = temp;
                        }
                    }
                }
            }
        }
        
        [self.productTableView reloadData];
    };
    
    /// 所有分类View
    AXFMarketProductAllCategoryView *productAllCategoryView = [[AXFMarketProductAllCategoryView alloc] initWithFrame:CGRectMake(0, 62, AXFMainScreenWidth - 80, 80)];
    productAllCategoryView.backgroundColor = [UIColor whiteColor];
    
    [BothView addSubview:productOrderView];
    [BothView addSubview:productAllCategoryView];
    
    /// 产品的tableView
    UITableView *productTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, AXFMainScreenWidth - 80, AXFMainScreenHeight - 49 - 64)];
    
    productTableView.delegate = self;
    productTableView.dataSource = self;
    [productTableView registerClass:[AXFMarketProductCell class] forCellReuseIdentifier:@"productCellID"];
    
    [self addSubview:productTableView];
    productTableView.rowHeight = 80;
    productTableView.tableHeaderView = BothView;
    self.productTableView = productTableView;
    
    
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.IDModel.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AXFMarketProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productCellID" forIndexPath:indexPath];
    
    cell.model = self.IDModel[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - 实现方法，接收数据
/// 实现方法，接收数据
-(void)marketController:(AXFMarketController *)AXFMarketController andModel:(AXFCategoriesModel *)model
{
    NSMutableArray<AXFIDModel *> *IDModel = self.dict[model.id];
    self.IDModel = IDModel;
    [self.productTableView reloadData];
    NSIndexPath *idx = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.productTableView scrollToRowAtIndexPath:idx atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

@end
