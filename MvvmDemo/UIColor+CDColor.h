//
//  UIColor+CDColor.h
//  CODE
//
//  Created by uwant on 16/12/14.
//  Copyright © 2016年 luojing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CDColor)

+ (UIColor *)colorWithHexString:(NSString *)color;

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
