//
//  MLTextViewBottomView.m
//  OilReading
//
//  Created by 268Edu on 2018/5/9.
//  Copyright © 2018年 Magic. All rights reserved.
//

#import "MLTextViewBottomView.h"
#import "BLGeneralControl.h"
#import "AppDelegate.h"
static MLTextViewBottomView *view = nil;
#define BLControlGap 10
#define bottomHeight 5*BLControlGap
#define kScreen_width    [UIScreen mainScreen].bounds.size.width
#define kScreen_height    [UIScreen mainScreen].bounds.size.height
#define BLControlEdge 15.0

@implementation MLTextViewBottomView

+(instancetype)shareMKeyboard{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        view = [[self alloc]init];
    });
    return view;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configureTextView];
    }
    return self;
}

- (void)configureTextView {
   
    self.backgroundColor = [UIColor whiteColor];
    MLToolTextView *textView = [[MLToolTextView alloc]initWithFrame:CGRectMake(BLControlGap, BLControlGap, kScreen_width-9*BLControlGap, bottomHeight-2*BLControlGap)];
    textView.placeholder = @"请说点什么吧";
    [self addSubview:textView];
    self.tool = textView;
    
    
    self.footerBtn = [BLGeneralControl createUIButtonWithBackColor:[UIColor whiteColor] title:@"" titleColor:[UIColor grayColor] titleFont:[UIFont systemFontOfSize:15.0f] normalIcon:nil selectedIcon:nil fromVeiew:self];
    [self footerIconName:@"发送" backgroundColor:[UIColor redColor] borderColor:[UIColor redColor] titleColor:[UIColor whiteColor] cornerRadius:5];
    [self.footerBtn addTarget:self action:@selector(sendMessage:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.footerBtn];
    
    //监听键盘事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    [self.tool addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];

}

//键盘将要调起调用的方法
- (void)keyboardWillShow:(NSNotification *)notif {
    
    CGRect rect = [[notif.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat y = rect.size.height;
    float animationTime = [[notif.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:animationTime animations:^{
    self.frame = CGRectMake(0, kScreen_height - y - bottomHeight, kScreen_width, bottomHeight);
    self.tool.frame = CGRectMake(BLControlGap, BLControlGap, kScreen_width-9*BLControlGap, bottomHeight-2*BLControlGap);
    }];

}

- (void)sendMessage:(UIButton*)button {
    if (self.sendDelegate&&[self.sendDelegate respondsToSelector:@selector(sendMessageCode:)]) {
        [self.sendDelegate sendMessageCode:self.tool];
    }
}

//键盘将要隐藏调用的方法
- (void)keyboardWillHide:(NSNotification *)notif {
    
}

//键盘已经隐藏调用的方法
- (void)keyboardDidHide:(NSNotification *)notif {
    
}


//监听文本框改变调用的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    MLToolTextView * view =(MLToolTextView *)object;
    if ([keyPath isEqualToString:@"contentSize"]) {
        
        CGFloat height = view.contentSize.height;
        if (height > 112) {
            height = 112;
        }
        CGRect textViewFrame = self.tool.frame;
        textViewFrame.size.height = height;
        self.tool.frame = textViewFrame;
        
        // 发送按钮改变调用
        CGRect buttonRect = self.footerBtn.frame;
        buttonRect.origin.y = self.tool.center.y-BLControlEdge;
        self.footerBtn.frame = buttonRect;

        
        [self updateSelfOfTextViewSize];
    }

}


#pragma mark - 更新输入框、本身View大小
- (void)updateSelfOfTextViewSize {
    /* 当UITextView的高度大于100的时候不在增加高度,模仿微信 */
    if (self.tool.frame.size.height > 112) {
        return;
    }
    [UIView animateWithDuration:0.25 animations:^{
        /*本身View 大小*/
        CGRect rect = self.frame;
        /* spaceDouble 为上下间距*/
        rect.size.height = self.tool.frame.size.height + 2*BLControlGap;
        CGFloat sourceY = rect.origin.y;
        CGFloat disY = rect.size.height - self.frame.size.height;
        rect.origin.y = sourceY - disY;
        self.frame = rect;
        
    }];
}


//弹出键盘调用的方法
- (void)show {
    UIWindow *window = [[UIApplication sharedApplication] delegate].window;
    window.backgroundColor = [UIColor whiteColor];
    self.frame = CGRectMake(0, 10, kScreen_width, bottomHeight);
    [self.tool becomeFirstResponder];
    [window addSubview:self];
}

//隐藏键盘调用的方法
- (void)close {
    [self.tool resignFirstResponder];
    self.tool.text = @"";
    [self removeFromSuperview];
}


- (void) footerIconName:(NSString *)title backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)color titleColor:(UIColor *)titleColor cornerRadius:(CGFloat)radius {
    
    self.footerBtn.layer.borderWidth = 1.0;
    self.footerBtn.layer.borderColor = color.CGColor;
    self.footerBtn.layer.cornerRadius = radius;
    self.footerBtn.frame = CGRectMake(kScreen_width-7*BLControlGap, BLControlGap, 6*BLControlGap, 3*BLControlGap);
    [self.footerBtn setBackgroundColor:backgroundColor];
    
    [self.footerBtn setTitle:title forState:UIControlStateNormal];
    [self.footerBtn setTitleColor:titleColor forState:UIControlStateNormal];
}


@end
