//
//  UILabel+CDLabel.m
//  CODE
//
//  Created by uwant on 16/12/15.
//  Copyright © 2016年 luojing. All rights reserved.
//

#import "UILabel+CDLabel.h"
#import "UIColor+CKLHexColor.h"
@implementation UILabel (CDLabel)

+ (UILabel *)creatLabelWithFont:(NSInteger)font textColor:(NSString *)color frame:(CGRect)ract textAlign:(NSTextAlignment)align {
    UILabel *label = [[UILabel alloc] initWithFrame:ract];
    label.textColor = [UIColor colorWithHexString:color];
    label.font = [UIFont systemFontOfSize:font];
    label.textAlignment = align;
    return label;
}

@end
