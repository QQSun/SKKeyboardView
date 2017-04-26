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

@property (nonatomic, copy) NSString *keyText;
@property (nonatomic, strong) UIFont *keyTextFont;
@property (nonatomic, strong) UIImage *keyImage;
@property (nonatomic, strong) UIImage *keyImagePressed;
@property (nonatomic, strong) UIColor *keyColor;
@property (nonatomic, strong) UIColor *keyTextColor;



@end
