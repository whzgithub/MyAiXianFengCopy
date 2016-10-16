//
//  AXFScanViewController.m
//  AiXianFeng
//
//  Created by 美琳 on 16/10/13.
//  Copyright © 2016年 LongChuang. All rights reserved.
//

#import "AXFScanViewController.h"
#import "UIView+SDExtension.h"
#import <AVFoundation/AVFoundation.h>

static const CGFloat kBorderW = 60;
static const CGFloat kMargin = 30;

@interface AXFScanViewController () <AVCaptureMetadataOutputObjectsDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) AVCaptureSession *session;

@end

@implementation AXFScanViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationController.navigationBar.hidden = YES;
    self.navigationItem.title = @"店铺二维码";
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.95];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMiss)]];
    self.view.clipsToBounds = YES;
    [self setupScanWindowView];
    [self beginScanning];
}
- (void)setupScanWindowView
{
    CGFloat scanWindowH = self.view.sd_height * 0.6 - kBorderW * 3;
    CGFloat scanWindowW = self.view.sd_width - kMargin * 4;
    UIView *scanWindow = [[UIView alloc] initWithFrame:CGRectMake(kMargin *2, kBorderW * 3, scanWindowW, scanWindowH)];
    scanWindow.clipsToBounds = YES;
    [self.view addSubview:scanWindow];
    
    CGFloat scanNetImageViewH = 241;
    CGFloat scanNetImageViewW = scanWindow.sd_width;
    UIImageView *scanNetImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scan_net"]];
    scanNetImageView.frame = CGRectMake(0, -scanNetImageViewH, scanNetImageViewW, scanNetImageViewH);
    CABasicAnimation *scanNetAnimation = [CABasicAnimation animation];
    scanNetAnimation.keyPath = @"transform.translation.y";
    scanNetAnimation.byValue = @(scanWindowH);
    scanNetAnimation.duration = 1.0;
    scanNetAnimation.repeatCount = MAXFLOAT;
    [scanNetImageView.layer addAnimation:scanNetAnimation forKey:nil];
    [scanWindow addSubview:scanNetImageView];
    CGFloat buttonWH = 18;
    UIButton *topLeft = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, buttonWH, buttonWH)];
    [topLeft setImage:[UIImage imageNamed:@"scan_1"] forState:UIControlStateNormal];
    [scanWindow addSubview:topLeft];
    UIButton *topRight = [[UIButton alloc] initWithFrame:CGRectMake(scanWindowW - buttonWH, 0, buttonWH, buttonWH)];
    [topRight setImage:[UIImage imageNamed:@"scan_2"] forState:UIControlStateNormal];
    [scanWindow addSubview:topRight];
    UIButton *bottomLeft = [[UIButton alloc] initWithFrame:CGRectMake(0, scanWindowH - buttonWH, buttonWH, buttonWH)];
    [bottomLeft setImage:[UIImage imageNamed:@"scan_3"] forState:UIControlStateNormal];
    [scanWindow addSubview:bottomLeft];
    
    UIButton *bottomRight = [[UIButton alloc] initWithFrame:CGRectMake(topRight.sd_x, bottomLeft.sd_y, buttonWH, buttonWH)];
    [bottomRight setImage:[UIImage imageNamed:@"scan_4"] forState:UIControlStateNormal];
    [scanWindow addSubview:bottomRight];
    
    //提示框label
    UILabel *label = [[UILabel alloc] init];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(scanWindow.mas_bottom).offset(20);
    }];
    label.text = @"将店铺二维码对准方块内即可收藏店铺";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:14];
    
    
    
}

- (void)beginScanning
{
    //获取摄像设备
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //创建输入流
    AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    if (!input) return;
    //创建输出流
    AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
    output.rectOfInterest = CGRectMake(0.1, 0, 0.9, 1);
    //设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //初始化链接对象
    _session = [[AVCaptureSession alloc]init];
    //高质量采集率
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    
    [_session addInput:input];
    [_session addOutput:output];
    //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
    output.metadataObjectTypes=@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    
    AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    layer.frame=self.view.layer.bounds;
    [self.view.layer insertSublayer:layer atIndex:0];
    //开始捕获
    [_session startRunning];
}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count>0) {
        [_session stopRunning];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"扫描结果" message:metadataObject.stringValue delegate:self cancelButtonTitle:@"退出" otherButtonTitles:@"再次扫描", nil];
        [alert show];
    }
}

- (void)disMiss
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)willMoveToParentViewController:(UIViewController *)parent
{
    if (!parent) {
        self.navigationController.navigationBar.hidden = NO;
    }
}


#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self disMiss];
    } else if (buttonIndex == 1) {
        [_session startRunning];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
