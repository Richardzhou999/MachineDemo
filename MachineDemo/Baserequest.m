//
//  Baserequest.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/19.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "Baserequest.h"
#import "GetTokenMethod.h"

@implementation Baserequest


- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary
{
    
    return @{
        
    
        @"token": [GetTokenMethod getToken]//登录token
        
    };
    
    
}




@end
