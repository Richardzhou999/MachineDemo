//
//  TabBarController.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/20.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "TabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "TabBarStyle.h"

@interface TabBarController ()

@property(nonatomic,strong) FirstViewController *first;
@property(nonatomic,strong) SecondViewController *second;
@property(nonatomic,strong) ThreeViewController *three;


@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initUI];
    
}


-(void) initUI{
    
    _first = [[FirstViewController alloc] init];
    _second = [[SecondViewController alloc]init];
    _three = [[ThreeViewController alloc] init];
    _first.title = @"第一页面";
    _second.title = @"第er页面";
    _three.title = @"第一页面";
    
     
    [[TabBarStyle alloc] initWithTabBar:_first.tabBarItem title:@"首页" titleSize:13.0  normalTitleColor:[UIColor redColor] selectTitleColor:[UIColor orangeColor] normalImage:@"wx_pay" selectImage:@"ic_dots_three"];
    
    [[TabBarStyle alloc] initWithTabBar:_second.tabBarItem title:@"博文" titleSize:13.0  normalTitleColor:[UIColor redColor] selectTitleColor:[UIColor orangeColor] normalImage:@"wx_pay" selectImage:@"ic_dots_three"];
    
       [[TabBarStyle alloc] initWithTabBar:_three.tabBarItem title:@"查人" titleSize:13.0  normalTitleColor:[UIColor redColor] selectTitleColor:[UIColor orangeColor] normalImage:@"wx_pay" selectImage:@"ic_dots_three"];
          
    

    UINavigationController *NVFirst = [[UINavigationController alloc] initWithRootViewController:_first];
    UINavigationController *NVSecond = [[UINavigationController alloc] initWithRootViewController:_second];
    UINavigationController *NVThree = [[UINavigationController alloc] initWithRootViewController:_three];
    
    
    
    self.viewControllers =@[NVFirst,NVSecond,NVThree];
    
       
    
    
    
}








@end
