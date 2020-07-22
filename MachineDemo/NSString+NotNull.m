//
//  NSString+NotNull.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/19.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "NSString+NotNull.h"

@implementation NSString (NotNull)

- (BOOL)isEmpty {    
    return (self == NULL || self.length == 0);

}


@end
