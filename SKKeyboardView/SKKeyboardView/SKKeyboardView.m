//
//  SKKeyboardView.m
//  SKKeyboardView
//
//  Created by nachuan on 2017/4/26.
//  Copyright © 2017年 nachuan. All rights reserved.
//

#import "SKKeyboardView.h"
#import "SKCollectionView.h"
#import "SKKeyboardViewLayout.h"
#import "SKSymbolKeyCell.h"
@interface SKKeyboardView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *infoArray;

@end

@implementation SKKeyboardView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        SKKeyboardViewLayout *layout = [[SKKeyboardViewLayout alloc] init];
        SKCollectionView *collectionView = [[SKCollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor colorWithRed:200/256.0 green:203/256.0 blue:211/256.0 alpha:1];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [collectionView registerClass:[SKCommonKeyCell class] forCellWithReuseIdentifier:@"common"];
        [collectionView registerClass:[SKDeleteKeyCell class] forCellWithReuseIdentifier:@"delete"];
        [collectionView registerClass:[SKSymbolKeyCell class] forCellWithReuseIdentifier:@"symbol"];
        
        [self addSubview:collectionView];
    }
    return self;
}

- (NSArray *)infoArray {
    if (_isChineseBoard) {
        _infoArray = @[@[@"京", @"津", @"冀", @"鲁", @"晋", @"蒙", @"辽", @"吉", @"黑", @"沪"],
                       @[@"苏", @"浙", @"皖", @"闽", @"赣", @"豫", @"鄂", @"湘", @"粤"],
                       @[@"桂", @"渝", @"川", @"贵", @"云", @"藏", @"陕", @"甘"],
                       @[@"ABC",@"青", @"琼", @"新", @"港", @"澳", @"台", @"宁", @"DEL"]];
    }else{
        _infoArray = @[@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0"],
                       @[@"Q", @"W", @"E", @"R", @"T", @"Y", @"U", @"I", @"O", @"P"],
                       @[@"A", @"S", @"D", @"F", @"G", @"H", @"J", @"K", @"L"],
                       @[@"省份", @"Z", @"X", @"C", @"V", @"B", @"N", @"M", @"DEL"]];
    }
    return _infoArray;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 3 && indexPath.row == 0) {
        SKSymbolKeyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"symbol" forIndexPath:indexPath];
        cell.clickedBlock = ^{
            if (indexPath.section == 3 && indexPath.row == 0) {
                _isChineseBoard = !_isChineseBoard;
                [collectionView reloadData];
            }
        };
        cell.keyText = self.infoArray[indexPath.section][indexPath.row];
        return cell;
        
    }else if (indexPath.section == 3 && indexPath.row == [self.infoArray[3] count] - 1) {
        SKDeleteKeyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"delete" forIndexPath:indexPath];
        __weak typeof(cell) weakCell = cell;
        cell.clickedBlock = ^{
            if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardView:didClickedDeleteItem:)]) {
                [self.delegate keyboardView:self didClickedDeleteItem:weakCell];
            }
        };
        return cell;
        
    }else{
        SKCommonKeyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"common" forIndexPath:indexPath];
        cell.keyText = self.infoArray[indexPath.section][indexPath.row];
        return cell;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.infoArray[section] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 4;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    /// 此处如果不是SKCommonKeyCell类型的cell, 其点击事件会被cell上的按钮拦截. 不会进如该方法
    SKCommonKeyCell *cell = (SKCommonKeyCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardView:didClickedCommonItem:)]) {
        [self.delegate keyboardView:self didClickedCommonItem:(SKCommonKeyCell *)cell];
    }
}



@end
