//
//  NSString+CDStringSize.m
//  CODE
//
//  Created by uwant on 16/12/15.
//  Copyright © 2016年 luojing. All rights reserved.
//

#import "NSString+CDStringSize.h"
#import "UIColor+CDColor.h"
#import "UIColor+CKLHexColor.h"
#import <UIKit/UIKit.h>
@implementation NSString (CDStringSize)

+ (CGSize) stringLengthWithStr:(NSString *)str with:(CGFloat)with height:(CGFloat)height font:(CGFloat)font{
    CGSize size = [str boundingRectWithSize:CGSizeMake(with, height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    return size;
}

+ (NSAttributedString *)stringWithCompleteStr:(NSString *)completeStr subStr:(NSString *)subStr normolColor:(NSString *)color weightColor:(NSString *)weightColor {
    NSMutableAttributedString *tempStr = [[NSMutableAttributedString alloc] initWithString:completeStr attributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:color]}];
    NSRange range = [completeStr rangeOfString:subStr];
    if (range.location != NSNotFound) {
        [tempStr addAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:weightColor]} range:range];
    }
    return tempStr;
}

@end
