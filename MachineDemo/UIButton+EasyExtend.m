//
//  UIButton+EasyExtend.m
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/18.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import "UIButton+EasyExtend.h"



#undef    NAV_BUTTON_MIN_WIDTH
#define    NAV_BUTTON_MIN_WIDTH    (40.0f)

#undef    NAV_BUTTON_MIN_HEIGHT
#define    NAV_BUTTON_MIN_HEIGHT    (40.0f)

#undef    NAV_BAR_HEIGHT
#define    NAV_BAR_HEIGHT    (44.0f)

@implementation UIButton (EasyExtend)

-(UIButton *)initNavigationButton:(UIImage *)image{
    CGRect buttonFrame = CGRectZero;
    
    buttonFrame = CGRectMake(0, 0, image.size.width, NAV_BAR_HEIGHT);
    
    if ( buttonFrame.size.width >= NAV_BUTTON_MIN_WIDTH )
    {
        buttonFrame.size.width = NAV_BUTTON_MIN_WIDTH;
    }
    
    if ( buttonFrame.size.height >= NAV_BUTTON_MIN_HEIGHT )
    {
        buttonFrame.size.height = NAV_BUTTON_MIN_HEIGHT;
    }
    self = [self initWithFrame:buttonFrame];
    self.contentMode = UIViewContentModeScaleAspectFit;
    self.backgroundColor = [UIColor clearColor];
    [self setImage:image forState:UIControlStateNormal];
    return self;
}
-(UIButton *)initNavigationButtonWithTitle:(NSString *)str color:(UIColor *)color{
    CGRect buttonFrame = CGRectZero;
    
    CGSize titleSize = [str boundingRectWithSize:CGSizeMake(999999.0f, NAV_BAR_HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]} context:nil].size;
    
    buttonFrame = CGRectMake(0, 0, titleSize.width, NAV_BAR_HEIGHT);
    
    
    self = [self initWithFrame:buttonFrame];
    self.contentMode = UIViewContentModeScaleAspectFit;
    self.backgroundColor = [UIColor clearColor];
    self.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitle:str forState:UIControlStateNormal];
    return self;
}
@end

