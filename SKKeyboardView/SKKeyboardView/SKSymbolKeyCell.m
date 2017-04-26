//
//  SKSymbolKeyCell.m
//  SKKeyboardView
//
//  Created by nachuan on 2017/4/26.
//  Copyright © 2017年 nachuan. All rights reserved.
//

#import "SKSymbolKeyCell.h"

@implementation SKSymbolKeyCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.keyTextFont = [UIFont systemFontOfSize:18];
        self.button.userInteractionEnabled = true;
    }
    return self;
}


@end
