//
//  FTContainerSegementCell.m
//  FTContainerController
//
//  Created by liufengting on 2018/2/9.
//  Copyright © 2018年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import "FTContainerSegementCell.h"

@interface FTContainerSegementCell ()

@property (nonatomic, weak) FTContainerConfig *config;

@end

@implementation FTContainerSegementCell

- (void)setupWithTitle:(NSString *)title config:(FTContainerConfig *)config
{
    self.config = config;
    self.titleLabel.text = title;
    
    self.titleLabel.textColor = config.segementTitleDefaultColor;
    self.titleLabel.font = [UIFont systemFontOfSize:config.segementTitleDefaultFontSize];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (!self.config) {
        return;
    }
    self.titleLabel.textColor = selected ? self.config.segementTitleSelectedColor : self.config.segementTitleDefaultColor;
    self.titleLabel.font = selected ? [UIFont boldSystemFontOfSize:self.config.segementTitleSelectedFontSize] : [UIFont systemFontOfSize:self.config.segementTitleDefaultFontSize];
}

- (void)updateWithPercent:(CGFloat)percent
{
    
}

@end
