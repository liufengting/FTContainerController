//
//  FTContainerScrollView.h
//  FTContainerController
//
//  Created by liufengting on 2018/2/9.
//  Copyright © 2017年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTContainerConfig.h"

@interface FTContainerScrollView : UIScrollView

- (instancetype)initWithFrame:(CGRect)frame
                     delegate:(id<UIScrollViewDelegate>)delegate
              viewControllers:(NSArray<UIViewController *> *)viewControllers
                       config:(FTContainerConfig *)config;

@end
