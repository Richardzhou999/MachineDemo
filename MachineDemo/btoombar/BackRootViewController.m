//
//  BackRootViewController.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/20.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "BackRootViewController.h"
#import "BackViewController.h"

@interface BackRootViewController ()

@end

@implementation BackRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"返回";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 9, 100, 50)];
       [button setTitle:@"hello word" forState:UIControlStateNormal];
       [button addTarget:self action:@selector(backroot) forControlEvents:UIControlEventTouchUpInside];
       [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
          button.backgroundColor = [UIColor yellowColor];
       [self.view addSubview:button];
       
    
}

-(void) backroot{
    
    BackViewController *back = [[BackViewController alloc] init];
    [self.navigationController pushViewController:back animated:YES];
    
    
    
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
