//
//  TestViewController.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/17.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@property(nonatomic,strong) UIImageView *image;

@property(nonatomic,strong) UIImageView *ivHeader;
@property(nonatomic,strong) UILabel *labName;
@property(nonatomic,strong) UIView *ivBack;//白色背景
@property(nonatomic,strong) UITextField *tfUser;
@property(nonatomic,strong) UIImageView *ivDiviceLine;//分割线
@property(nonatomic,strong) UITextField *tfPassword;

@property(nonatomic,strong) UIProgressView *progress;


@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self initUI];
}



- (void)initUI{
    
    _ivHeader = [[UIImageView alloc]initWithFrame:CGRectZero];
    _ivHeader.image = [UIImage imageNamed:@"main_iv_header"];
    [self.view addSubview:_ivHeader];
    [_ivHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.top.equalTo(self.view.mas_top).offset(100 * KHeight_scale);
        //make.size.mas_equalTo(CGSizeMake(120 *KWidth_scale, 120 * KWidth_scale));
    }];
    
   
    
    
    _image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, 200, 200)];
    [self.view addSubview:_image];
    [_ivHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_ivHeader.mas_bottom).offset(100 + KHeight_scale);
        make.size.mas_equalTo(CGSizeMake(120 *KWidth_scale, 120 * KWidth_scale));
    }];
    
    _progress = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
       [self.view addSubview:_progress];
       [_progress mas_makeConstraints:^(MASConstraintMaker *make) {
           
           make.top.equalTo(_image.mas_bottom).offset(100 + KHeight_scale);
           make.size.mas_equalTo(CGSizeMake(120 *KWidth_scale, 120 * KWidth_scale));

           
       }];
    
    //[self download];
    
    [self setdownload];
    
}


-(void) setdownload {
    
    NSString *url = @"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2764077324,3731925597&fm=26&gp=0.jpg";
    
    [self.image sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"btn_network"] options:SDWebImageCacheMemoryOnly|SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
         CGFloat percent = (float)(1.0 * receivedSize / expectedSize );
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            [_progress setProgress:percent animated:YES];
            
            
            
        });
        
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
         self.progress.hidden = YES ;
        self.image.image = image;
        
        switch (cacheType) {
              case SDImageCacheTypeNone:
                NSLog(@"直接下载");
                break;
              case SDImageCacheTypeDisk:
                NSLog(@"磁盘缓存");
                break;
              case SDImageCacheTypeMemory:
                NSLog(@"内存缓存");
                break;
              default:
                break;
        }
        
        
    }];
    
    
    
    
    
}



-(void) download{

NSString *url = @"http://imgsrc.baidu.com/forum/pic/item/73c1209759ee3d6d439559664f166d224d4adecc.jpg";


[self.image sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"btn_network"] options:SDWebImageCacheMemoryOnly completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    
    self.image.image  =  image ;
    
}];
    
}
@end
