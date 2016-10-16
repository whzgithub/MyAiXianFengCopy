//
//  AXFAVPlayerController.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/16.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFAVPlayerController.h"
#import "CYVideoPlayerView.h"
#import <AVFoundation/AVFoundation.h>
#import "CYFullViewController.h"

NSString *play_url = @"http://pl.youku.com/playlist/m3u8?vid=XMTMyMzExMTE5Mg&type=flv&ts=1476548356&keyframe=0&ep=dSaTHEyJXs0F4yXfjT8bZnmwJ3QIXJZ3kmLM%2FJgXSMZAPe3CzlHSxJ%2B5&sid=7476548356605121ebc37&token=3329&ctype=12&ev=1&oip=2073474799&uc_param_str=xk";;

@interface AXFAVPlayerController ()<CYVideoPlayerDelegate>

@property (nonatomic,strong) CYVideoPlayerView *playerView;

@property (nonatomic,strong) CYFullViewController *fullViewController;
@end

@implementation AXFAVPlayerController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.playerView = [[CYVideoPlayerView alloc] init];
    self.playerView.delegate = self;
    [self.view addSubview:self.playerView];
    [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(self.view.bounds.size.width * 9 / 16);
    }];
//    self.navigationController.navigationBarHidden = YES;
    // 传一个 AVPlayerItem 如果能够播放视频就会调用play方法
    [self.playerView replaceAVPlayerItem:[[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:play_url]]];
    
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.image = [UIImage imageNamed:@"H100"];
    [self.view addSubview:imageV];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.playerView.mas_bottom).offset(0);
        make.left.right.offset(0);
        make.bottom.offset(-44);
    }];
    UIButton *btn = [[UIButton alloc] init];
    [self.view addSubview:btn];
    [btn setImage:[UIImage imageNamed:@"icon_magnifying_glass"] forState:UIControlStateNormal];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(imageV.mas_bottom).offset(0);
        make.bottom.offset(0);
    }];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - CYVideoPlayerDelegate
/** <是否全屏播放视频> */
- (void)cyVideoToolBarView:(CYVideoToolBar *)cyVideoToolBar shouldFullScreen:(BOOL)isFull
{
    if (isFull) {
        self.fullViewController = [[CYFullViewController alloc] init];
        [self.fullViewController.view addSubview:self.playerView];
        [self.playerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.removeExisting = YES;
        }];
        [self.playerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.fullViewController.view);
        }];
        [self presentViewController:self.fullViewController animated:NO completion:nil];
    }else
    {
        [self.fullViewController dismissViewControllerAnimated:NO completion:^{
            [self.view addSubview:self.playerView];
            self.fullViewController = nil;
            [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.equalTo(self.view);
                make.height.mas_equalTo(self.view.bounds.size.width * 9 / 16);
            }];
        }];
    }
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
