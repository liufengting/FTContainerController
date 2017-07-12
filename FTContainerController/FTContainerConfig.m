//
//  FTContainerConfig.m
//  FTContainerController
//
//  Created by LiuFengting on 2017/7/12.
//  Copyright © 2017年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import "FTContainerConfig.h"

#define SCREEN_WIDTH                [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT               [UIScreen mainScreen].bounds.size.height
#define HEAD_SEGEMENT_HEIGHT        40.f
#define NAVIGATION_HEIGHT           64.f//self.navigationController.navigationBar.bounds.size.height

@implementation FTContainerConfig

+ (FTContainerConfig *)defaultConfig
{
    FTContainerConfig * config = [[FTContainerConfig alloc] initWithSegementViewFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEAD_SEGEMENT_HEIGHT)
                                                                      scrollViewFrame:CGRectMake(0, HEAD_SEGEMENT_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - HEAD_SEGEMENT_HEIGHT - NAVIGATION_HEIGHT)
                                                                               margin:25
                                                                      defaultFontSize:13
                                                                     selectedFontSize:13
                                                                         defaultColor:[UIColor lightGrayColor]
                                                                        selectedColor:[UIColor blackColor]
                                                                         fillSegement:YES];
    config.segementIndicatorColor = [UIColor redColor];
    config.segementEnableScrolling = YES;
    config.contentEnableScrolling = YES;
    return config;
}

- (instancetype)initWithSegementViewFrame:(CGRect)segementViewframe scrollViewFrame:(CGRect)scrollViewFrame margin:(CGFloat)margin defaultFontSize:(CGFloat)defaultFontSize selectedFontSize:(CGFloat)selectedFontSize defaultColor:(UIColor *)defaultColor selectedColor:(UIColor *)selectedColor fillSegement:(BOOL)fillSegement
{
    self = [super init];
    if (self) {
        self.segementViewFrame = segementViewframe;
        self.scrollViewFrame = scrollViewFrame;
        self.segementTitleMargin = margin;
        self.segementTitleDefaultFontSize = defaultFontSize;
        self.segementTitleSelectedFontSize = selectedFontSize;
        self.segementTitleDefaultColor = defaultColor;
        self.segementTitleSelectedColor = selectedColor;
        self.fillSegement = fillSegement;
    }
    return self;
}

- (CGFloat)segementIndicatorHeight
{
    return MAX(_segementIndicatorHeight, 2);
}

- (UIColor *)segementIndicatorColor
{
    if (!_segementIndicatorColor) {
        _segementIndicatorColor = [UIColor redColor];
    }
    return _segementIndicatorColor;
}

@end

@implementation FTContainerTitleModel

- (instancetype)initWithTitle:(NSString *)title titleFont:(UIFont *)titleFont
{
    self = [super init];
    if (self) {
        self.title = title;
        self.titleFont = titleFont;
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    [self calculateTitleWidth];
}

- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    [self calculateTitleWidth];
}

- (void)calculateTitleWidth
{
    if (!_title || !_titleFont) {
        return;
    }

    CGRect rect = [_title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 20)
                                       options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                    attributes:@{NSFontAttributeName : _titleFont}
                                       context:nil];
    _titleWidth = rect.size.width;
    _titleHeight = rect.size.height;
}

@end
