//
//  SKKeyboardViewLayout.m
//  SKKeyboardView
//
//  Created by nachuan on 2017/4/26.
//  Copyright © 2017年 nachuan. All rights reserved.
//

#import "SKKeyboardViewLayout.h"

@interface SKKeyboardViewLayout ()
/** 所有的布局属性 */
@property (nonatomic, strong) NSMutableArray *attrsArray;

@end
@implementation SKKeyboardViewLayout
- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}


- (void)prepareLayout {
    [super prepareLayout];
    [self.attrsArray removeAllObjects];
    NSInteger sections = [self.collectionView numberOfSections];
    for (int i=0; i<sections; i++) {
        NSInteger rows = [self.collectionView numberOfItemsInSection:i];
        for (int j=0; j<rows; j++) {
            CGFloat frameWidth = self.collectionView.frame.size.width;
            CGFloat width =  frameWidth / 10;
            NSInteger height = (NSInteger)(width * 1.5);
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:j inSection:i];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            attrs.frame = CGRectMake(j * width + (10 - rows) * width / 2.0, i * height, width, height);
            if (i == 3) {
                if (j == 0) {
                    attrs.frame = CGRectMake(0, i * height, height, height);
                }else if (j == rows - 1) {
                    attrs.frame = CGRectMake(frameWidth - height, i * height, height, height);
                }
            }
            [self.attrsArray addObject:attrs];
        }
    }
    
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    return self.attrsArray;
}

- (CGSize)collectionViewContentSize {
    return self.collectionView.bounds.size;
}

@end
