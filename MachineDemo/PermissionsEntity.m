//
//  PermissionsEntity.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/18.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "PermissionsEntity.h"

@implementation PermissionsEntity

//json的key和模型的属性名不一致，利用该方法重新赋值
+(JSONKeyMapper *)keyMapper{
    //字典的key为json的key，字典的值，为模型的属性名。
    return [[JSONKeyMapper alloc]
            initWithDictionary:@{@"description":@"descriptionStr"}];
}

@end
