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
//                                             | | : `- \`.;`\ _ /`;.`/ - ` : |
//                                               \ \ `-. \_ __\ /__ _/ .-` / /
//                                      ======`-.____`-.\________.`____.-'======
//                                                          `=---='
//
//                                     .......................................
//                                              佛祖保佑             永无BUG

#import "AXFStoresCell.h"


@interface AXFStoresCell ()

@end

@implementation AXFStoresCell

{
    UIImageView *_backgroudImage;
    
    UIButton *_hotSales;
    UIButton *_dayDaySpecialPrice;
    
    UIButton *_goodChoiceFruit;
    UIButton *_milkBread;
    UIButton *_drinkWater;
    UIButton *_more;
    
    UIButton *_snack;
    UIButton *_shopping;
}

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
        
        //cell不能被选中
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}



- (void)setModel:(AXFStroesModels *)model
{
    _model = model;
    
    UIImageView *imageView = [[UIImageView alloc] init];
 
   [imageView sd_setImageWithURL:[NSURL URLWithString:model.act_rows[0].act_rows[0].chead_detail.img] placeholderImage:[UIImage imageNamed:@"v2_placeholder_full_size"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        _backgroudImage.image = image;

    }];

    [self setButtonBackgroundImageWithURLString:model.act_rows[1].act_rows[0].cactivity_detail.img button:_hotSales];
    
    [self setButtonBackgroundImageWithURLString:model.act_rows[1].act_rows[1].cactivity_detail.img button:_dayDaySpecialPrice];
    
//    [self setButtonBackgroundImageWithURLString:model.act_rows[2].act_rows[0].cicons_detail.img button:_goodChoiceFruit];
    
    [self setButtonBackgroundImageWithURLString:model.act_rows[3].act_rows[0].cscene_detail.img button:_snack];
    
    [self setButtonBackgroundImageWithURLString:model.act_rows[3].act_rows[1].cscene_detail.img button:_shopping];
   
}

- (void)setButtonBackgroundImageWithURLString:(NSString *)imgUrl button:(UIButton *)btn
{
    UIImageView *imageView = [[UIImageView alloc] init];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"v2_placeholder_full_size"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [btn setBackgroundImage:image forState:UIControlStateNormal];

    }];
}


-(void)setupUI
{
    
    UIView *view =[[UIView alloc]init];
    
    [self.contentView addSubview:view];

    // 自动布局
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).offset(0);
    }];
    
    UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"v2_placeholder_full_size"]];
    [view addSubview:bg];
    
    [bg mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(view).offset(0);
        make.right.equalTo(view).offset(0);
        make.height.mas_offset(55);
    }];
    
    UIButton *bg1 = [self loadHomeTopBtnWithTitle:@""andImageName:@"v2_placeholder_full_size" andBtnType:AXFStoresViewBtnTypeFirst];
    
    [view addSubview:bg1];
    [bg1 setBackgroundImage:[UIImage imageNamed:@"v2_placeholder_full_size"] forState:UIControlStateNormal];
    
    UIButton *bg2 = [self loadHomeTopBtnWithTitle:@""andImageName:@"v2_placeholder_full_size" andBtnType:AXFStoresViewBtnTypeSecond];
    
    [view addSubview:bg2];
    [bg2 setBackgroundImage:[UIImage imageNamed:@"v2_placeholder_full_size"] forState:UIControlStateNormal];
    

    NSArray *arr = @[bg1,bg2];
    [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:8 leadSpacing:8 tailSpacing:8];
    
    [arr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bg.mas_bottom);
        make.height.offset(60);

        
    }];
    
    UIButton *bg3 = [self loadHomeTopBtnWithTitle:@""andImageName:@"H15" andBtnType:AXFStoresViewBtnTypeThird];
    
    [view addSubview:bg3];
    [bg3 setBackgroundImage:[UIImage imageNamed:@"H15"] forState:UIControlStateNormal];
   
    
    UIButton *bg4 = [self loadHomeTopBtnWithTitle:@""andImageName:@"H5" andBtnType:AXFStoresViewBtnTypeFourth];
    
    [view addSubview:bg4];
    [bg4 setBackgroundImage:[UIImage imageNamed:@"H5"] forState:UIControlStateNormal];
    
    UIButton *bg5 = [self loadHomeTopBtnWithTitle:@""andImageName:@"H6" andBtnType:AXFStoresViewBtnTypeFive];
    
    [view addSubview:bg5];
    [bg5 setBackgroundImage:[UIImage imageNamed:@"H6"] forState:UIControlStateNormal];
    
    UIButton *bg6 = [self loadHomeTopBtnWithTitle:@""andImageName:@"H7" andBtnType:AXFStoresViewBtnTypeSix];

    [view addSubview:bg6];
    [bg6 setBackgroundImage:[UIImage imageNamed:@"H7"] forState:UIControlStateNormal];
    
    NSArray *arrM = @[bg3,bg4,bg5,bg6];
    [arrM mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:8 leadSpacing:8  tailSpacing:8];
    
    [arrM mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(bg1.mas_bottom);
        
    }];
    
    UIButton *bg7 = [self loadHomeTopBtnWithTitle:@"" andImageName:@"v2_placeholder_full_size" andBtnType:AXFStoresViewBtnTypeSeven];
    [view addSubview:bg7];
    [bg7 setBackgroundImage:[UIImage imageNamed:@"H8"] forState:UIControlStateNormal];
    
    UIButton *bg8 = [self loadHomeTopBtnWithTitle:@"" andImageName:@"v2_placeholder_full_size" andBtnType:AXFStoresViewBtnTypeEight];

    [view addSubview:bg8];
    [bg8 setBackgroundImage:[UIImage imageNamed:@"H9"] forState:UIControlStateNormal];
    
    NSArray *arrH = @[bg7,bg8];
    [arrH mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:8 leadSpacing:8 tailSpacing:8];
    
    [arrH mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(bg4.mas_bottom);
        make.height.offset(80);
    }];
    
    _backgroudImage = bg;
    _hotSales = bg1;
    _dayDaySpecialPrice = bg2;
    _goodChoiceFruit = bg3;
    _milkBread = bg4;
    _drinkWater = bg5;
    _more = bg6;
    _snack = bg7;
    _shopping = bg8;
     
}



-(UIButton *)loadHomeTopBtnWithTitle:(NSString *)title andImageName:(NSString *)imageName andBtnType:(AXFStoresViewBtnType)btnType
{
    //创建按钮 
    UIButton *btn = [[UIButton alloc]init];
    
    [self addSubview:btn];
    
    //给每一个按钮设置tag
    btn.tag = btnType;
    
    [btn addTarget:self action:@selector(homeTopBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
    
}

- (void)homeTopBtnClick:(UIButton *)btn {
    
    if (self.btnBlock) {
        self.btnBlock(btn);
    }
    

    
}


@end
