//
//  UILabel+CDLabel.h
//  CODE
//
//  Created by uwant on 16/12/15.
//  Copyright © 2016年 luojing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CDLabel)

/*!
 @brief 创建label
 */
+ (UILabel *)creatLabelWithFont:(NSInteger)font textColor:(NSString *)color frame:(CGRect)ract textAlign:(NSTextAlignment)align;

@end
