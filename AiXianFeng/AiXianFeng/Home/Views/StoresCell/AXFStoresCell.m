//
//  AXFStoresCell.m
//  AiXianFeng
//
//  Created by Long on 16/10/11.
//  Copyright © 2016年 LongChuang. All rights reserved.
//
//                                                          _ooOoo_
//                                                         o8888888o
//                                                         88" . "88
//                                                         (| -_- |)
//                                                          O\ = /O
//                                                      ____/`---'\____
//                                                    .   ' \\| |// `.
//                                                     / \\||| : |||// \
//                                                   / _||||| -:- |||||- \
//                                                     | | \\\ - /// | |
//                                                   | \_| ''\---/'' | |
//                                                    \ .-\__ `-` ___/-. /
//                                                 ___`. .' /--.--\ `. . __
//                                              ."" '< `.___\_<|>_/___.' >'"".
//                                             | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                                               \ \ `-. \_ __\ /__ _/ .-` / /
//                                       ======`-.____`-.___\_____/___.-`____.-'======
//                                                          `=---='
//
//                                       .............................................
//                                              佛祖保佑             永无BUG

#import "AXFStoresCell.h"
#import <Masonry.h>

@interface AXFStoresCell ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation AXFStoresCell

// 加载完xib或sb方向创建完成businessTypeView之的就会来调用此方法
- (void)awakeFromNib {
    
    [self setupUI];
}

// 当用代码方法创建view时会来调用此方法

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI
{
    
    UIView *view =[[UIView alloc]init];
    
    [self.contentView addSubview:view];
    
    
    // 自动布局
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).offset(0);
    }];
    
    UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"H1"]];
    [view addSubview:bg];
    
    [bg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(view).offset(0);
        make.right.equalTo(view).offset(0);
        //            make.height.mas_offset(44);
        
        //            make.centerY.equalTo(bg);
    }];
    
    
    UIButton *bg1 = [[UIButton alloc] init];
    [view addSubview:bg1];
    [bg1 setBackgroundImage:[UIImage imageNamed:@"H2"] forState:UIControlStateNormal];
    
    UIButton *bg2 = [[UIButton alloc]init];
    [view addSubview:bg2];
    [bg2 setBackgroundImage:[UIImage imageNamed:@"H3"] forState:UIControlStateNormal];
    

    NSArray *arr = @[bg1,bg2];
    [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:8 leadSpacing:8 tailSpacing:8];
    
    [arr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bg.mas_bottom);
        
    }];
    
    UIButton *bg3 = [[UIButton alloc]init];
    [view addSubview:bg3];
    [bg3 setBackgroundImage:[UIImage imageNamed:@"H4"] forState:UIControlStateNormal];
    
    UIButton *bg4 = [[UIButton alloc]init];
    [view addSubview:bg4];
    [bg4 setBackgroundImage:[UIImage imageNamed:@"H5"] forState:UIControlStateNormal];
    
    UIButton *bg5 = [[UIButton alloc]init];
    [view addSubview:bg5];
    [bg5 setBackgroundImage:[UIImage imageNamed:@"H6"] forState:UIControlStateNormal];
    
    
    UIButton *bg6 = [[UIButton alloc]init];
    [view addSubview:bg6];
    [bg6 setBackgroundImage:[UIImage imageNamed:@"H7"] forState:UIControlStateNormal];
    
    NSArray *arrM = @[bg3,bg4,bg5,bg6];
    [arrM mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:8 leadSpacing:8  tailSpacing:8];
    
    [arrM mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(bg1.mas_bottom);
        
    }];
    
    UIButton *bg7 = [[UIButton alloc]init];
    [view addSubview:bg7];
    [bg7 setBackgroundImage:[UIImage imageNamed:@"H14"] forState:UIControlStateNormal];
    
    UIButton *bg8 = [[UIButton alloc]init];
    [view addSubview:bg8];
    [bg8 setBackgroundImage:[UIImage imageNamed:@"H13"] forState:UIControlStateNormal];
    
    NSArray *arrH = @[bg7,bg8];
    [arrH mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:8 leadSpacing:8 tailSpacing:8];
    
    [arrH mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(bg4.mas_bottom);
    }];
     
}

@end
