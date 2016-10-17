//
//  AXFAddSexCell.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFAddSexCell.h"

@interface AXFAddSexCell ()
@property(nonatomic,strong)UIButton *manBtn;
@property(nonatomic,strong)UIButton *womanBtn;


@end

@implementation AXFAddSexCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)setupUI
{//v2_address_edit_normal"
    //v2_address_locate-1
    //  v2_selected
    UIButton *manBtn = [[UIButton alloc] init];
    [self.contentView addSubview:manBtn];
    self.manBtn = manBtn;
    manBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 25, 0, 0);
    [manBtn setImage:[UIImage imageNamed:@"v2_noselected"] forState:UIControlStateNormal];
    [manBtn setImage:[UIImage imageNamed:@"v2_selected"] forState:UIControlStateSelected];
    [manBtn setTitle:@"先生" forState:UIControlStateNormal];
    manBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [manBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIButton *womanBtn = [[UIButton alloc] init];
    [self.contentView addSubview:womanBtn];
    womanBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 25, 0, 0);
    [womanBtn setImage:[UIImage imageNamed:@"v2_noselected"] forState:UIControlStateNormal];
    [womanBtn setImage:[UIImage imageNamed:@"v2_selected"] forState:UIControlStateSelected];
    [womanBtn setTitle:@"女士" forState:UIControlStateNormal];
    womanBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [womanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.womanBtn = womanBtn;
    [manBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(63);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(80);
    }];
    [womanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(manBtn.mas_right).offset(20);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(80);
    }];
    
    [manBtn addTarget:self action:@selector(manBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [womanBtn addTarget:self action:@selector(womanBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void) manBtnClick:(UIButton *)sender
{
    self.manBtn.selected = YES;
    self.womanBtn.selected = NO;
}
- (void)womanBtnClick:(UIButton *)sender
{
    self.manBtn.selected = NO;
    self.womanBtn.selected = YES;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
