//
//  SKCollectionView.m
//  SKKeyboardView
//
//  Created by nachuan on 2017/4/26.
//  Copyright © 2017年 nachuan. All rights reserved.
//

#import "SKCollectionView.h"
#import "SKCommonKeyCell.h"
@interface SKCollectionView ()

@property (nonatomic, strong) UIImageView *magnifier;
@property (nonatomic, strong) UILabel *magnifierContent;

@end

@implementation SKCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        _isShowMagnifier = true;
        self.multipleTouchEnabled = false;
        self.clipsToBounds = false;
        UIImageView *magnifier = [[UIImageView alloc] init];
        magnifier.hidden = true;
        magnifier.frame = CGRectMake(frame.size.width / 2.0, -30, frame.size.width * 2, frame.size.height + 30);
        magnifier.image = [UIImage imageNamed:@"qwerty_key_pop_p1"];
        [self addSubview:magnifier];
        _magnifier = magnifier;
        
        UILabel *magnifierContent = [[UILabel alloc] init];
        magnifierContent.font = [UIFont boldSystemFontOfSize:30];
        magnifierContent.textColor = [UIColor grayColor];
        magnifierContent.textAlignment = NSTextAlignmentCenter;
        [magnifier addSubview:magnifierContent];
        _magnifierContent = magnifierContent;
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.isShowMagnifier == false) {
        return;
    }
    /// 此处如果不是SKCommonKeyCell类型的cell, 其点击事件会被cell上的按钮拦截. 不会进如该方法
    SKCommonKeyCell *cell = [self cellForTouches:touches];
    if ([cell isKindOfClass:[SKCommonKeyCell class]]) {
        if ([cell.keyText isEqualToString:@"I"] || [cell.keyText isEqualToString:@"O"]) {
            return;
        }
        _magnifier.hidden = false;
        [self showMagnifierForCell:(SKCommonKeyCell *)cell];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _magnifier.hidden = true;
    if (self.delegate && [self.delegate respondsToSelector:@selector(collectionView:didSelectItemAtIndexPath:)]) {
        UITouch *touch = touches.anyObject;
        CGPoint point = [touch locationInView:self];
        NSIndexPath *indexPath = [self indexPathForItemAtPoint:point];
        [self.delegate collectionView:self didSelectItemAtIndexPath:indexPath];
    }
}

- (SKCommonKeyCell *)cellForTouches:(NSSet<UITouch *> *)touches {
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    NSIndexPath *indexPath = [self indexPathForItemAtPoint:point];
    if (indexPath) {
        SKCommonKeyCell *cell = (id)[self cellForItemAtIndexPath:indexPath];
        return cell;
    }
    return nil;
}

- (void)showMagnifierForCell:(SKCommonKeyCell *)cell {

    CGRect rect = [cell convertRect:cell.frame toView:self];
    _magnifier.hidden = NO;
    _magnifierContent.text = cell.keyText;
    _magnifier.frame = CGRectMake(-rect.size.width / 2 - 2 + rect.origin.x / 2.0, -rect.size.height + 2 + rect.origin.y / 2.0, rect.size.width * 2 + 4, rect.size.height * 2);
    _magnifierContent.frame = CGRectMake(2, 20, rect.size.width * 2, rect.size.height);
    
    [_magnifierContent.layer removeAllAnimations];
    [UIView animateWithDuration:0.2 animations:^{
        _magnifierContent.frame = CGRectMake(2, 5, rect.size.width * 2, rect.size.height);
    }];
    
}


@end
