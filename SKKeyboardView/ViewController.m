//
//  ViewController.m
//  SKKeyboardView
//
//  Created by nachuan on 2017/4/26.
//  Copyright © 2017年 nachuan. All rights reserved.
//

#import "ViewController.h"
#import "SKKeyboardView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SKKeyboardView *keyboardView = [[SKKeyboardView alloc] initWithFrame:CGRectMake(0, 100, 320, 192)];
    [self.view addSubview:keyboardView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
