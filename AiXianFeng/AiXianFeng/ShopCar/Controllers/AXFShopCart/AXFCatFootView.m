//
//  AXFFootView.m
//  AiXianFeng
//
//  Created by mac on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFCatFootView.h"
#import "AXFIDModel.h"
@interface AXFCatFootView ()

@property(nonatomic,strong)UILabel *labelSum;
@property(nonatomic,strong)UIButton *selecteAllBtn;
@end
@implementation AXFCatFootView

{
    ///价格显示
    CGFloat _sum;
    CGFloat _sum1;
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

//单个选择商品执行的方法
-(void)setSum:(CGFloat)sum
{
    _sum += sum;
    
    self.labelSum.text = [NSString stringWithFormat:@"¥%@",@(_sum).description];
    
}



#pragma mark-全选按钮的点击方法
- (void)selectAllBtnClick:(UIButton*)button{
    
    [self sendActionsForControlEvents:(UIControlEventValueChanged)];
    
    self.selecteAllBtn.selected = self.selecteAllBtn.selected?NO:YES;
    if (self.selecteAllBtn.selected == YES) {
        _sum1 = 0;
    [self.modelList enumerateObjectsUsingBlock:^(AXFIDModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        float a = [obj.market_price floatValue];
        int b = (int)obj.labelNum;
        _sum1 += a * b;
    }];
        _sum = _sum1;
        self.labelSum.text = [NSString stringWithFormat:@"¥%@",@(_sum).description];
    }else
    {
        _sum = 0;
        self.labelSum.text = [NSString stringWithFormat:@"¥%@",@(0).description];
    }

}



// 设置界面
- (void)setupUI {
    //底部视图的 背景1
    UIView *bgView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AXFMainScreenWidth, 50)];
    [self addSubview:bgView1];
    
    /// 创建备注
    UILabel* remarkL= [[UILabel alloc]init];
    remarkL.text = @"备注";
    remarkL.font = [UIFont systemFontOfSize:15];
    [bgView1 addSubview:remarkL];
    
    [remarkL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView1).offset(10);
        make.top.equalTo(@10);
        make.bottom.equalTo(bgView1).offset(-10);
        make.width.equalTo(@60);
        
    }];
    /// 备注内容
    UILabel* contentL= [[UILabel alloc]init];
    contentL.text = @"需求输入";
    contentL.font = [UIFont systemFontOfSize:15];
    ///自动换行
    contentL.numberOfLines = 0;
    //居中
    contentL.textAlignment = NSTextAlignmentRight;
    contentL.textColor = [UIColor grayColor];
    [bgView1 addSubview:contentL];
    
    [contentL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(remarkL.mas_right);
        make.top.equalTo(bgView1);
        make.bottom.equalTo(bgView1);
        make.width.offset(AXFMainScreenWidth - 140);
    }];
    
    
    /// 按钮跳转
    UIButton*btnf = [UIButton buttonWithType:UIButtonTypeCustom];
    btnf.titleLabel.font = [UIFont systemFontOfSize:15];
    [btnf setImage:[UIImage imageNamed:@"icon_go"] forState:UIControlStateNormal];
    
    [bgView1 addSubview:btnf];
    
    [btnf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentL.mas_right);
        make.top.equalTo(@10);
        make.bottom.equalTo(bgView1).offset(-10);
        make.width.equalTo(@60);
        
    }];
    
    
    //底部视图的 背景2
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0,50, AXFMainScreenWidth, 50)];
    [self addSubview:bgView];
    
    ///线
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, AXFMainScreenWidth, 1)];
    line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [bgView addSubview:line];
    
    //全选按钮
    UIButton* selectAll = [UIButton buttonWithType:UIButtonTypeCustom];
    selectAll.titleLabel.font = [UIFont systemFontOfSize:15];
    [selectAll setTitle:@" 全选" forState:UIControlStateNormal];
    [selectAll setImage:[UIImage imageNamed:@"v2_noselected"] forState:UIControlStateNormal];
    
    [selectAll setImage:[UIImage imageNamed:@"v2_selected"] forState:UIControlStateSelected];
    [selectAll setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [selectAll addTarget:self action:@selector(selectAllBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:selectAll];
    self.selecteAllBtn = selectAll;
    
    //合计
    UILabel *label = [[UILabel alloc]init];
    label.text = @"合计: ";
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = NSTextAlignmentRight;
    [bgView addSubview:label];
    
    //价格
   UILabel *labelSum = [[UILabel alloc]init];
    labelSum.text = @"￥0.00";
    labelSum.font = [UIFont boldSystemFontOfSize:16];
    labelSum.textColor = [UIColor redColor];;
    [bgView addSubview:labelSum];
    self.labelSum = labelSum;
    
    //结算按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor orangeColor];;
    [btn setTitle:@"选好了" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(goPayBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:btn];
    
    
#pragma mark -- 底部视图添加约束
    //全选按钮
    [selectAll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(10);
        make.top.equalTo(@10);
        make.bottom.equalTo(bgView).offset(-10);
        make.width.equalTo(@60);
        
    }];
    
    //结算按钮
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView);
        make.right.equalTo(bgView);
        make.bottom.equalTo(bgView);
        make.width.equalTo(@100);
        
    }];
    
    //价格显示
    [labelSum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(btn.mas_left).offset(-10);
        make.top.equalTo(bgView).offset(10);
        make.bottom.equalTo(bgView).offset(-10);
        make.left.equalTo(label.mas_right);
    }];
    
    //合计
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView).offset(10);
        make.bottom.equalTo(bgView).offset(-10);
        make.right.equalTo(labelSum.mas_left);
        make.width.equalTo(@60);
    }];
    



}
@end
