//
//  AXFAddDetailCell.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFAddDetailCell.h"

@interface AXFAddDetailCell ()
@property(nonatomic,strong)UITextField *detailTextField;

@end

@implementation AXFAddDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI
{
    UILabel *detailLabel = [[UILabel alloc] init];
    [self.contentView addSubview:detailLabel];
    detailLabel.text = @"详细地址";
    detailLabel.font = [UIFont systemFontOfSize:14];
    
    UITextField *detailTextField = [[UITextField alloc] init];
    [self.contentView addSubview:detailTextField];
    detailTextField.placeholder = @"请输入楼号门牌号等详细信息";
    self.detailTextField = detailTextField;
    detailTextField.font = [UIFont systemFontOfSize:14];
    //    nameTextField.textAlignment = NSTextAlignmentLeft;
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.offset(13);
    }];
    
    [detailTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(80);
        make.right.offset(0);
        make.height.equalTo(self);
    }];
}

- (void)setDetailName:(NSString *)detailName
{
    _detailName = detailName;
    self.detailTextField.text = detailName;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
