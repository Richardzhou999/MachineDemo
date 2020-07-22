//
//  HomeUserRequest.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/18.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "HomeUserRequest.h"

@implementation HomeUserRequest

- (NSString *)requestUrl{
    return @"/api/unis/bus/indexAppInfo";
}

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}

- (HomeResult *)result{
    
    NSError * err;
    HomeResult *result = [[HomeResult alloc] initWithDictionary:[self responseJSONObject] error:&err];
    if(err == nil){
        return result;
    }
    
    return nil;
    
    
}

@end
