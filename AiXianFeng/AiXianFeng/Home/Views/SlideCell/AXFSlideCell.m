//
//  AXFSlideCell.m
//  AiXianFeng
//
//  Created by Long on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFSlideCell.h"
#import "AXFSlideCollectionViewCell.h"
#import "AXFSlideFlowLayout.h"
#import <Masonry.h>

static NSString *SlideCellID = @"SlideCellID";

@interface AXFSlideCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation AXFSlideCell

-(void)awakeFromNib
{
    [self setupUI];
}

// 重写重用的方法，初始化控件
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.imageList = @[@"0",@"1",@"2",@"0",@"1"];
    }
    return self;
}

// 重写图片地址数组的set方法
-(void)setImageList:(NSArray *)imageList
{
    _imageList = imageList;
    
}

// 初始化控件方法
-(void)setupUI
{
    // 创建collection的流布局对象
    AXFSlideFlowLayout *flowLaout = [[AXFSlideFlowLayout alloc] init];
    // 创建UICollectionView对象，用Masonry自动布局设置frame
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.contentView.bounds collectionViewLayout:flowLaout];
    
    // 设置代理和数据源
    collectionView.delegate = self;
    collectionView.dataSource = self;
    // 注册cell
    [collectionView registerClass:[AXFSlideCollectionViewCell class] forCellWithReuseIdentifier:SlideCellID];
    // 设置关闭滚动条
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    // 将UICollectionView对象添加到cell控件
    [self.contentView addSubview:collectionView];
    // 自动布局
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).offset(0);
    }];
}

#pragma mark - 设置数据源方法
// 数据源方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imageList.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建自定义cell
    AXFSlideCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SlideCellID forIndexPath:indexPath];
    cell.imageURL = _imageList[indexPath.row];
    return cell;
}
@end
