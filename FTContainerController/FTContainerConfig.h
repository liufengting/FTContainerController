//
//  FTContainerConfig.h
//  FTContainerController
//
//  Created by liufengting on 2018/2/9.
//  Copyright © 2017年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTContainerConfig : NSObject

@property (nonatomic, assign) CGRect segementViewFrame;
@property (nonatomic, assign) CGRect scrollViewFrame;
@property (nonatomic, assign) CGFloat segementTitleMargin;
@property (nonatomic, assign) CGFloat segementTitleDefaultFontSize;
@property (nonatomic, assign) CGFloat segementTitleSelectedFontSize;
@property (nonatomic, strong) UIColor *segementTitleDefaultColor;
@property (nonatomic, strong) UIColor *segementTitleSelectedColor;
@property (nonatomic, assign) BOOL fillSegement;

@property (nonatomic, assign)CGFloat segementIndicatorHeight; // min is 2.0
@property (nonatomic, strong)UIColor *segementIndicatorColor; // default is red
@property (nonatomic, assign)BOOL segementEnableScrolling;
@property (nonatomic, assign)BOOL contentEnableScrolling;

+ (FTContainerConfig *)defaultConfig;
+ (FTContainerConfig *)navConfig;

- (instancetype)initWithSegementViewFrame:(CGRect)segementViewframe
                          scrollViewFrame:(CGRect)scrollViewFrame
                                   margin:(CGFloat)margin
                          defaultFontSize:(CGFloat)defaultFontSize
                         selectedFontSize:(CGFloat)selectedFontSize
                             defaultColor:(UIColor *)defaultColor
                            selectedColor:(UIColor *)selectedColor
                             fillSegement:(BOOL)fillSegement;


@end

@interface FTContainerTitleModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, readonly, assign) CGFloat titleWidth;
@property (nonatomic, readonly, assign) CGFloat titleHeight;

- (instancetype)initWithTitle:(NSString *)title titleFont:(UIFont *)titleFont;

@end
