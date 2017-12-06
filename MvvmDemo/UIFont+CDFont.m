//
//  UIFont+CDFont.m
//  CODE
//
//  Created by uwant on 16/12/14.
//  Copyright © 2016年 luojing. All rights reserved.
//

#import "UIFont+CDFont.h"

@implementation UIFont (CDFont)

+(UIFont *)pingfangFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
}

+(UIFont *)pingfangBoldFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Bold" size:size];
}

@end
