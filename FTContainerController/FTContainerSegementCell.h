//
//  FTContainerSegementCell.h
//  FTContainerController
//
//  Created by liufengting on 2018/2/9.
//  Copyright © 2018年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTContainerConfig.h"

@interface FTContainerSegementCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)setupWithTitle:(NSString *)title config:(FTContainerConfig *)config;

- (void)updateWithPercent:(CGFloat)percent;

@end
