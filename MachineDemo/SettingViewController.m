//
//  SettingViewController.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/18.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "SettingViewController.h"
#import "NSString+NotNull.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.view.backgroundColor = [UIColor jk_colorWithHexString:Color_Bottom];
    
    UILabel *account = [[UILabel alloc] initWithFrame:CGRectZero];
    account.text = @"账号";
    [self.view addSubview:account];
    [account mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(18);
        make.left.equalTo(self.view.mas_left).offset(10);
        
        
    }];
    
    UILabel *password = [[UILabel alloc] initWithFrame:CGRectZero];
    password.text = @"账号";
    [self.view addSubview:password];
    [password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(account.mas_bottom).offset(18);
        make.left.equalTo(account.mas_left);
    
    }];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 5;
    
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(password.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.height.mas_equalTo(30);
        
    }];
    
    
    UIButton *blockbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    blockbutton.backgroundColor = [UIColor orangeColor];
    [blockbutton setTitle:@"block无返回值" forState:UIControlStateNormal];
    [blockbutton addTarget:self action:@selector(block1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blockbutton];
    [blockbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(button.mas_bottom).offset(20);
        make.left.equalTo(self.view.mas_left).offset(30);
               make.right.equalTo(self.view.mas_right).offset(-20);
               make.height.mas_equalTo(30);
        
        
    }];
    
    UIButton *blockbutton1 = [UIButton buttonWithType:UIButtonTypeCustom];
       blockbutton1.backgroundColor = [UIColor orangeColor];
       [blockbutton1 setTitle:@"block返回值" forState:UIControlStateNormal];
       [blockbutton1 addTarget:self action:@selector(block2) forControlEvents:UIControlEventTouchUpInside];
       [self.view addSubview:blockbutton1];
       [blockbutton1 mas_makeConstraints:^(MASConstraintMaker *make) {
           
           make.top.equalTo(blockbutton.mas_bottom).offset(20);
           make.left.equalTo(self.view.mas_left).offset(30);
                  make.right.equalTo(self.view.mas_right).offset(-20);
                  make.height.mas_equalTo(30);
           
           
       }];
    
     
    

}

-(void)block2{
    
    LoginEntity *entity = [[LoginEntity alloc] init];
    entity.name = @"妹妹";
    entity.email = @"98213232@QQ.COM";
    
    
    
    NSString *str =   self.myBlock2(entity);
    NSLog(@"这是返回再返回的值%@",str);
    
//        void(^block2)(NSString *,NSString *) = ^(NSString *str,NSString *str1) {
//            <#statements#>
//        };

    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (BOOL) isBlankString:(NSString *)string {//判断字符串是否为空 方法

    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}


-(void)block1{
    
    __weak typeof(self) weakSelf = self;
    
    !weakSelf.myBlock? : weakSelf.myBlock(@"这得到的值");
    [self.navigationController popViewControllerAnimated:YES];
       
    
}


-(void) fanhui{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notq3" object:[NSString stringWithFormat:@"%@",@"我草，好饿"]];
    
    
}


- (void)dealloc
{
    NSLog(@"SSSS");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
