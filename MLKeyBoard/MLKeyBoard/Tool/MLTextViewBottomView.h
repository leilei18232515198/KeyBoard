//
//  MLTextViewBottomView.h
//  OilReading
//
//  Created by 268Edu on 2018/5/9.
//  Copyright © 2018年 Magic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLToolTextView.h"
#import "UITextView+ZWPlaceHolder.h"

@protocol MLSenderMessageDelegate <NSObject>
- (void)sendMessageCode:(MLToolTextView *)textField;
@end

@interface MLTextViewBottomView : UIView

@property (nonatomic, strong)MLToolTextView *tool;
@property (nonatomic, strong)UIButton *footerBtn;
@property (nonatomic, weak)id<MLSenderMessageDelegate>sendDelegate;

+(instancetype)shareMKeyboard;
- (void)show;
- (void)close;
@end
