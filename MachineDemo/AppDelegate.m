//
//  AppDelegate.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/17.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "TestViewController.h"
#import <IQKeyboardManager.h>
#import <YTKNetwork.h>
#import "HomeViewController.h"
#import "BaseNavViewController.h"
#import "TabBarController.h"
#import "ViewController.h"

// 引入 JPush 功能所需头文件
#import "JPUSHService.h"

// iOS10 注册 APNs 所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif


@interface AppDelegate () <JPUSHRegisterDelegate,JPUSHGeofenceDelegate>
//@property(nonatomic,strong)JPushView *jpushView;
@property(nonatomic,strong)NSDictionary *userInfo;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
       manager.enable = YES;
       manager.shouldResignOnTouchOutside = YES;
       manager.shouldToolbarUsesTextFieldTintColor = YES;
       manager.enableAutoToolbar = NO;
    
    //[NSThread sleepForTimeInterval:2.0];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    NSString *token = [KUserDefaults valueForKey:YYBStoreToken];
    if(token && token.length != 0){
        
//        HomeViewController *home = [[HomeViewController alloc] init];
//        BaseNavViewController *nav = [[BaseNavViewController alloc] initWithRootViewController:home];
//        self.window.rootViewController = nav;
        
        TabBarController *tabbar = [[TabBarController alloc] init];
        self.window.rootViewController = tabbar;
        
//        LoginViewController *login = [[LoginViewController alloc] init];
//               //TestViewController *test = [[TestViewController alloc] init];
//               
//               self.window.rootViewController = login;
        
        
    }else{
        
        ViewController *viewc = [[ViewController alloc]init];
    
        LoginViewController *login = [[LoginViewController alloc] init];
        //TestViewController *test = [[TestViewController alloc] init];
        
        
        self.window.rootViewController = viewc;
    }
    
   [self.window makeKeyAndVisible];
    
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = @"https://iot.universal-space.cn";
    
    
    //设置导航栏
    [[UINavigationBar appearance] setBarTintColor:[UIColor jk_colorWithHexString:Color_Pink]];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor blueColor],NSForegroundColorAttributeName,
                                                          [UIFont systemFontOfSize:16.0f],NSFontAttributeName,
                                                          nil]];
    
    //将返回按钮的文字position设置不在屏幕上显示
      [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-140, 0) forBarMetrics:UIBarMetricsDefault];
      //设置返回按钮字体大小和颜色 防止上一个界面标题过长影响下一界面导航栏标题往右偏移
      [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16.0f], NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateNormal];
    
    
    //Required
    //notice: 3.0.0 及以后版本注册可以这样写，也可以继续用之前的注册方式
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound|JPAuthorizationOptionProvidesAppNotificationSettings;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
      // 可以添加自定义 categories
      // NSSet<UNNotificationCategory *> *categories for iOS10 or later
      // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    
    // Required
     // init Push
     // notice: 2.1.5 版本的 SDK 新增的注册方法，改成可上报 IDFA，如果没有使用 IDFA 直接传 nil
     [JPUSHService setupWithOption:launchOptions appKey:appKey
                           channel:channel
                  apsForProduction:isProduction
             advertisingIdentifier:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(netWorkDidLogin:) name:kJPFNetworkDidLoginNotification object:nil];
    
    
    
    
    
    return YES;
}

- (void)netWorkDidLogin:(NSNotification *)notification{
    NSLog(@"registrationID:%@",[JPUSHService registrationID]);
    if ([JPUSHService registrationID]) {
        [KUserDefaults setValue:[JPUSHService registrationID] forKey:YYBRegistrationID];
    }
}


- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

  /// Required - 注册 DeviceToken
  [JPUSHService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
  //Optional
  NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

#pragma mark- JPUSHRegisterDelegate

// iOS 12 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification{
  if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    //从通知界面直接进入应用
  }else{
    //从通知设置界面进入应用
  }
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
  // Required
    
    [JPUSHService setBadge:0];
    
  NSDictionary * userInfo = notification.request.content.userInfo;
  if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    [JPUSHService handleRemoteNotification:userInfo];
      [self showJpushView:_userInfo];
  }
  //completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
  // Required
  NSDictionary * userInfo = response.notification.request.content.userInfo;
  if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    [JPUSHService handleRemoteNotification:userInfo];
      [self receivePush:_userInfo];
  }
  completionHandler(UNNotificationPresentationOptionSound);  // 系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {

  // Required, iOS 7 Support
  [JPUSHService handleRemoteNotification:userInfo];
  completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {

  // Required, For systems with less than or equal to iOS 6
  [JPUSHService handleRemoteNotification:userInfo];
}


- (void)showJpushView:(NSDictionary *)dic{
    NSDictionary *aps = [dic objectForKey:@"aps"];
    NSString *alert = [aps objectForKey:@"alert"];//收到推送内容
    NSString *scheme = [dic objectForKey:@"scheme"];//推送中的scheme
    NSLog(@"==%@",scheme);
//     = [[JPushView alloc]init];
//    [_jpushView show:alert];
//    if (scheme.length != 0) {//推送中带scheme
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
//        [_jpushView addGestureRecognizer:tap];
//}
}


//收到推送进行处理
- (void)receivePush:(NSDictionary *)dic {
    if (![dic count]) {
        return;
    }
    NSString *scheme = [dic objectForKey:@"scheme"];
    NSLog(@"sceeme====%@",scheme);
    if (scheme.length != 0) {
        NSMutableDictionary *mdic = [NSMutableDictionary dictionary];
        mdic[@"scheme"] = scheme;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"receive_push" object:nil userInfo:mdic];
        [KUserDefaults setValue:@"1" forKey:@"push"];
    }
}

#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
