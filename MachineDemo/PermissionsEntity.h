//
//  PermissionsEntity.h
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/18.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PermissionsEntity;

@interface PermissionsEntity : JSONModel

@property(nonatomic,strong) NSString<Optional> *scheme;
@property(nonatomic,assign) int addtime;
@property(nonatomic,strong)NSString<Optional> *name;
@property(nonatomic,strong)NSString<Optional> *icon;
@property(nonatomic,strong)NSString<Optional> *descriptionStr;
@property(nonatomic,assign) int id;
@property(nonatomic,strong)NSString<Optional> *display_name;
@property(nonatomic,assign)BOOL status;

@end

NS_ASSUME_NONNULL_END
