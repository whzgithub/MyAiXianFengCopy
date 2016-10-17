//
//  AXFAVPlayerController.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/16.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFAVPlayerController.h"
#import "AXFVideoPlayerView.h"
#import <AVFoundation/AVFoundation.h>
#import "AXFFullViewController.h"
#import "YXCustomActionSheet.h"

#define selfBacground [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0]

NSString *play_url = @"http://pl.youku.com/playlist/m3u8?vid=XMTMyMzExMTE5Mg&type=flv&ts=1476548356&keyframe=0&ep=dSaTHEyJXs0F4yXfjT8bZnmwJ3QIXJZ3kmLM%2FJgXSMZAPe3CzlHSxJ%2B5&sid=7476548356605121ebc37&token=3329&ctype=12&ev=1&oip=2073474799&uc_param_str=xk";;

@interface AXFAVPlayerController ()<AXFVideoPlayerDelegate,YXCustomActionSheetDelegate>

@property (nonatomic,strong) AXFVideoPlayerView *playerView;

@property (nonatomic,strong) AXFFullViewController *fullViewController;
@property(nonatomic,strong) UIImageView *imageV;
@end

@implementation AXFAVPlayerController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"吃法介绍";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.playerView = [[AXFVideoPlayerView alloc] init];
    self.playerView.delegate = self;
    [self.view addSubview:self.playerView];
    [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(self.view.bounds.size.width * 9 / 16);
    }];
//    self.navigationController.navigationBarHidden = YES;
    // 传一个 AVPlayerItem 如果能够播放视频就会调用play方法
    [self.playerView replaceAVPlayerItem:[[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:play_url]]];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0 , self.view.bounds.size.width *9/16, self.view.bounds.size.width, self.view.bounds.size.height - self.view.bounds.size.width *9/16)];
    imageV.image = [UIImage imageNamed:@"H100"];
    self.imageV = imageV;
    [self.view addSubview:imageV];

    UIButton *btn = [[UIButton alloc] init];
    [self.view addSubview:btn];
    [btn setImage:[UIImage imageNamed:@"icon_magnifying_glass"] forState:UIControlStateNormal];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
//        make.top.equalTo(imageV.mas_bottom).offset(0);
        make.height.mas_equalTo(44);
        make.bottom.offset(0);
    }];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick:(UIButton *)sender
{
//    [self.navigationController popViewControllerAnimated:YES];
    [self shareBtnClick];
}

//弹出分享弹框
- (void)shareBtnClick
{
     YXCustomActionSheet*cusSheet = [[YXCustomActionSheet alloc] init];
    cusSheet.delegate = self;
    NSArray *contentArray = @[@{@"name":@"新浪微博",@"icon":@"sns_icon_3"},
                              @{@"name":@"QQ空间 ",@"icon":@"sns_icon_5"},
                              @{@"name":@"QQ ",@"icon":@"sns_icon_4"},
                              @{@"name":@"微信",@"icon":@"sns_icon_7"},
                              @{@"name":@"朋友圈",@"icon":@"sns_icon_8"},
                              //                              @{@"name":@"QQ ",@"icon":@"sns_icon_4"},
                              //                              @{@"name":@"微信",@"icon":@"sns_icon_7"},
                              //                              @{@"name":@"朋友圈",@"icon":@"sns_icon_8"},
                              @{@"name":@"新浪微博",@"icon":@"sns_icon_3"},
                              @{@"name":@"QQ空间 ",@"icon":@"sns_icon_5"},
                              @{@"name":@"微信收藏",@"icon":@"sns_icon_9"}];
    
    [cusSheet showInView:[UIApplication sharedApplication].keyWindow contentArray:contentArray];
}

#pragma mark - AXFCustomActionSheetDelegate

- (void) customActionSheetButtonClick:(YXActionSheetButton *)btn
{
    switch (btn.tag ) {
        case 0:
        {
            UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"提示" message:@"此设备尚未安装新浪微博" preferredStyle:  UIAlertControllerStyleAlert];
            [alert1 addAction:[UIAlertAction actionWithTitle:@"确定"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alert1 presentedViewController];
            }]];
            //弹出提示框；
            [self presentViewController:alert1 animated:true completion:nil];
        }
            break;
        case 1:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"此设备尚未安装QQ空间" preferredStyle:  UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alert presentedViewController];
            }]];
            //弹出提示框；
            [self presentViewController:alert animated:true completion:nil];
        }
            break;
        case 2:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"此设备尚未安装QQ" preferredStyle:  UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alert presentedViewController];
            }]];
            //弹出提示框；
            [self presentViewController:alert animated:true completion:nil];
        }
            break;
        case 3:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"此设备尚未安装微信" preferredStyle:  UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alert presentedViewController];
            }]];
            //弹出提示框；
            [self presentViewController:alert animated:true completion:nil];
        }
            break;
        case 4:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"无法分享到朋友圈，请先安装微信" preferredStyle:  UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alert presentedViewController];
            }]];
            //弹出提示框；
            [self presentViewController:alert animated:true completion:nil];
        }
            break;
            
        case 5:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"无法分享到新浪微博" preferredStyle:  UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alert presentedViewController];
            }]];
            //弹出提示框；
            [self presentViewController:alert animated:true completion:nil];
        }
            break;
        case 6:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"无法分享到QQ空间，请先安装QQ" preferredStyle:  UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alert presentedViewController];
            }]];
            //弹出提示框；
            [self presentViewController:alert animated:true completion:nil];
        }
            break;
            
        case 7:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"收藏失败，请先安装微信" preferredStyle:  UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alert presentedViewController];
            }]];
            //弹出提示框；
            [self presentViewController:alert animated:true completion:nil];
        }
            break;
        default:
            break;
    }
}
-(void)Time:(UIAlertView *)view{
    
    [view removeFromSuperview];
    
}
/*
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"回答abcd" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil]; [alert show]; [alert release];delegate 可设为nil 表示不响应事件 需按钮响应时必须要设置delegate 并实现下面方法；- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{ if (buttonIndex == 1) { 响应内容 }}
 */
#pragma mark - AXFVideoPlayerDelegate
/** <是否全屏播放视频> */
- (void)cyVideoToolBarView:(AXFVideoToolBar *)cyVideoToolBar shouldFullScreen:(BOOL)isFull
{
    if (isFull) {
        self.fullViewController = [[AXFFullViewController alloc] init];
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
