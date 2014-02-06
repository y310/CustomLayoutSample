//
//  CLSCustomLayout.m
//  CustomLayoutSample
//
//  Created by mito on 2014/02/06.
//  Copyright (c) 2014年 mito. All rights reserved.
//

#import "CLSCustomHorizontalLayout.h"

@implementation CLSCustomHorizontalLayout
- (NSUInteger)count
{
    return [self.collectionView numberOfItemsInSection:0];
}

- (CGSize)collectionViewContentSize
{
    CGSize size = self.collectionView.bounds.size;
    size.width = self.count * self.cellInterval;
    return size;
}

- (NSArray *)indexPathsForItemsInRect:(CGRect)rect
{
    NSMutableArray *paths = [NSMutableArray array];
    CGFloat rectStart = rect.origin.x;
    CGFloat rectEnd = rectStart + rect.size.width;
    for (int i = 0; i < self.count; i++) {
        CGFloat start = i * self.cellInterval;
        CGFloat end = start + self.cellInterval;
        if ((start <= rectEnd && end >= rectStart) || (end >= rectStart && start >= rectEnd)) {
            [paths addObject:[NSIndexPath indexPathForItem:i inSection:0]];
        }
    }
    return paths;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *paths = [self indexPathsForItemsInRect:rect];
    NSMutableArray *layoutAttributes = [[NSMutableArray alloc] initWithCapacity:paths.count];
    for (NSIndexPath *path in paths) {
        [layoutAttributes addObject:[self layoutAttributesForItemAtIndexPath:path]];
    }
    return layoutAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat y = CGRectGetMidY(self.collectionView.bounds) - self.cellSize.height * 0.5;
    CGRect rect = CGRectMake(indexPath.row * self.cellInterval, y, self.cellSize.width, self.cellSize.height);
    attributes.frame = rect;
    return attributes;
}

@end
