//
//  AXFMarketCategoryCell.m
//  AiXianFeng
//
//  Created by whz on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFMarketCategoryCell.h"

@interface AXFMarketCategoryCell ()

// categoryCell分类名字
@property(nonatomic,strong)UILabel *nameLabel;
// categoryCell分类左侧黄线
@property(nonatomic, strong)UIView *yellowLineView;

@end

@implementation AXFMarketCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - 初始化界面
/// 初始化界面
- (void) setupUI {

    // categoryCell分类左侧黄线
    UIView *yellowLineView = [[UIView alloc] init];
    yellowLineView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:yellowLineView];
    [yellowLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(3);
        make.bottom.mas_equalTo(-3);
        make.left.equalTo(self.contentView);
        make.width.offset(5);
    }];
    
    // categoryCell分类名字
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:nameLabel];
    nameLabel.text = @"假的名字";
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView).offset(0);
        make.left.equalTo(yellowLineView.mas_right).offset(8);
    }];
    
    // 赋值
    self.yellowLineView = yellowLineView;
    self.nameLabel = nameLabel;
}

#pragma mark - 重写setModel方法，给分类赋值
// 重写setModel方法，给分类赋值
-(void)setModel:(AXFCategoriesModel *)model
{
    // 赋值
    self.nameLabel.text = model.name;
    
    if (self.yellowLineView.hidden == NO) {
        
        self.backgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.backgroundView.backgroundColor = [UIColor whiteColor];
        
    }
    else {
        
        self.backgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.backgroundView.backgroundColor = [UIColor cz_colorWithRed:231 green:231 blue:231];
    }
}

#pragma mark - 选中cell状态
/// 选中cell状态
- (void) selectCell {
    self.yellowLineView.hidden = NO;
}

#pragma mark - 非选中状态
/// 非选中状态
- (void) unselectCell {
    self.yellowLineView.hidden = YES;
}

@end
