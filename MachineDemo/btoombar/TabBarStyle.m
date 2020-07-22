//
//  TabBarStyle.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/20.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "TabBarStyle.h"

@implementation TabBarStyle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
          
    }
    return self;
}

- (void)initWithTabBar:(UITabBarItem *)tabBarItem title:(NSString *)title titleSize:(CGFloat)size  normalTitleColor:(UIColor *)normalTitleColor selectTitleColor:(UIColor *)selectTitleColor normalImage:(NSString *)normalImage selectImage:(NSString *)selectImage
{
    
    tabBarItem = [tabBarItem initWithTitle:title image:[[UIImage imageNamed:normalImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //未选中
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:normalTitleColor,NSFontAttributeName:[UIFont systemFontOfSize:size]} forState:UIControlStateNormal];
    
    //选中
     [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:selectTitleColor,NSFontAttributeName:[UIFont systemFontOfSize:size]} forState:UIControlStateSelected];
    
    
    
    
    
}



@end
