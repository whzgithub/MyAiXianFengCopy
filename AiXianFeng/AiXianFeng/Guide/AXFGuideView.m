//
//  AXFGuideView.m
//  AiXianFeng
//
//  Created by whz on 16/10/12.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFGuideView.h"
#import "Masonry.h"

@interface AXFGuideView () <UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIPageControl *pageControl;

@end

@implementation AXFGuideView

/**
 UIScrollView  放上四个imageView
 分页
 UIPageControl 分页指示器
 
 */
// 重写控件的构造方法建议重写initWithFrame
- (instancetype)initWithFrame:(CGRect)frame {
    
    
    if (self = [super initWithFrame:frame]) {
        
        // 添加UIScrollView
        [self setupUI];
    }
    return self;
}

#pragma mark - 设置scrollView
- (void)setupUI {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    
    // 添加scrollView到自定义视图上
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    
    // 隐藏两个滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    // 设置分页
    scrollView.pagingEnabled = YES;
    
    // 关闭弹簧效果
    scrollView.bounces = NO;
    
    // 设置scrollView的代理
    scrollView.delegate = self;
    
    // 创建分页指示器
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    // 给属性赋值
    self.pageControl = pageControl;
    // 设置当前是第几页
    pageControl.currentPage = 0;
    // 设置其它页的小点颜色
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    // 设置当前页的小点颜色
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    
    // 把分页指示器添加到自定义视图上不要加在scrollView里面,会跟着一起走
    [self addSubview:pageControl];
    
    //    pageControl.numberOfPages = 2;
    //    pageControl.backgroundColor = [UIColor redColor];
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        [make centerX];
        make.bottom.offset(-20);
    }];
    
    // 让分页指示器的小点不能点击
    //    pageControl.enabled = NO;
    
}

#pragma mark - 重写接收数据属性的set方法在此方法中给scrollView添加图片
- (void)setImageNames:(NSArray *)imageNames {
    
    _imageNames = imageNames;
    
    // for循环创建scrollView中的图片
    for (NSInteger i = 0; i < imageNames.count; i++) {
        // 1.创建imageView
        UIImageView *imageView = [[UIImageView alloc] init];
        // 2.设置frame
        imageView.frame = CGRectOffset(self.bounds, i * self.bounds.size.width, 0);
        // 3.设置图片
        imageView.image = [UIImage imageNamed:imageNames[i]];
        // 4.添加到scrollView上
        [self.scrollView addSubview:imageView];
        
        // 5.让imageView可以和用户交互它的里面的按钮才可以点击
        imageView.userInteractionEnabled = YES;
        
        // 给每一个imageView上面添加一个加载更多按钮
        [self makeLoadMoreBtn:imageView];
    }
    
    // 二 设置滚动范围
    self.scrollView.contentSize = CGSizeMake((imageNames.count + 1) * self.bounds.size.width, 0);
    
    // 三 设置分页指示器的总个数
    self.pageControl.numberOfPages = imageNames.count;
    //    self.pageControl.currentPage = 2;
}

#pragma mark - 创建加载更多按钮
- (void)makeLoadMoreBtn:(UIImageView *)imageView {
    // 1.创建按钮
    UIButton *loadMoreBtn = [[UIButton alloc] init];
    [loadMoreBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    // 2.设置图片
    [loadMoreBtn setImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    [loadMoreBtn setImage:[UIImage imageNamed:@"btn"] forState:UIControlStateHighlighted];
    
    // 3.添加到父控件上
    [imageView addSubview:loadMoreBtn];
    // 让按钮的尺寸根据图片的大小自适应
    [loadMoreBtn sizeToFit];
    
    // 4.给加载更多按钮添加约束
    [loadMoreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];

    // 5.给加载更多按钮添加监听事件
    [loadMoreBtn addTarget:self action:@selector(loadMoreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

/**
 1.tag
 2.superView
 */
#pragma mark - 加载更多按钮监听方法
- (void)loadMoreBtnClick:(UIButton *)btn {
    
    // 1.把当前被点击的加载更多按钮隐藏
    btn.hidden = YES;
    
    // 2.动画的方式让imageView放大及完全透明
    [UIView animateWithDuration:0.2 animations:^{
        // 让按钮的父控件,也就当前点击的按钮所在的imageView放大
        btn.superview.transform = CGAffineTransformMakeScale(2, 2);
        // 让imageView透明
        btn.superview.alpha = 0;
    } completion:^(BOOL finished) {
        // 让新特性界面自定义视图直接从父控件上移除
        // 3.动画完成之后把自定义的新特性view直接从父控件中移除
        [self removeFromSuperview];
    }];
}

#pragma mark - UIScrollViewDelegate
// 正在滚动中一直会调用此方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    // 当新的一页已经出来一大半就让分页指示器显示到新的一页
    NSInteger pageNo = page + 0.4999;
    //    NSLog(@"%f ---%zd", page, pageNo);
    self.pageControl.currentPage = pageNo;
    
    // 把当前的页数设置给scrollView的tag
    scrollView.tag = pageNo;
    
    //    if (pageNo == _imageNames.count) {
    //        self.pageControl.hidden = YES;
    //    } else {
    //        self.pageControl.hidden = NO;
    //    }
    
    //    self.pageControl.hidden = (pageNo == _imageNames.count);
    self.pageControl.hidden = !(_imageNames.count - pageNo);
}

#pragma mark - 手动拖拽并且有降速过程,降速完成之后就会来调用此方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // 如果滚动到最后一页并停在了空白的这一页上时,把自定义新特性界面移除
    if (scrollView.tag == _imageNames.count) {
        [self removeFromSuperview];
    }
}

#warning mark - 以前没有AutoLayout时子控件的frame设置全部写在此方法中
//- (void)layoutSubviews {
//    [super layoutSubviews];
//    
//}


@end
