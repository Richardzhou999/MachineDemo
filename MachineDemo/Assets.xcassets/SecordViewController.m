//
//  SecordViewController.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/18.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "SecordViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <SDWebImage/UIButton+WebCache.h>

#define XCenter self.view.center.x
#define YCenter self.view.center.y

#define SHeight 20

#define SWidth (XCenter+40)


@interface SecordViewController () <AVCaptureMetadataOutputObjectsDelegate>



//摄像头设备
@property(nonatomic,strong)AVCaptureDevice *device;
//输入流对象
@property(nonatomic,strong)AVCaptureDeviceInput *input;
//输出流对象
@property(nonatomic,strong)AVCaptureMetadataOutput *output;
//扫描会话
@property (nonatomic,strong)AVCaptureSession *session;
//扫描图层
@property (nonatomic,strong)AVCaptureVideoPreviewLayer *layer;
//扫描背景图
@property (nonatomic,strong)UIImageView *bgView;
//扫描线
@property (nonatomic,strong)UIImageView *lineView;

@property (nonatomic,strong)UIView    * supView;



@end

@implementation SecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //[self.bgView addSubview:self.lineView];
    //[self.view addSubview:self.bgView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initBackUI];
    //[self startCode];
    
}

-(void) initBackUI{
    
    //UIButton *button = [[UIButton alloc] initN:[UIImage imageNamed:@"nav_right_setting"]];

    
    
    
    
    
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.cas_styleClass = @"loginTitle";
    label.text = @"我去";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.top.equalTo(self.view.mas_top).offset(38);
        make.size.mas_equalTo(CGSizeMake(280, 16));
    }];
    
    UIButton *back = [[UIButton alloc] init];
   
    back.frame = CGRectMake(30, 25, 40, 40);
    
    back.backgroundColor = [UIColor blueColor];
    //[back setBackgroundImage:[UIImage imageNamed:@"ic_scan_convert"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
    
    //[self showBarButton:NAV_RIGHT imageName:@"nav_right_setting"];
    
    //[self download];
    
}


                                                                                            

                                                                                                                


-(void) startCode {
    
    if(self.session){
        [self.session startRunning];
        return NSLog(@"已经开启扫描");
    }
    
    //实例化设备对象
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //实例化输入流对象
    NSError *error;
    self.input = [[AVCaptureDeviceInput alloc]initWithDevice:self.device error:&error];
    if (error) {
        NSLog(@"不是真机");
        return;
    }
    
    //实例化输出流对象
      self.output = [AVCaptureMetadataOutput new];
      //添加代理
      [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    //设置扫描范围
      self.output.rectOfInterest = [self rectOfInterestByScanViewRect:self.bgView.frame];
      //实例化扫描会话
      self.session = [AVCaptureSession new];
      //添加输入流和输出流
      [self.session addInput:self.input];
      [self.session addOutput:self.output];
      //添加扫描类型
      self.output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeCode128Code,AVMetadataObjectTypeCode39Code,AVMetadataObjectTypeCode39Mod43Code,AVMetadataObjectTypeCode93Code];
      //扫描图层
      self.layer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
      //设置图层的大小
      self.layer.frame = self.view.bounds;
      //把扫描图层插入到图层的最底部
      [self.view.layer insertSublayer:self.layer atIndex:0];
      
      //会话拉伸铺满整个图层
      //AVLayerVideoGravityResizeAspectFill 拉伸
      self.layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
      
      [self.view bringSubviewToFront:self.bgView];
      
      [self setOverView];
      
      [self.session startRunning];
      //启动扫描线
      [self moveViewAround];
    
}

- (void)moveViewAround
{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:3.0f animations:^{
        
        //改变坐标
        CGRect rect = weakSelf.lineView.frame;
        
        rect.origin.y += SWidth - 2;
        weakSelf.lineView.frame = rect;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:3.0f animations:^{
            
            //改变坐标
            CGRect rect = weakSelf.lineView.frame;
            rect.origin.y -= SWidth - 2;
            weakSelf.lineView.frame = rect;
            
        } completion:^(BOOL finished) {
            //递归
            [weakSelf moveViewAround];
        }];
    }];
}

-(void) backAction{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:@"userinfo小" forKey:@"param"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"onClick" object:nil];
    
}

#pragma mark -UI
-(UIImageView *)bgView{
    
    if (!_bgView) {
        _bgView = [[UIImageView alloc] initWithFrame:CGRectMake((KMainScreenWidth-SWidth)/2, (KMainScreenHeigth-SWidth)/2,SWidth,SWidth)];
        _bgView.image = [UIImage imageNamed:@"Ic_scanscanBg"];
    }
    
    return _bgView;
}

-(UIImageView *)lineView{
    
    if (!_lineView) {
        _lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SWidth, 2)];
        _lineView.image = [UIImage imageNamed:@"ic_scanLine"];
    }
    return _lineView;
}


- (CGRect)rectOfInterestByScanViewRect:(CGRect)rect {
    CGFloat width = CGRectGetWidth(self.view.frame);
    CGFloat height = CGRectGetHeight(self.view.frame);
    
    CGFloat x = (height - CGRectGetHeight(rect)) / 2 / height;
    CGFloat y = (width - CGRectGetWidth(rect)) / 2 / width;
    
    CGFloat w = CGRectGetHeight(rect) / height;
    CGFloat h = CGRectGetWidth(rect) / width;
    
    return CGRectMake(x, y, w, h);
}

#pragma mark -结果返回
- (void)captureOutput:(AVCaptureOutput *)output didOutputMetadataObjects:(NSArray<__kindof AVMetadataObject *> *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    
    NSString *stringValue;
    
    if ([metadataObjects count] >0)
    {
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        /**
         *  获取扫描结果
         */
        stringValue = metadataObject.stringValue;
    }
    NSLog(@"====%@",stringValue);
    
//    if ([[[stringValue componentsSeparatedByString:@":"] firstObject] isEqualToString:@"yybstore"]) {
//        
//        [self createtoDic:stringValue];
//        
//    }else{
//        [self scanresultReq:stringValue];
//    }
    
    [_session stopRunning];
    
    
    
    
}



#pragma mark - 添加模糊效果
- (void)setOverView {
    CGFloat width = CGRectGetWidth(self.view.frame);
    CGFloat height = CGRectGetHeight(self.view.frame);
    
    CGFloat x = CGRectGetMinX(self.bgView.frame);
    CGFloat y = CGRectGetMinY(self.bgView.frame);
    CGFloat w = CGRectGetWidth(self.bgView.frame);
    CGFloat h = CGRectGetHeight(self.bgView.frame);
    
    [self creatView:CGRectMake(0, 0, width, y)];
    [self creatView:CGRectMake(0, y, x, h)];
    [self creatView:CGRectMake(0, y + h, width, height - y - h)];
    [self creatView:CGRectMake(x + w, y, width - x - w, h)];
}

- (void)creatView:(CGRect)rect {
    CGFloat alpha = 0.4;
    UIColor *backColor = [UIColor blackColor];
    UIView *view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = backColor;
    view.alpha = alpha;
    [self.view addSubview:view];
    
    [self initBackUI];
}
@end
