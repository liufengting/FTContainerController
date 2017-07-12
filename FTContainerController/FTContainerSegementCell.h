//
//  FTContainerSegementCell.h
//  FTContainerController
//
//  Created by liufengting on 16/7/21.
//  Copyright © 2017年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTContainerConfig.h"

@interface FTContainerSegementCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLabel;

- (void)setupWithTitle:(NSString *)title config:(FTContainerConfig *)config;

- (void)updateWithPercentage:(CGFloat)percentage;

@end
