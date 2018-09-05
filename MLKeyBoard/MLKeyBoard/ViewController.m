//
//  ViewController.m
//  MLKeyBoard
//
//  Created by 268Edu on 2018/9/5.
//  Copyright © 2018年 QRScan. All rights reserved.
//

#import "ViewController.h"
#import "MLTextViewBottomView.h"
@interface ViewController ()<MLSenderMessageDelegate>
@property (nonatomic,strong)MLTextViewBottomView *textBottomView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textBottomView = [MLTextViewBottomView shareMKeyboard];
    self.textBottomView.tool.placeholder = [NSString stringWithFormat:@"回复%@:",@"屌丝一枚"];
    self.textBottomView.sendDelegate = self;
    [self.textBottomView show];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.textBottomView close];
}

@end
