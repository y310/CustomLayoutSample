//
//  CLSSimpleCollectionViewController.m
//  CustomLayoutSample
//
//  Created by mito on 2014/02/05.
//  Copyright (c) 2014年 mito. All rights reserved.
//

#import "CLSDetailViewController.h"
#import "CLSSimpleCollectionViewController.h"
#import "CLSCollectionViewCell.h"
#import "MTOZoomInOutTransition.h"

@interface CLSSimpleCollectionViewController ()
<UINavigationControllerDelegate>
@end

@implementation CLSSimpleCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.delegate = self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CLSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%d", indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier;
    if ([kind isEqualToString:@"UICollectionElementKindSectionHeader"]) {
        reuseIdentifier = @"Header";
    } else {
        reuseIdentifier = @"Footer";
    }
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                        withReuseIdentifier:reuseIdentifier
                                                                               forIndexPath:indexPath];
    return view;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CLSDetailViewController *detailVC = segue.destinationViewController;
    CLSCollectionViewCell *cell = (CLSCollectionViewCell *)[self _selectedCell];
    detailVC.number = cell.label.text;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    MTOZoomInOutTransition *animator = [MTOZoomInOutTransition new];
    if (operation == UINavigationControllerOperationPush) {
        CLSDetailViewController *detailVC = (CLSDetailViewController *)toVC;
        animator.sourceRect = [self _rectForAnimate];
        animator.targetRect = detailVC.targetRect;
    } else {
        CLSDetailViewController *detailVC = (CLSDetailViewController *)fromVC;
        animator.sourceRect = detailVC.targetRect;
        animator.targetRect = [self _rectForAnimate];
    }
    animator.zoomIn = operation == UINavigationControllerOperationPush;
    return animator;
}

- (UICollectionViewCell *)_selectedCell
{
    NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] firstObject];
    return [self.collectionView cellForItemAtIndexPath:indexPath];
}

- (CGRect)_rectForAnimate
{
    CGRect rect = [self _selectedCell].frame;
    rect.origin.x -= self.collectionView.contentOffset.x;
    rect.origin.y -= self.collectionView.contentOffset.y;
    return rect;
}

@end
