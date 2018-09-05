//
//  BLGeneralControl.h
//  268EDU_Demo
//
//  Created by Balopy on 2017/7/31.
//  Copyright © 2017年 edu268. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BLGeneralControl : NSObject

/*! 创建 label
 *color: textcolor
 * font: CGfloat
 * view: 加到这个view 上
 */
//
//+ (UILabel *) createUILabelWithTextColor:(UIColor *)color Font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment fromView:(id)view;
//
//
////+ (YYLabel *) createYYLabelWithTextColor:(UIColor *)color Font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment fromView:(id)view;
//
///*! 创建一个view */
//+ (UIView *) createUIViewWithBackColor:(UIColor *)color fromVeiew:(id)view;
////+ (YYLabel *) createYYLabelWithColor:(UIColor *)color Font:(CGFloat)font textAlignment:(NSTextAlignment)textAlignment fromView:(id)view;
//+ (UIButton *) createUIButtonWithNormalIcon:(NSString *)normalIcon selectedIcon:(NSString *)selectedIcon;
//
//+ (UIButton *) createUIButtonBackgroundWithNormalIcon:(NSString *)normalIcon selectedIcon:(NSString *)selectedIcon fromVeiew:(id)view;
//
//+ (UIButton *) createUIButtonImageWithNormalIcon:(NSString *)normalIcon selectedIcon:(NSString *)selectedIcon fromVeiew:(id)view;
///*! 一个button */
+ (UIButton *) createUIButtonWithBackColor:(UIColor *)color title:(NSString *)normalTitle titleColor:(UIColor *)textColor titleFont:(UIFont *)font normalIcon:(NSString *)normalIcon selectedIcon:(NSString *)selectedIcon fromVeiew:(id)view;
//
//
//+ (UIImageView *) createUIImageViewWithName:(NSString *)name toView:(id)view;
//
//
///*! 创建 UITextField */
//+ (UITextField *)createUITextFieldWithColor:(UIColor *)color font:(CGFloat)font placeholder:(NSString *)placeholder textAlignment:(NSTextAlignment)textAlignment toView:(id)view;
//
///*! 创建一个YYImageview */
////+(YYAnimatedImageView *)createYYAnimatedImageViewWithName:(NSString *)imageName fromView:(id)view;
//
//
//+ (UIWindow *)lastWindow;

@end

