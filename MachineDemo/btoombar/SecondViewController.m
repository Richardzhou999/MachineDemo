//
//  SecondViewController.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/20.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property(nonatomic,strong) UIImageView *ivHeader;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
      self.navigationController.title = @"第一页面";
    
    _ivHeader = [[UIImageView alloc] initWithFrame:CGRectZero];
    _ivHeader.image = [UIImage imageNamed:@"main_iv_header"];

    [self.view addSubview:_ivHeader];
    [_ivHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.top.equalTo(self.view.mas_top).offset(100 * KHeight_scale);
        make.size.mas_equalTo(CGSizeMake(120  * KWidth_scale, 120 * KWidth_scale));
    }];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    [button setTitle:@"hello word" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
     [self.view addSubview:button];
    
    [button addTarget:self action:@selector(zhenhao) forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view.mas_centerX).offset(10);
        make.top.equalTo(_ivHeader.mas_top).offset(100 * KHeight_scale);
        make.size.mas_equalTo(CGSizeMake(120  * KWidth_scale, 120 * KWidth_scale));
        
    }];
   
    
    
}

-(void)zhenhao{
    
   
}

@end
