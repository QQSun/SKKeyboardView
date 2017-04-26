//
//  SKDeleteKeyCell.m
//  SKKeyboardView
//
//  Created by nachuan on 2017/4/26.
//  Copyright © 2017年 nachuan. All rights reserved.
//

#import "SKDeleteKeyCell.h"

@implementation SKDeleteKeyCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.keyImage = [UIImage imageNamed:@"write_delete"];
        self.keyImagePressed = [UIImage imageNamed:@"write_delete_press"];
    }
    return self;
}

@end
