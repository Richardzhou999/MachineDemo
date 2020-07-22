//
//  TabBarStyle.h
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/20.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TabBarStyle : UIView

//判断方向
@property(nonatomic,assign) int direction;

@property(nonatomic,strong) UIImageView *IamgeView;
@property(nonatomic,strong) UILabel *Label;

-(void) initWithTabBar:(UITabBarItem *)tabBarItem title:(NSString *)title titleSize:(CGFloat)size  normalTitleColor:(UIColor *)normalTitleColor selectTitleColor:(UIColor *)selectTitleColor
           normalImage:(NSString *)normalImage selectImage:(NSString *)selectImage;

@end

NS_ASSUME_NONNULL_END
