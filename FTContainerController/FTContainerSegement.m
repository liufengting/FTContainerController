//
//  FTContainerSegement.m
//  FTContainerController
//
//  Created by liufengting on 2018/2/9.
//  Copyright © 2017年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import "FTContainerSegement.h"

static NSString *const FTContainerSegementCellIdentifier = @"FTContainerSegementCellIdentifier";

@interface FTContainerSegement () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *indicatorView;
@property (nonatomic, strong) NSArray<UIViewController *> *viewControllers;
@property (nonatomic, strong) NSArray<FTContainerTitleModel *> *dataArray;
@property (nonatomic, weak) id<FTContainerSegementDelegate> delegate;
@property (nonatomic, strong) FTContainerConfig *config;
@property (nonatomic, assign) NSInteger selectedIndex;

@end

@implementation FTContainerSegement

- (instancetype)initWithFrame:(CGRect)frame
              viewControllers:(NSArray<UIViewController *> *)viewControllers
                     delegate:(id<FTContainerSegementDelegate>)delegate
                       config:(FTContainerConfig *)config
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.viewControllers = viewControllers;
        self.delegate = delegate;
        self.config = config;

        [self addSubview:self.collectionView];
        self.indicatorView.frame = CGRectMake(0, self.bounds.size.height - config.segementIndicatorHeight, 30, config.segementIndicatorHeight);
        self.indicatorView.backgroundColor = config.segementIndicatorColor;
        self.collectionView.alwaysBounceHorizontal = config.segementEnableScrolling;
        [self.collectionView addSubview:self.indicatorView];

        [self reloadSegementView];
    }
    return self;
}

- (void)reloadSegementView
{
    if (!self.viewControllers || !self.config) {
        return;
    }
    NSMutableArray *array = [NSMutableArray array];
    for (UIViewController *controller in self.viewControllers) {
        FTContainerTitleModel *model = [[FTContainerTitleModel alloc] initWithTitle:controller.title
                                                                          titleFont:[UIFont systemFontOfSize:self.config.segementTitleDefaultFontSize]];
        [array addObject:model];
    }
    self.dataArray = [NSArray arrayWithArray:array];
    [self.collectionView reloadData];
}



- (void)selectIndex:(NSInteger)index
{
    CGRect indicatorFrame = [self indicatorFrameForIndex:index];
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.indicatorView.frame = indicatorFrame;
                     } completion:^(BOOL finished) {
                         self.selectedIndex = index;
                         [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
                     }];


}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0.f;
        layout.minimumInteritemSpacing = 0.f;

        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([FTContainerSegementCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:FTContainerSegementCellIdentifier];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.alwaysBounceHorizontal = YES;
        _collectionView.scrollsToTop = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (UIView *)indicatorView
{
    if (!_indicatorView) {
        _indicatorView = [[UIView alloc]initWithFrame:CGRectZero];
        _indicatorView.backgroundColor = [UIColor redColor];
    }
    return _indicatorView;
}

#pragma mark - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

- (NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([self itemWidthForIndex:indexPath.item], collectionView.bounds.size.height);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FTContainerSegementCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FTContainerSegementCellIdentifier forIndexPath:indexPath];
    [cell setupWithTitle:self.dataArray[indexPath.row].title
                  config:self.config];
    [cell setSelected:(indexPath.item == self.selectedIndex)];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item != self.selectedIndex && self.delegate && [self.delegate respondsToSelector:@selector(FTContainerSegementDidSelectedIndex:)]) {
        self.selectedIndex = indexPath.item;
        [self.delegate FTContainerSegementDidSelectedIndex:indexPath.row];
    }
}

- (CGFloat)itemWidthForIndex:(NSInteger )index
{
    if (self.config.fillSegement) {
        return self.collectionView.bounds.size.width/self.viewControllers.count;
    }else{
        return self.dataArray[index].titleWidth + self.config.segementTitleMargin;
    }
}

- (CGRect)indicatorFrameForIndex:(NSInteger)index
{
    CGFloat x = 0;
    CGFloat width = self.dataArray[index].titleWidth;

    for (NSInteger i = 0; i < index; i ++) {
        x += [self itemWidthForIndex:i];
    }

    if (self.config.fillSegement) {
        x += ([self itemWidthForIndex:index]/2 - width/2);
    }else{
        x += self.config.segementTitleMargin/2;
    }

    CGFloat height = self.config.segementIndicatorHeight;
    CGFloat y = self.bounds.size.height - height;
    CGRect rect = CGRectMake(x, y, width, height);
    return rect;
}

@end
