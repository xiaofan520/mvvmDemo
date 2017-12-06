//
//  NSString+CKLStrLenght.m
//  cheKeLi
//
//  Created by uwant on 16/9/7.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "NSString+CKLStrLenght.h"

@implementation NSString (CKLStrLenght)

+ (CGSize) canculatWithStr:(NSString *)str with:(CGFloat)with height:(CGFloat)height font:(CGFloat)font{
    CGSize size = [str boundingRectWithSize:CGSizeMake(with, height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    return size;
}

@end
