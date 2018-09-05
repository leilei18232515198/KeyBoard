//
//  MLToolTextView.m
//  RacDemo
//
//  Created by 268Edu on 2018/5/7.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import "MLToolTextView.h"
@implementation MLToolTextView
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.textColor = [UIColor darkGrayColor];
        self.returnKeyType = UIReturnKeyDefault;
        [self setBackgroundColor:[UIColor colorWithRed:240/255 green:240/255 blue:240/255 alpha:1]];
        self.layer.borderColor = [[UIColor colorWithRed:240/255 green:240/255 blue:240/255 alpha:1] CGColor];
        self.layer.cornerRadius = 5.0f;
        self.layer.borderWidth = 0.5f;
    }
    return self;
}




@end
