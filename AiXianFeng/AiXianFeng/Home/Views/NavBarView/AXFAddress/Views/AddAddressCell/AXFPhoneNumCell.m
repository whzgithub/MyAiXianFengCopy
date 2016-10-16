//
//  AXFPhoneNumCell.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFPhoneNumCell.h"

@interface AXFPhoneNumCell ()
@property(nonatomic,strong) UITextField *phoneTextField;

@end

@implementation AXFPhoneNumCell

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
    UILabel *phoneLabel = [[UILabel alloc] init];
    [self.contentView addSubview:phoneLabel];
    phoneLabel.text = @"手机号码";
    phoneLabel.font = [UIFont systemFontOfSize:14];
    
    UITextField *phoneTextField = [[UITextField alloc] init];
    [self.contentView addSubview:phoneTextField];
    phoneTextField.placeholder = @"鲜蜂侠联系您的电话";
    self.phoneTextField = phoneTextField;
    phoneTextField.font = [UIFont systemFontOfSize:14];
    //    nameTextField.textAlignment = NSTextAlignmentLeft;
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.offset(13);
    }];
    
    [phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
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
