//
//  BaseNavViewController.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/19.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *backButtonImage = [[UIImage imageNamed:@"nav_back_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
       self.navigationBar.backIndicatorImage = backButtonImage;
       self.navigationBar.backIndicatorTransitionMaskImage = backButtonImage;
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
