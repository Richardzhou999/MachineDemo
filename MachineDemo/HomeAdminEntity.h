//
//  HomeAdminEntity.h
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/18.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PermissionsEntity.h"
#import <JSONModel/JSONModel.h>

@protocol  HomeAdminEntity;

@interface HomeAdminEntity : JSONModel

@property(nonatomic,strong)NSMutableArray<PermissionsEntity,Optional> *permissionsInfo;

@end


