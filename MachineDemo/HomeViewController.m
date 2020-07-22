//
//  HomeViewController.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/18.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "HomeViewController.h"
#import "SecordViewController.h"
#import "HomeLeft.h"
#import "UIButton+EasyExtend.h"
#import "SettingViewController.h"
#import "HomeViewCell.h"
#import "HomeUserRequest.h"
#import "HomeResult.h"
#import "HomeAdminEntity.h"
#import "TestViewController.h"
#import "TabBarController.h"

@interface HomeViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) HomeLeft *homeleft;
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *dataAdmin;//用户权限


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self initUI];
    

    [self huoqu];
    
    
    [self Getdata];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onClickScuuess:) name:@"onClick" object:nil];
    
    
}


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [KUserDefaults removeObjectForKey:@"push"];
    //状态栏白色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    NSString *token = [KUserDefaults valueForKey:YYBStoreToken];
    NSLog(@"token:%@",token);
    
}


#pragma mark - 数据获取

-(void) Getdata{
    
    HomeUserRequest * requset = [[HomeUserRequest alloc] init];
    
    [requset startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        HomeUserRequest *req = (HomeUserRequest *)requset;
        HomeResult *result = [req result];
        
        HomeAdminEntity *entity = result.data;
        
        //用户权限
        [self.dataAdmin removeAllObjects];
        
        [self.dataAdmin addObjectsFromArray:entity.permissionsInfo];
        
        [self.collectionView reloadData];
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}




#pragma mark -通知

-(void) onClickScuuess:(NSNotification *)notification{
    
        NSLog(@"%@",notification.userInfo[@"onclick"]);
}



-(void) initUI{
    
//    _homeleft = [[HomeLeft alloc] initWithFrame:CGRectMake(0, 0, 120, 50)];
//    //_homeleft.ivAdmin = ;
//    _homeleft.ivlabelAdmin.text = @"第一管理员";
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:_homeleft];
//    self.navigationItem.leftBarButtonItem = leftItem;
//    
//    UIButton *button = [[UIButton alloc] initNavigationButton:[UIImage imageNamed:@"nav_right_setting"]];
//    [button addTarget:self action:@selector(rightButtonTouch) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.rightBarButtonItem = nil;
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    //[self.view addSubview:_homeleft];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];

    label.cas_styleClass = @"loginTitle";
    label.text = @"我去";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.top.equalTo(self.view.mas_top).offset(1);
        make.size.mas_equalTo(CGSizeMake(280, 16));
    }];
    
    
    UIButton *ImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [ImageButton setTitle:@"图片加在" forState:UIControlStateNormal];
    ImageButton.backgroundColor = [UIColor yellowColor];
    [ImageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     ImageButton.font = [UIFont systemFontOfSize:FONT_MIDDLE *KWidth_scale];
    [ImageButton addTarget:self action:@selector(Imageload) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ImageButton];
    [ImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
           
           make.top.equalTo(self.view.mas_top).offset(20);
        make.left.equalTo(self.view.mas_left).offset(20);
           make.size.mas_equalTo(CGSizeMake(50, 30));
       }];
    
    
    UIButton *UITabBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [UITabBarButton setTitle:@"底部导航" forState:UIControlStateNormal];
    UITabBarButton.backgroundColor = [UIColor yellowColor];
    UITabBarButton.font =[UIFont systemFontOfSize:FONT_MIDDLE *KWidth_scale];
    [UITabBarButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:UITabBarButton];
    [UITabBarButton addTarget:self action:@selector(TarBar) forControlEvents:UIControlEventTouchUpInside];
    [UITabBarButton mas_makeConstraints:^(MASConstraintMaker *make) {
           
           make.top.equalTo(self.view.mas_top).offset(20);
        make.left.equalTo(ImageButton.mas_left).offset(20*3);
           make.size.mas_equalTo(CGSizeMake(50, 30));
       }];
    
    
    
    
    
     UICollectionViewFlowLayout *flowLayout2 = [[UICollectionViewFlowLayout alloc]init];
       [flowLayout2 setScrollDirection:UICollectionViewScrollDirectionVertical];
    
       _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, KMainScreenWidth * 0.7, KMainScreenWidth, KMainScreenHeigth - 64 - KMainScreenWidth * 0.7) collectionViewLayout:flowLayout2];
    
    _collectionView.backgroundColor = [UIColor blueColor];
    _collectionView.delegate  = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    
    [_collectionView registerClass:[HomeViewCell class] forCellWithReuseIdentifier:@"Homecell"];
    [self.view addSubview:_collectionView];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiq3:) name:@"notq3" object:nil];
}


-(void)Imageload{
    
    TestViewController *test = [[TestViewController alloc] init];
           test.hidesBottomBarWhenPushed = YES;
           [self.navigationController pushViewController:test animated:YES];
        
}

-(void)TarBar{
    
    TabBarController *tabBar = [[TabBarController alloc] init];
    tabBar.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:tabBar animated:YES];
    
    
    
    
}


-(void) notiq3:(NSNotification *)noti{
    
    NSString *str = [noti object];
    
    NSLog(@"接受的小事，%@",str);
    
}

#pragma mark - UIConllectionView

//显示多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//显示多少行或多少项
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataAdmin.count;
    
}

//设置每项的数据（等等）
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *index = @"Homecell";
    
    
    
    HomeViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:index forIndexPath:indexPath];
    
    
    PermissionsEntity *perentity = [self.dataAdmin objectAtIndex:indexPath.row];
    [cell reloadName:perentity];
    
    
    return cell;
    
    
}

//监听选择
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row == 0){
        
        TestViewController *test = [[TestViewController alloc] init];
        test.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:test animated:YES];
        
    }
    
    
    
}






-(void)rightButtonTouch{
    
    SettingViewController *setting = [SettingViewController new];
    setting.hidesBottomBarWhenPushed = YES;
//    [setting setMyBlock:^(NSString * _Nonnull str) {
//        NSLog(@"block拿到的值 %@",str);
//    }];
    [setting setMyBlock2:^NSString * _Nonnull(LoginEntity * _Nonnull loginEntity) {
        
        
        NSString *str = [NSString stringWithFormat:@"%@",loginEntity.name];
        
        return str;
    }];
    [self.navigationController pushViewController:setting animated:YES];
    
}

-(void) huoqu{
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if (device) {
            
            if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1) {
                // Pre iOS 8 -- No camera auth required.
            }else {
                // iOS 8 后，全部都要授权
                AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
                switch (status) {
                    case AVAuthorizationStatusNotDetermined:{
                        // 许可对话没有出现，发起授权许可
                        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                            if (granted) {
                                //第一次用户接受
                                //[LYURLRouter openURL:perEntity.scheme];
                                NSLog(@"用户接受了");
                            }
                        }];
                    }
                        break;
                    case AVAuthorizationStatusAuthorized:{
                        // 已经开启授权，可继续
                        //第一次用户接受
                        //[LYURLRouter openURL:perEntity.scheme];
                        NSLog(@"用户已经开启授权");
                    }
                        break;
                    case AVAuthorizationStatusDenied:{
                        [self isShow];
                    }
                        break;
                    case AVAuthorizationStatusRestricted:{
                        // 无权限
                        [self isShow];
                        // 用户明确地拒绝授权，或者相机设备无法访问
                    }
                        break;
                    default:
                        break;
                        
                }
            }
            
        } else {
            NSLog(@"请打开摄像头");
        }
}

-(void) isShow{
    
    if([[[UIDevice currentDevice] systemVersion] doubleValue] < 8.0){
        
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示书" message:@" keyi,很好" delegate:self cancelButtonTitle:@"zhidaole" otherButtonTitles:@"很好",@"sss"];
        [alter show];

    }else{
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"tishi" message:@"真好" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }];
        
        [controller addAction:cancel];
        [self presentViewController:controller animated:YES completion:NULL];
    }
    
    
    
    
    
    
    
    
    
}


- (void)presentToScanExchange{
    // 获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        SecordViewController *sacnQrcode = [SecordViewController new];
        sacnQrcode.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
        [self presentViewController:sacnQrcode animated:YES completion:^{
        }];
    } else {
        NSLog(@"请打开摄像头");
    }
}

-(void)onClick{
    
    SecordViewController *secord = [[SecordViewController alloc] init];
//    [self.navigationController pushViewController:secord animated:YES];
    
    [self.navigationController presentViewController:secord animated:YES completion:NULL];
    
    
    
}

- (NSMutableArray *)dataAdmin{
    if (!_dataAdmin) {
        _dataAdmin = [NSMutableArray new];
    }
    return _dataAdmin;
}

@end
