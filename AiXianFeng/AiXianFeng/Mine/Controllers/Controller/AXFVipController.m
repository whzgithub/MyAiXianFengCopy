//
//  AXFVipController.m
//  AiXianFeng
//
//  Created by apple on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFVipController.h"
#import "MTCustomModal.h"
#import "AXFVipModel.h"
#import <YYModel.h>
#import "AXFVipTableViewCell.h"
@interface AXFVipController ()

@end

@implementation AXFVipController{
    
    // 自定义modal的效果
    MTCustomModal *_customModal;
    
    NSArray<AXFVipModel *>* _datas;
}
- (instancetype)init
{
    if ([super init]) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        _customModal = [[MTCustomModal alloc] init];
        self.transitioningDelegate = _customModal;
        _datas = [NSArray array];
    }
    
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI
{
    [self setData];
    self.navigationItem.title = @"会员中心";
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    
    UIView* headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AXFMainScreenWidth, 150)];
    
    self.tableView.tableHeaderView = headerV;
    
    
    UIImageView* imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"VIP1"]];
    [headerV addSubview:imgV];
    // 约束
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.offset(0);
        
    }];
    
    
    UIImageView* imgV1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"H101"]];
    [headerV addSubview:imgV1];
    // 约束
    [imgV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.offset(0);
        make.top.equalTo(headerV.mas_top).offset(10);
        
    }];
    
    UILabel* label = [UILabel cz_labelWithText:@"积分800" fontSize:13 color:[UIColor whiteColor]];
    [headerV addSubview:label];
    // 约束
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.offset(0);
        make.top.equalTo(imgV1.mas_bottom).offset(10);
        
    }];
    
    // 设置cell高度
    self.tableView.rowHeight = 85;
    
    // 注册cell
    UINib *nib = [UINib nibWithNibName:@"AXFVipTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    

    
}
// 实现tableview的数据方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AXFVipTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // 设置数据
    AXFVipModel* model = _datas[indexPath.row];
    cell.img.image = [UIImage imageNamed:model.img];
    cell.titleLabel.text = model.title;
    cell.contentLabel.text = model.content;
    
    return cell;
    
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)setData
{
    NSURL* url = [[NSBundle mainBundle] URLForResource:@"Property List.plist" withExtension:nil];
    
    NSArray* arr = [NSArray arrayWithContentsOfURL:url];
    
    NSMutableArray* data = [NSMutableArray array];
    
    [arr enumerateObjectsUsingBlock:^(NSDictionary* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        AXFVipModel *model = [AXFVipModel yy_modelWithDictionary:obj];
        [data addObject:model];
    }];
    
    _datas = data.copy;
    
}

@end
