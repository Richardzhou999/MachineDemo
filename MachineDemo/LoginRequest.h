//
//  LoginRequest.h
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/19.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Baserequest.h"
#import "LoginResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginRequest : Baserequest

-(id) initWithLogin:(NSString *)name password:(NSString *)password;

-(LoginResult *) result;


@end

NS_ASSUME_NONNULL_END
