//
//  FTContainerSegementCell.m
//  FTContainerController
//
//  Created by liufengting on 16/7/21.
//  Copyright © 2017年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import "FTContainerSegementCell.h"

@interface FTContainerSegementCell ()

@property (nonatomic, assign)FTContainerConfig *config;

@end

@implementation FTContainerSegementCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.frame = self.bounds;
}

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

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (void)updateWithPercentage:(CGFloat)percentage
{

}

@end
