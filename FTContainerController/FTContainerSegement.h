//
//  FTContainerSegement.h
//  FTContainerController
//
//  Created by liufengting on 16/7/21.
//  Copyright © 2017年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTContainerSegementCell.h"

@protocol FTContainerSegementDelegate <NSObject>

- (void)FTContainerSegementDidSelectedIndex:(NSInteger)index;

@end

@interface FTContainerSegement : UIView

- (instancetype)initWithFrame:(CGRect)frame
              viewControllers:(NSArray<UIViewController *> *)viewControllers
                     delegate:(id<FTContainerSegementDelegate>)delegate
                       config:(FTContainerConfig *)config;

- (void)selectIndex:(NSInteger)index;

@end
