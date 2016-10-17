//
//  AXFVideoPlayerView.h
//  AiXianFeng
//
//  Created by 美琳 on 16/10/17.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@class AXFVideoToolBar;
@class AXFVideoPlayerView;
NS_ASSUME_NONNULL_BEGIN
@protocol AXFVideoPlayerDelegate <NSObject>

@optional

/** <是否全屏播放视频> */
- (void)cyVideoToolBarView:(AXFVideoToolBar *)cyVideoToolBar shouldFullScreen:(BOOL)isFull;

@end

/** <播放器的view> */
@interface AXFVideoPlayerView : UIView
/** <封面图片> */
@property (nonatomic,strong) UIImageView *imageView;
/** <底部工具条> */
@property (nonatomic,strong) AXFVideoToolBar *toolBarView;
/** < player > */
@property (nonatomic,strong) AVPlayer *player;
/** <playerItem> */
@property (nonatomic,strong,readonly) AVPlayerItem *playerItem;
/** <delegate> */
@property(nonatomic,weak) id<AXFVideoPlayerDelegate>delegate;
/** <播放器播放状态> */
@property (nonatomic,assign,getter=isPlaying,readonly) BOOL playing;
/** <切换一个播放的 item> */
- (void)replaceAVPlayerItem:(AVPlayerItem*)playerItem;

NS_ASSUME_NONNULL_END
@end