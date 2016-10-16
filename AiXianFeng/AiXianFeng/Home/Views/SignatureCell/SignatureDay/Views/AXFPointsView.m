//
//  AXFPointsView.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/12.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFPointsView.h"

@implementation AXFPointsView

- (void)setPoints:(NSInteger )points
{
    _points = points;
 //满星的个数
    NSInteger full_starCount = points / 5;
    for (NSInteger i = 0; i < full_starCount; i++) {
        [self loadPointImageName:@"v2_star_on" position:i];
    }
    //空星
    for (NSInteger i = full_starCount; i < 7; i++) {
        [self loadPointImageName:@"v2_star_no" position:i];
    }
}
- (void)loadPointImageName:(NSString *)imageName position:(NSInteger)position
{
    UIImageView *imageView = nil;
    if (self.subviews.count == 7) {
        imageView = self.subviews[position];
    }else{
    //创建用来放星星图片的imageView
        imageView = [[UIImageView alloc] init];
        //初始星星的frame
//       CGRect starFrame= CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height);
          CGFloat width = 20;
        
        CGFloat height = 20;
        
        CGFloat y = 0;
        
          CGFloat x = 40* position;
        imageView.frame = CGRectMake(x, y, width, height);
        
        //设置对应星星的frame
//        imageView.frame = CGRectOffset(starFrame, position *self.bounds.size.height, 0);
        //把星星添加到父控件上
        [self addSubview:imageView];
//        [imageView sizeToFit];
//        imageView.backgroundColor = [UIColor redColor];
    }
        
    
    imageView.image = [UIImage imageNamed:imageName];
    
}
@end
