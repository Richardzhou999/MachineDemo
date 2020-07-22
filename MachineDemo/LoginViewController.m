//
//  LoginViewController.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/17.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"
#import "LoginResult.h"
#import "LoginRequest.h"
#import "NSString+NotNull.h"
#import <MBProgressHUD.h>


@interface LoginViewController ()

@property(nonatomic,strong) UIImageView *ivHeader;
@property(nonatomic,strong) UITextField *tfUser;
@property(nonatomic,strong) UITextField *tfPassword;
@property(nonatomic,strong) UIView *ivBack;
@property(nonatomic,strong) UILabel *label;
@property(nonatomic,strong) UIButton *btnLogin;



@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self initUI];
}

//- (void)viewWillAppear:(BOOL)animated{
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
//}
//
//- (void)viewDidDisappear:(BOOL)animated{
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//}




-(void) initUI{

    _ivHeader = [[UIImageView alloc] initWithFrame:CGRectZero];
    _ivHeader.image = [UIImage imageNamed:@"main_iv_header"];

    [self.view addSubview:_ivHeader];
    [_ivHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.top.equalTo(self.view.mas_top).offset(100 * KHeight_scale);
        make.size.mas_equalTo(CGSizeMake(120  * KWidth_scale, 120 * KWidth_scale));
    }];
    
    
    
    _label = [[UILabel alloc] initWithFrame:CGRectZero];
    _label.cas_styleClass = @"LOINGTitle";
    
    _label.cas_styleClass = @"loginTitle";
    _label.text = @"我去";
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.top.equalTo(_ivHeader.mas_bottom).offset(18);
        make.size.mas_equalTo(CGSizeMake(280, 16));
    }];
    
    _ivBack = [[UIView alloc] initWithFrame:CGRectZero];
    _ivBack.backgroundColor = [UIColor whiteColor];
    _ivBack.layer.masksToBounds = YES;
    _ivBack.layer.cornerRadius = 5.0;
    _ivBack.layer.borderWidth = 1.0;
    _ivBack.layer.borderColor = [[UIColor jk_colorWithHexString:Color_Line]CGColor];
    [self.view addSubview:_ivBack];
    
    [_ivBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_label.mas_bottom).offset(60 * KHeight_scale);
           make.left.equalTo(self.view.mas_left).offset(30);
           make.right.equalTo(self.view.mas_right).offset(-30);
           make.height.mas_equalTo(100);
       }];
    
    
    
    
    _tfUser = [[UITextField alloc]initWithFrame:CGRectZero];
    _tfUser.cas_styleClass = @"login";
    _tfUser.placeholder = @"用户名";
    _tfUser.clearButtonMode = UITextFieldViewModeWhileEditing;
    [_ivBack addSubview:_tfUser];
    [_tfUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_ivBack.mas_left).offset(10);
        make.top.equalTo(self->_ivBack.mas_top).offset(5);
        make.right.equalTo(self->_ivBack.mas_right).offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    _tfPassword = [[UITextField alloc] initWithFrame:CGRectZero];
    _tfPassword.cas_styleClass = @"login";
    _tfPassword.placeholder = @"密码";
    //设置密码形式
    [_tfPassword setSecureTextEntry:YES];
    _tfPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    [_ivBack addSubview:_tfPassword];
    [_tfPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_ivBack.mas_left).offset(10);
        make.bottom.equalTo(self->_ivBack.mas_bottom).offset(-5);
        make.right.equalTo(self->_ivBack.mas_right).offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    _btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnLogin.cas_styleClass = @"yellow";
    _btnLogin.backgroundColor = [UIColor orangeColor];
    [_btnLogin setTitle:@"登录" forState:UIControlStateNormal];
    _btnLogin.layer.masksToBounds = YES;
    _btnLogin.layer.cornerRadius = 3;
    [_btnLogin addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnLogin];
    [_btnLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self -> _ivBack.mas_bottom).offset(35 * KHeight_scale);
        make.left.equalTo(self.view.mas_left).offset(50);
        make.right.equalTo(self.view.mas_right).offset(-50);
        make.height.mas_equalTo(42);
    }];

}

-(void) loginClick{
    
    NSString *name = _tfUser.text;
    NSString *password = _tfPassword.text;
    
    if ([name isEmpty]) {
        [self showMessageDialog:@"请输入用户名"];
        return;
    }
    
    if ([password isEmpty]) {
        [self showMessageDialog:@"请输入密码"];
        return;
    }
    
    NSString *pwMd5 = [password jk_md5String];
    NSLog(@"pwMd5:%@",pwMd5);
    LoginRequest *req = [[LoginRequest alloc] initWithLogin:name password:pwMd5];
    [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        LoginRequest *reqq = request;
        LoginResult * result = [reqq result];
        
        if([result isSuccess]){
            
            LoginEntity *entity = result.data;
            
           [KUserDefaults setValue:entity.token forKey:YYBStoreToken];
            
            [self login];
        }
        
        
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
    
    
    
    
   
    
    
}

-(void) login{
    
    [UIView transitionWithView:[[UIApplication sharedApplication].delegate window] duration:0.3 options: UIViewAnimationOptionTransitionCrossDissolve animations:^{
           BOOL oldState=[UIView areAnimationsEnabled];
           [UIView setAnimationsEnabled:NO];
           HomeViewController *homeViewCrl = [[HomeViewController alloc] init];
           UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:homeViewCrl];
           [UIApplication sharedApplication].keyWindow.rootViewController= nav;
           //            [homeViewCrl showLoginSuccess];
           [UIView setAnimationsEnabled:oldState];
       }completion:NULL];
    
}


- (void)showMessageDialog:(NSString *)message {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.yOffset = -30;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2.f];
}

@end
