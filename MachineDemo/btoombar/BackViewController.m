//
//  BackViewController.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/21.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "BackViewController.h"

@interface BackViewController ()

@end

@implementation BackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 9, 100, 50)];
    [button setTitle:@"hello word" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backroot) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
       button.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:button];
    
}

- (void)dealloc
{
    NSLog(@"");
}

-(void) backroot{
    
    
    //self.tabBarController.selectedIndex = 1;
       // self.tabBarController.tabBar.hidden = NO;
//        if (![self isEqual:focusNav.viewControllers.firstObject]) {
//
//        }
      [self.navigationController popToRootViewControllerAnimated:NO];
 
   
    //[self.navigationController popToRootViewControllerAnimated:YES];
    
    
    
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
