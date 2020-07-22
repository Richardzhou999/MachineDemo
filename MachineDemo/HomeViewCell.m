//
//  HomeViewCell.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/18.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "HomeViewCell.h"

@implementation HomeViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _ivThumb = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_ivThumb];
        [_ivThumb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(-15);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        _labName = [[UILabel alloc]initWithFrame:CGRectZero];
        _labName.textAlignment = NSTextAlignmentCenter;
        _labName.font = [UIFont systemFontOfSize:FONT_MIDDLE *KWidth_scale];
        _labName.textColor = [UIColor jk_colorWithHexString:Color_Black_one];
        [self.contentView addSubview:_labName];
        [_labName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_ivThumb.mas_bottom).offset(10);
            make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
            make.size.mas_equalTo(CGSizeMake(70, 16));
        }];
    }
    return self;
}

- (void)reloadName:(PermissionsEntity *)entity{
    _ivThumb.image = [UIImage imageNamed:entity.icon];
    _labName.text = entity.display_name;
}


@end
