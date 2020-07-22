//
//  GetTokeMethod.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/19.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "GetTokenMethod.h"

@implementation GetTokenMethod

+ (NSString *)getToken {
    
    NSString *token = [KUserDefaults valueForKey:YYBStoreToken];
       if (token.length == 0) {
           token = @"";
       }
       NSLog(@"=======%@",token);
       return token;
    
    
}

@end
