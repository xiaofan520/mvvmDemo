//
//  NSString+CDStringSize.h
//  CODE
//
//  Created by uwant on 16/12/15.
//  Copyright © 2016年 luojing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (CDStringSize)
/**计算字符串高度*/
+ (CGSize) stringLengthWithStr:(NSString *)str with:(CGFloat)with height:(CGFloat)height font:(CGFloat)font;

/**处理多种颜色字符串*/
+ (NSAttributedString *)stringWithCompleteStr:(NSString *)completeStr subStr:(NSString *)subStr normolColor:(NSString *)color weightColor:(NSString *)weightColor;

@end
