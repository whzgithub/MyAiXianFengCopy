//
//  AXFHomeView.m
//  AiXianFeng
//
//  Created by Apple on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFHomeView.h"
#import "AXFTableHeaderView.h"

@interface AXFHomeView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation AXFHomeView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI
{
    // 创建tableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds];
    
    // 设置数据源和代理
    tableView.delegate = self;
    tableView.dataSource = self;

    // 注册cell
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"homeCell"];
    [self addSubview:tableView];
    
    // 创建自定义tableHeaderView并设置
    AXFTableHeaderView *tableHeaderView = [[AXFTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
    tableHeaderView.backgroundColor = [UIColor purpleColor];
    tableView.tableHeaderView = tableHeaderView;
    // 轮播图片传值
    tableHeaderView.imageArray = [self loadImagesData];
}
// 轮播图片数据加载
- (NSArray *)loadImagesData {
    NSMutableArray *arrM = [NSMutableArray array];
    for (NSInteger i = 0; i <4; i++) {
        NSString *imageName = [NSString stringWithFormat:@"Home_Scroll_%02zd", i + 1];
        [arrM addObject:[UIImage imageNamed:imageName]];
    }
    return arrM;
}
# pragma mark - 数据源方法
// 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    // 点击cell的时候没有点击的动画效果和选中效果
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
   
    return cell;
}

@end
