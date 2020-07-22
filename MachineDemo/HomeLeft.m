//
//  HomeLeft.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/18.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "HomeLeft.h"

@implementation HomeLeft

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _ivAdmin = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iv_admin"]];
        [self addSubview:_ivAdmin];
        
        _ivlabelAdmin = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 120, 30)];
        _ivlabelAdmin.text = @"SSSS";
        _ivlabelAdmin.textColor = [UIColor whiteColor];
        _ivlabelAdmin.font = [UIFont systemFontOfSize:15];
        [self addSubview:_ivlabelAdmin];
        
        
        
    }
    return self;
}

@end
