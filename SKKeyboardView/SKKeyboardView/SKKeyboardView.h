//
//  SKKeyboardView.h
//  SKKeyboardView
//
//  Created by nachuan on 2017/4/26.
//  Copyright © 2017年 nachuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKCommonKeyCell.h"
#import "SKDeleteKeyCell.h"

@class SKKeyboardView;

@protocol SKKeyboardViewDelegate <NSObject>

@optional
- (void)keyboardView:(SKKeyboardView *)keyboardView didClickedCommonItem:(SKCommonKeyCell *)item;
- (void)keyboardView:(SKKeyboardView *)keyboardView didClickedDeleteItem:(SKDeleteKeyCell *)item;

@end
@interface SKKeyboardView : UIView

@property (nonatomic, weak) id <SKKeyboardViewDelegate> delegate;
@property (nonatomic, assign) BOOL isChineseBoard;

@end
