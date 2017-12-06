//
//  UIColor+CKLHexColor.h
//  cheKeLi
//
//  Created by uwant on 16/9/7.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CKLHexColor)

/*!
 @brief 根据16进制颜色字符串转换为UIColor 默认alpha值为1
 @param color 16进制颜色字符串
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/*!
 @brief 根据16进制颜色字符串转换为UIColor
 @param color 16进制颜色字符串 alpha 透明度
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
