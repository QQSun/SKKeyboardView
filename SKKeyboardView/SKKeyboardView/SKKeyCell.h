//
//  SKKeyCell.h
//  SKKeyboardView
//
//  Created by nachuan on 2017/4/26.
//  Copyright © 2017年 nachuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKKeyCell : UICollectionViewCell

@property (nonatomic, copy) void (^clickedBlock)();

@property (nonatomic, copy) NSString *keyText;  ///按键文字
@property (nonatomic, strong) UIFont *keyTextFont;  ///按键字体
@property (nonatomic, strong) UIImage *keyImage;    ///按键图片
@property (nonatomic, strong) UIImage *keyImagePressed; ///按键点击后的图片
@property (nonatomic, strong) UIImage *keyBackgroundImage;  ///按键背景图片
@property (nonatomic, strong) UIImage *keyBackgroundImagePressed;   ///按键点击状态背景图
@property (nonatomic, strong) UIColor *keyColor;    ///按键颜色
@property (nonatomic, strong) UIColor *keyTextColor;    ///按键文字颜色
@property (nonatomic, strong) UIButton *button; ///按键上用于显示文字和图标的按钮


@end
