//
//  FTContainerScrollView.m
//  FTContainerController
//
//  Created by liufengting on 2018/2/9.
//  Copyright © 2017年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import "FTContainerScrollView.h"

@implementation FTContainerScrollView

- (instancetype)initWithFrame:(CGRect)frame
                     delegate:(id<UIScrollViewDelegate>)delegate
              viewControllers:(NSArray<UIViewController *> *)viewControllers
                       config:(FTContainerConfig *)config
{
    self = [super initWithFrame:frame];
    if (self) {
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.alwaysBounceHorizontal = config.contentEnableScrolling;
        self.alwaysBounceVertical = NO;
        self.pagingEnabled = YES;
        self.scrollsToTop = NO;
        self.delegate = delegate;
        self.scrollEnabled = config.contentEnableScrolling;
        self.contentSize = CGSizeMake(self.bounds.size.width*viewControllers.count, self.bounds.size.height);
    }
    return self;
}

@end
