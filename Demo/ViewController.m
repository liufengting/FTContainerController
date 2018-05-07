//
//  ViewController.m
//  FTContainerController
//
//  Created by LiuFengting on 2017/7/12.
//  Copyright © 2017年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import "ViewController.h"
#import "FTContainerController.h"
#import "SubViewController.h"

@interface ViewController () <FTContainerControllerDelegate>

@property (nonatomic, strong) FTContainerController *containController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    SubViewController *sub1 = [[SubViewController alloc] init];
    sub1.title = @"Page1";
    sub1.view.backgroundColor = [UIColor redColor];

    SubViewController *sub2 = [[SubViewController alloc] init];
    sub2.title = @"Page2";
    sub2.view.backgroundColor = [UIColor greenColor];

    SubViewController *sub3 = [[SubViewController alloc] init];
    sub3.title = @"Page3";
    sub3.view.backgroundColor = [UIColor cyanColor];
    
    // custom style
    FTContainerConfig *config;
    
    if (self.isOnNavigation) {
        config = [FTContainerConfig navConfig];
    }else{
        config = [FTContainerConfig defaultConfig];
    }

    self.containController = [[FTContainerController alloc] initWithSuperViewController:self
                                                                        viewControllers:@[sub1, sub2, sub3]
                                                                                 config:config
                                                                               delegate:self];
    if (self.isOnNavigation) {
        [self.navigationItem setTitleView:self.containController.segementView];
    }else{
        [self.view addSubview:self.containController.segementView];
    }
    [self.view addSubview:self.containController.view];
    
}

#pragma mark - FTContainerControllerDelegate

- (void)ftContainerControllerDidScrollToPage:(NSInteger)page
{
    
}

- (IBAction)addBarButtonItemTapped:(UIBarButtonItem *)sender {
    ViewController *otherVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    otherVC.isOnNavigation = !self.isOnNavigation;
    [self.navigationController pushViewController:otherVC animated:YES];
}


@end
