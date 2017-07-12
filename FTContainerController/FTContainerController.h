//
//  FTContainerController.h
//  FTContainerController
//
//  Created by LiuFengting on 2017/7/12.
//  Copyright © 2017年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTContainerConfig.h"
#import "FTContainerSegement.h"
#import "FTContainerScrollView.h"

@protocol FTContainerControllerDelegate <NSObject>

- (void)ftContainerControllerDidScrollToPage:(NSInteger)page;

@end


@interface FTContainerController : UIViewController

@property (nonatomic, strong) FTContainerSegement *segementView;
@property (nonatomic, strong) FTContainerScrollView *scrollView;
@property (nonatomic, strong) id<FTContainerControllerDelegate> delegate;


- (instancetype)initWithSuperViewController:(UIViewController *)superViewController
                            viewControllers:(NSArray<UIViewController *> *)viewControllers
                                     config:(FTContainerConfig *)config
                                   delegate:(id<FTContainerControllerDelegate>)delegate;

- (instancetype)initWithSuperViewController:(UIViewController *)superViewController
                            viewControllers:(NSArray<UIViewController *> *)viewControllers
                 initialViewControllerIndex:(NSInteger)initialViewControllerIndex
                                     config:(FTContainerConfig *)config
                                   delegate:(id<FTContainerControllerDelegate>)delegate;

@end
