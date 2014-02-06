//
//  CLSCustomLayout.m
//  CustomLayoutSample
//
//  Created by mito on 2014/02/05.
//  Copyright (c) 2014年 mito. All rights reserved.
//

#import "CLSCustomVerticalLayout.h"

@implementation CLSCustomVerticalLayout

- (NSUInteger)count
{
    return [self.collectionView numberOfItemsInSection:0];
}

- (CGSize)collectionViewContentSize
{
    CGSize size = self.collectionView.bounds.size;
    size.height = self.count * self.cellInterval;
    return size;
}

- (NSArray *)indexPathsForItemsInRect:(CGRect)rect
{
    NSMutableArray *paths = [NSMutableArray array];
    CGFloat rectStart = rect.origin.y;
    CGFloat rectEnd = rectStart + rect.size.height;
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
    CGFloat x = CGRectGetMidX(self.collectionView.bounds) - self.cellSize.width * 0.5;
    CGRect rect = CGRectMake(x, indexPath.row * self.cellInterval, self.cellSize.width, self.cellSize.height);
    attributes.frame = rect;
    return attributes;
}

//- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind
//                                                                     atIndexPath:(NSIndexPath *)indexPath
//{
//    
//}
//
//- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind
//                                                                  atIndexPath:(NSIndexPath *)indexPath
//{
//    
//}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return false;
}

@end
