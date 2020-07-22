//
//  FirstViewController.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/20.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "FirstViewController.h"
#import "BackRootViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 9, 100, 50)];
    [button setTitle:@"hello word" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(zhenhao) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
}

-(void)zhenhao{
    
    BackRootViewController *back = [[BackRootViewController alloc] init];
    back.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:back animated:YES];

}

@end
