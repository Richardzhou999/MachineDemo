//
//  HomeViewCell.h
//  MachineDemo
//
//  Created by 吕飞雄 on 2020/3/18.
//  Copyright © 2020 吕飞雄. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PermissionsEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView *ivThumb;
@property(nonatomic,strong)UILabel *labName;

-(void) reloadName:(PermissionsEntity *) entity;



@end

NS_ASSUME_NONNULL_END
