//
//  CDMineContentCell.m
//  CODE
//
//  Created by uwant on 16/12/15.
//  Copyright © 2016年 luojing. All rights reserved.
//

#import "CDMineContentCell.h"
#import "UILabel+CDLabel.h"

@interface CDMineContentCell ()

@property (nonatomic, strong) UIImageView *img;

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation CDMineContentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}

- (void) setUpUI {
    self.img = [[UIImageView alloc] init];
    [self.contentView addSubview:self.img];
    
    self.contentLabel = [UILabel creatLabelWithFont:16 textColor:@"333333" frame:CGRectZero textAlign:NSTextAlignmentLeft];
    [self.contentView addSubview:self.contentLabel];
}

- (void)updataWithImg:(NSString *)img content:(NSString *)content {
    UIImage *image = [UIImage imageNamed:img];
    CGSize size = [content sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
    self.img.image = [UIImage imageNamed:img];
    CGFloat allWidth = image.size.width + 20 + size.width;
    self.img.frame = CGRectMake(WIDTH / 2.0 - allWidth / 2.0,23, image.size.width, image.size.height);
    self.contentLabel.text = content;
    self.contentLabel.frame = CGRectMake(CGRectGetMaxX(self.img.frame) + 20,23, size.width, size.height);
    
}

@end
