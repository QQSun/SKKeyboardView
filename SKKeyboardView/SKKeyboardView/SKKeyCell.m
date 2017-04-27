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


@end

@implementation SKKeyCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        _keyTextFont = [UIFont systemFontOfSize:20];
        _keyTextColor = [UIColor grayColor];
        _keyBackgroundImage = [[UIImage imageNamed:@"9key"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
        _keyBackgroundImagePressed = [[UIImage imageNamed:@"9key_press"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
        
        UIButton *button = [[UIButton alloc] init];
        button.titleLabel.font = self.keyTextFont;
        button.frame = CGRectMake(kPadding, 2 * kPadding, frame.size.width - 2 * kPadding, frame.size.height - 2 * kPadding);
        button.adjustsImageWhenHighlighted = false;
        [button setTitleColor:self.keyTextColor forState:UIControlStateNormal];
        [button setBackgroundImage:self.keyBackgroundImage forState:UIControlStateNormal];
        [button setBackgroundImage:self.keyBackgroundImagePressed forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        button.userInteractionEnabled = false;
        [self.contentView addSubview:button];
        _button = button;
        

    }
    return self;
}


- (void)setKeyTextFont:(UIFont *)keyTextFont {
    _keyTextFont = keyTextFont;
    _button.titleLabel.font = keyTextFont;
}


- (void)setKeyText:(NSString *)keyText {
    _keyText = keyText;
    if ([keyText isEqualToString:@"I"] || [keyText isEqualToString:@"O"]) {
        [_button setBackgroundImage:[[UIImage imageNamed:@"9key1"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch] forState:UIControlStateNormal];
        [_button setBackgroundImage:[[UIImage imageNamed:@"9key1"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch] forState:UIControlStateHighlighted];
    }else{
        [_button setBackgroundImage:self.keyBackgroundImage forState:UIControlStateNormal];
        [_button setBackgroundImage:self.keyBackgroundImagePressed forState:UIControlStateHighlighted];
    }
    [_button setTitle:keyText forState:UIControlStateNormal];
}

- (void)setKeyImage:(UIImage *)keyImage {
    _keyImage = keyImage;
    [_button setImage:keyImage forState:UIControlStateNormal];
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
