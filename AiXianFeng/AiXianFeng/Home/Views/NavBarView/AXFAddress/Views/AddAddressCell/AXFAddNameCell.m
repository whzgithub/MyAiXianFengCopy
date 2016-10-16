//
//  AXFAddNameCell.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFAddNameCell.h"

@interface AXFAddNameCell ()
@property(nonatomic,weak) UITextField *nameTextField;

@end

@implementation AXFAddNameCell

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
    UILabel *nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:nameLabel];
    nameLabel.text = @"联系人   ";
    nameLabel.font = [UIFont systemFontOfSize:14];
    
    UITextField *nameTextField = [[UITextField alloc] init];
    [self.contentView addSubview:nameTextField];
    nameTextField.placeholder = @"收货人姓名";
    self.nameTextField = nameTextField;
    nameTextField.font = [UIFont systemFontOfSize:14];
//    nameTextField.textAlignment = NSTextAlignmentLeft;
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.offset(13);
    }];
    
    [nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(80);
        make.right.offset(0);
        make.height.equalTo(self);
    }];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
