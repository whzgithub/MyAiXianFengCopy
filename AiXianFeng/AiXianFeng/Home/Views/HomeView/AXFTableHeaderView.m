//
//  AXFTableHeaderView.m
//  AiXianFeng
//
//  Created by Apple on 16/10/10.
//  Copyright © 2016年 LongChuang. All rights reserved.
//
#import "AXFTableHeaderView.h"
#import "Masonry.h"
#import "SDCycleScrollView.h"
#import "AXFCycleModel.h"
@interface AXFTableHeaderView ()<SDCycleScrollViewDelegate>
// 模型数组
@property(nonatomic,copy) NSArray* Lists;

@end
@implementation AXFTableHeaderView

// 如果homeTopView是通过xib或sb创建此就会调用此方法
- (void)awakeFromNib {
    [self setupUI];
}

// 如果homeTopView是通过代码来创建就会调用此方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

// 设置界面
- (void)setupUI {

    
}
- (void)setArr:(NSArray *)arr
{
    _arr = arr;
    
    NSArray* arrN = arr[0][@"act_rows"];
    NSMutableArray* arrM = [[NSMutableArray alloc] init];
    // 遍历数组解析数据
    [arrN enumerateObjectsUsingBlock:^(NSDictionary* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSDictionary* dict = obj[@"activity"];
        
        AXFCycleModel* model = [[AXFCycleModel alloc] init];
        
        [model setValuesForKeysWithDictionary:dict];
        
        [arrM addObject:model];
        
        
        
    }];
    
    _Lists = arrM.copy;
    
    
    NSArray *imagesURLStrings = [NSArray array];
    
    NSMutableArray* arrMo = [NSMutableArray array];
    
    [_Lists enumerateObjectsUsingBlock:^(AXFCycleModel* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *imagesURLString = obj.img;
        
        [arrMo addObject:imagesURLString];
        
    }];
    
    imagesURLStrings = arrMo.copy;
    
    // 网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    // 接收数据
    _cycleScrollView = cycleScrollView2;
    /// 圆点的位置
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    
    // 自定义分页控件小圆标颜色
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor];
    [self addSubview:cycleScrollView2];
    
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });
    
    
    
}


@end
