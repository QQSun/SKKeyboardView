//
//  SKKeyCell.m
//  SKKeyboardView
//
//  Created by nachuan on 2017/4/26.
//  Copyright © 2017年 nachuan. All rights reserved.
//

#import "SKKeyCell.h"
#define kPadding 3
@interface SKKeyCell ()

@property (nonatomic, strong) UIButton *button;


@end


@implementation SKKeyCell

@synthesize keyTextFont = _keyTextFont;
@synthesize keyImagePressed = _keyImagePressed;
@synthesize keyImage = _keyImage;

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIButton *button = [[UIButton alloc] init];
        button.titleLabel.font = self.keyTextFont;
        button.frame = CGRectMake(kPadding, 2 * kPadding, frame.size.width - 2 * kPadding, frame.size.height - 2 * kPadding);
        button.adjustsImageWhenHighlighted = false;
        [button setTitleColor:self.keyTextColor forState:UIControlStateNormal];
        [button setBackgroundImage:self.keyImage forState:UIControlStateNormal];
        [button setBackgroundImage:self.keyImagePressed forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        _button = button;
    }
    return self;
}

- (UIFont *)keyTextFont {
    if (_keyTextFont == nil) {
        _keyTextFont = [UIFont systemFontOfSize:20];
    }
    return _keyTextFont;
}

- (void)setKeyTextFont:(UIFont *)keyTextFont {
    _keyTextFont = keyTextFont;
    _button.titleLabel.font = keyTextFont;
}

- (UIColor *)keyTextColor {
    if (_keyTextColor == nil) {
        _keyTextColor = [UIColor grayColor];
    }
    return _keyTextColor;
}

- (void)setKeyText:(NSString *)keyText {
    _keyText = keyText;
    if ([keyText isEqualToString:@"I"] || [keyText isEqualToString:@"O"]) {
        _button.userInteractionEnabled = false;
        [_button setBackgroundImage:[[UIImage imageNamed:@"9key1"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch] forState:UIControlStateNormal];
        [_button setBackgroundImage:[[UIImage imageNamed:@"9key1"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch] forState:UIControlStateHighlighted];
    }else{
        _button.userInteractionEnabled = true;
        [_button setBackgroundImage:self.keyImage forState:UIControlStateNormal];
        [_button setBackgroundImage:self.keyImagePressed forState:UIControlStateHighlighted];
    }
    [_button setTitle:keyText forState:UIControlStateNormal];
}

- (UIImage *)keyImage {
    if (_keyImage == nil) {
        _keyImage = [[UIImage imageNamed:@"9key"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
    }
    return _keyImage;
}

- (void)setKeyImage:(UIImage *)keyImage {
    _keyImage = keyImage;
    [_button setImage:keyImage forState:UIControlStateNormal];
}


- (UIImage *)keyImagePressed {
    if (_keyImagePressed == nil) {
        _keyImagePressed = [[UIImage imageNamed:@"9key_press"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
    }
    return _keyImagePressed;
}

- (void)setKeyImagePressed:(UIImage *)keyImagePressed {
    _keyImagePressed = keyImagePressed;
    [_button setImage:keyImagePressed forState:UIControlStateHighlighted];
}


- (void)clicked:(UIButton *)sender {
    if (self.clickedBlock) {
        self.clickedBlock();
    }
}

@end
