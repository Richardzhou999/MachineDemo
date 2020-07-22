//
//  LoginRequest.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/19.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest{
    
    NSString *_name;
    NSString *_password;
    
    
}

- (id)initWithLogin:(NSString *)name password:(NSString *)password
{
    self = [super init];
    
    
    if(self){
        _name = name;
        _password = password;
        
        
    }
    
    return self;
    
}



- (NSString *)requestUrl{
    return @"/api/unis/bus/loginBusAccount";
}

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}

- (id)requestArgument{
    return @{
             @"name":_name,
             @"password":_password
             };
}

- (LoginResult *)result{
    NSError *err;
    LoginResult *result = [[LoginResult alloc]initWithDictionary:[self responseJSONObject] error:&err];
    if (err == nil) {
        return result;
    }
    return nil;
}



@end
