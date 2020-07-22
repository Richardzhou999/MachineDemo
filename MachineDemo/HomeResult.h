//
//  HomeResult.h
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/18.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeAdminEntity.h"
#import <JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeResult : JSONModel

@property(nonatomic,strong)HomeAdminEntity<HomeAdminEntity,Optional> *data;


@end

NS_ASSUME_NONNULL_END
