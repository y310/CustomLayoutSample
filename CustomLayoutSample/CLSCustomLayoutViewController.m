//
//  CLSCustomLayoutViewController.m
//  CustomLayoutSample
//
//  Created by mito on 2014/02/05.
//  Copyright (c) 2014年 mito. All rights reserved.
//

#import "CLSCustomLayoutViewController.h"
#import "CLSCollectionViewCell.h"
#import "CLSCustomVerticalLayout.h"
#import "CLSCustomHorizontalLayout.h"
#import "CLSCustomVerticalScaleLayout.h"

@interface CLSCustomLayoutViewController ()
- (IBAction)changeLayout:(id)sender;
@property (weak, nonatomic) IBOutlet CLSCustomVerticalLayout *layout;
@property (strong) CLSCustomHorizontalLayout *horizontalLayout;
@property (strong) CLSCustomVerticalScaleLayout *scaleLayout;
@end

@implementation CLSCustomLayoutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.layout.cellInterval = 60;
    self.layout.cellSize = CGSizeMake(50, 50);
    self.horizontalLayout = [CLSCustomHorizontalLayout new];
    self.horizontalLayout.cellInterval = 60;
    self.horizontalLayout.cellSize = CGSizeMake(50, 50);
    self.scaleLayout = [CLSCustomVerticalScaleLayout new];
    self.scaleLayout.cellInterval = 60;
    self.scaleLayout.cellSize = CGSizeMake(50, 50);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
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

- (IBAction)changeLayout:(id)sender {
    if ([self.collectionView.collectionViewLayout isMemberOfClass:[CLSCustomVerticalLayout class]]) {
        self.collectionView.collectionViewLayout = self.horizontalLayout;
    } else if ([self.collectionView.collectionViewLayout isMemberOfClass:[CLSCustomHorizontalLayout class]]) {
        self.collectionView.collectionViewLayout = self.scaleLayout;
    } else {
        self.collectionView.collectionViewLayout = self.layout;
    }
    [self.collectionView.collectionViewLayout invalidateLayout];
}
@end
