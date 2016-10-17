//
//  AXFVideoToolBar.h
//  AiXianFeng
//
//  Created by 美琳 on 16/10/17.
//  Copyright © 2016年 LongChuang. All rights reserved.
//
#import <UIKit/UIKit.h>
@class AXFVideoToolBar;
NS_ASSUME_NONNULL_BEGIN

@protocol AXFVideoToolBarDelegate <NSObject>

@optional

/** <点击了底部工具条上的播放/暂停按钮> */
- (void)cyVideoToolBarView:(AXFVideoToolBar*)cyVideoToolBar didPlayVideo:(BOOL)isPlay;
/** <是否全屏播放视频> */
- (void)cyVideoToolBarView:(AXFVideoToolBar *)cyVideoToolBar shouldFullScreen:(BOOL)isFull;
/** <开始拖到滑块> */
- (void)cyVideoToolBarView:(AXFVideoToolBar *)cyVideoToolBar didDragSlider:(UISlider*)slider;
/** <松开滑块继续播放> */
- (void)cyVideoToolBarView:(AXFVideoToolBar *)cyVideoToolBar didReplayVideo:(UISlider*)slider;
/** <改变滑块的当前值> */
- (void)cyVideoToolBarView:(AXFVideoToolBar *)cyVideoToolBar didChangeValue:(UISlider*)slider;
@end

/** < 播放器底部的控制面板 > */

@interface AXFVideoToolBar : UIView
/** < 控制条背景图片 > */
@property (nonatomic,strong) UIView *bottomView;
/** <播放的按钮> */
@property (nonatomic,strong) UIButton *playBtn;
/** < 滑块 > */
@property (nonatomic,strong) UISlider *playerSlider;
/** < 全屏或半屏的按钮 > */
@property (nonatomic,strong) UIButton *fullBtn;
/** < timeLabel > */
@property (nonatomic,strong) UILabel *timeLabel;

/** <delegate> */
@property(nonatomic,weak) id<AXFVideoToolBarDelegate>delegate;

NS_ASSUME_NONNULL_END

@end
