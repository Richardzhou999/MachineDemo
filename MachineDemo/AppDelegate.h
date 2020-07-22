//
//  AppDelegate.h
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/17.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *appKey = @"71a4bf743d831b6c86840dbc";
static NSString *channel = @"AppStore";
static BOOL isProduction = TRUE; //0 表示采用的是开发证书  1 表示生产证书发布应用

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(nonatomic,strong) UIWindow *window;

@end

