//
//  HomeUserRequest.h
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/18.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeResult.h"
#import <YTKRequest.h>
#import "Baserequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeUserRequest : Baserequest

-(HomeResult *) result;

@end

NS_ASSUME_NONNULL_END
