//
//  AXFAddCityCell.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/15.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFAddCityCell.h"

@interface AXFAddCityCell ()
@property(nonatomic,strong)UITextField *cityTextField;

@end

@implementation AXFAddCityCell

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
    UILabel *cityLabel = [[UILabel alloc] init];
    [self.contentView addSubview:cityLabel];
    cityLabel.text = @"所在城市";
    cityLabel.font = [UIFont systemFontOfSize:14];
    
    UITextField *cityTextField = [[UITextField alloc] init];
    [self.contentView addSubview:cityTextField];
    cityTextField.placeholder = @"请选择城市";
    self.cityTextField = cityTextField;
    cityTextField.font = [UIFont systemFontOfSize:14];
    //    nameTextField.textAlignment = NSTextAlignmentLeft;
    [cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.offset(13);
    }];
    
    [cityTextField mas_makeConstraints:^(MASConstraintMaker *make) {
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
