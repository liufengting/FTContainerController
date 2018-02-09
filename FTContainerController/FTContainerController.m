//
//  FTContainerController.m
//  FTContainerController
//
//  Created by liufengting on 2018/2/9.
//  Copyright © 2017年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import "FTContainerController.h"

@interface FTContainerController () <FTContainerSegementDelegate, UIScrollViewDelegate>

@property (nonatomic, weak) UIViewController *superViewController;
@property (nonatomic, weak) NSArray<UIViewController *> *viewControllers;
@property (nonatomic, strong) FTContainerConfig *config;

@end

@implementation FTContainerController

- (instancetype)initWithSuperViewController:(UIViewController *)superViewController
                            viewControllers:(NSArray<UIViewController *> *)viewControllers
                                     config:(FTContainerConfig *)config
                                   delegate:(id<FTContainerControllerDelegate>)delegate
{

    return [self initWithSuperViewController:superViewController
                             viewControllers:viewControllers
                  initialViewControllerIndex:0
                                      config:config
                                    delegate:delegate];
}

- (instancetype)initWithSuperViewController:(UIViewController *)superViewController
                            viewControllers:(NSArray<UIViewController *> *)viewControllers
                 initialViewControllerIndex:(NSInteger)initialViewControllerIndex
                                     config:(FTContainerConfig *)config
                                   delegate:(id<FTContainerControllerDelegate>)delegate
{
    self = [super init];
    if (self) {
        self.view.frame = config.scrollViewFrame;
        self.automaticallyAdjustsScrollViewInsets = NO;

        self.superViewController = superViewController;
        self.viewControllers = viewControllers;
        self.config = config;
        self.delegate = delegate;

        [self initializeConponents];

        [self scrollToViewControllerAtIndex:initialViewControllerIndex];
    }
    return self;
}

- (void)initializeConponents
{
    if (!self.viewControllers.count) {
        return;
    }

    self.segementView = [[FTContainerSegement alloc] initWithFrame:self.config.segementViewFrame
                                                   viewControllers:self.viewControllers
                                                          delegate:self
                                                            config:self.config];

    self.scrollView = [[FTContainerScrollView alloc] initWithFrame:self.view.bounds
                                                          delegate:self
                                                   viewControllers:self.viewControllers
                                                            config:self.config];
    [self.view addSubview:self.scrollView];
}

- (void)scrollToViewControllerAtIndex:(NSInteger)index
{
    if (index < 0 || index > self.viewControllers.count - 1) {
        return;
    }
    UIViewController *viewController = self.viewControllers[index];
    CGRect vcRect = CGRectMake(self.view.frame.size.width*index, 0, self.view.frame.size.width, self.config.scrollViewFrame.size.height);
    if (!viewController.view.window) {
        [viewController willMoveToParentViewController:self.superViewController];
        [viewController.view setFrame:vcRect];
        [self.superViewController addChildViewController:viewController];
        [self.scrollView addSubview:viewController.view];
        [viewController didMoveToParentViewController:self.superViewController];
    }
    [self.scrollView scrollRectToVisible:vcRect animated:YES];
    [self.segementView selectIndex:index];

    if (_delegate && [_delegate respondsToSelector:@selector(ftContainerControllerDidScrollToPage:)]) {
        [_delegate ftContainerControllerDidScrollToPage:index];
    }
}

#pragma mark - FTContainerSegementDelegate

- (void)FTContainerSegementDidSelectedIndex:(NSInteger)index
{
    [self scrollToViewControllerAtIndex:index];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x/scrollView.bounds.size.width;
    [self scrollToViewControllerAtIndex:page];
}

@end
