//
//  AXFAddPrefectureCell.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFAddPrefectureCell.h"

@interface AXFAddPrefectureCell ()
@property(nonatomic)UITextField *prefectureTextField;
@end

@implementation AXFAddPrefectureCell

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
    UILabel *prefectureLabel = [[UILabel alloc] init];
    [self.contentView addSubview:prefectureLabel];
    prefectureLabel.text = @"所在地区";
    prefectureLabel.font = [UIFont systemFontOfSize:14];
    
    UITextField *prefectureTextField = [[UITextField alloc] init];
    [self.contentView addSubview:prefectureTextField];
    prefectureTextField.placeholder = @"请选择您的住宅小区、大厦或学校";
    self.prefectureTextField = prefectureTextField;
    prefectureTextField.font = [UIFont systemFontOfSize:14];
    prefectureTextField.keyboardType = UIKeyboardTypeTwitter;
    //    nameTextField.textAlignment = NSTextAlignmentLeft;
    [prefectureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.offset(13);
    }];
    
    [prefectureTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(80);
        make.right.offset(0);
        make.height.equalTo(self);
    }];
}
- (void)setPrectureName:(NSString *)prectureName
{
    _prectureName = prectureName;
    self.prefectureTextField.text = prectureName;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
