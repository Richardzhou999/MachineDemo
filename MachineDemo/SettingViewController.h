//
//  SettingViewController.h
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/18.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingViewController : UIViewController

@property(nonatomic,strong)void(^saveBlock)();
@property(nonatomic,strong)void(^myBlock)(NSString *str);
@property(nonatomic,strong)NSString *(^myBlock2)(LoginEntity *loginEntity);

@end

NS_ASSUME_NONNULL_END
