//
//  HeaderView.m
//  MvvmDemo
//
//  Created by fan on 16/12/21.
//  Copyright © 2016年 changhog. All rights reserved.
//

#import "HeaderView.h"
#import "UILabel+CDLabel.h"
#import "UIFont+CDFont.h"
#import "UIColor+CDColor.h"
@interface HeaderView ()
/**用户头像*/
@property (nonatomic, strong) UIImageView *userHeadImg;
/**用户名称*/
@property (nonatomic, strong) UILabel *userNameLabel;
/**中间线条*/
@property (nonatomic, strong) UIView *centerLineView;
/**用户等级*/
@property (nonatomic, strong) UILabel *rankLabel;
/**用户等级图片*/
@property (nonatomic, strong) UIImageView *rankImg;
/**用户心情*/
@property (nonatomic, strong) UILabel *feelLabel;
/**用户心情图片*/
@property (nonatomic, strong) UIImageView *feelImg;
/**用户签名*/
@property (nonatomic, strong) UILabel *signLabel;
/**底部线条*/
@property (nonatomic, strong) UIView *bottomLineView;

@end



@implementation HeaderView

-(instancetype)init{

    if (self=[super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self setUI];
    }
    return self;
}

- (void)setUI{

    self.userHeadImg = [[UIImageView alloc] init];
    [self addSubview:self.userHeadImg];
    
    self.userNameLabel = [UILabel creatLabelWithFont:15 textColor:@"333333" frame:CGRectZero textAlign:NSTextAlignmentCenter];
    self.userNameLabel.font = [UIFont pingfangBoldFontWithSize:15];
    [self addSubview:self.userNameLabel];
    
    self.centerLineView = [[UIView alloc] init];
    self.centerLineView.backgroundColor = [UIColor colorWithHexString:@"EBEBEE"];
    [self addSubview:self.centerLineView];
    
    self.rankLabel = [UILabel creatLabelWithFont:11 textColor:@"666666" frame:CGRectZero textAlign:NSTextAlignmentRight];
    [self addSubview:self.rankLabel];
    
    self.rankImg = [[UIImageView alloc] init];
    [self addSubview:self.rankImg];
    
    self.feelLabel = [UILabel creatLabelWithFont:11 textColor:@"666666" frame:CGRectZero textAlign:NSTextAlignmentLeft];
    [self addSubview:self.feelLabel];
    
    self.feelImg = [[UIImageView alloc] init];
    [self addSubview:self.feelImg];
    
    self.signLabel = [UILabel creatLabelWithFont:12 textColor:@"666666" frame:CGRectZero textAlign:NSTextAlignmentCenter];
    [self addSubview:self.signLabel];
    
    self.bottomLineView = [[UIView alloc] init];
    self.bottomLineView.backgroundColor = [UIColor colorWithHexString:@"EBEBEE"];
    [self addSubview:self.bottomLineView];
    
}

- (void)updateFrameWithModel:(HeadModel *)headModel{
    self.userHeadImg.image = [UIImage imageNamed:headModel.headImg];
    self.userNameLabel.text = headModel.userName;
    self.rankImg.image = [UIImage imageNamed:@"dengji_1"];
    self.feelImg.image = [UIImage imageNamed:@"xinqing"];
    self.signLabel.text = headModel.sign;
    self.rankLabel.text = @"等级";
    self.feelLabel.text = @"心情";
    self.userHeadImg.frame = headModel.headImgFrame;
    self.userNameLabel.frame = headModel.userNameFrame;
    self.centerLineView.frame = headModel.centerLineFrame;
    self.rankLabel.frame = headModel.rankFrame;
    self.rankImg.frame = headModel.rankImgFrame;
    self.feelImg.frame = headModel.feelImgFrame;
    self.feelLabel.frame = headModel.feelFrame;
    self.signLabel.frame = headModel.signFrame;
    self.bottomLineView.frame = headModel.bottomLineFrame;
    
    [self reloadView];
   
}
- (void)reloadView {
    [self setNeedsDisplay];
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    
    BOOL isIn = [self pointInside:point withEvent:event];
    UIView *result = [super hitTest:point withEvent:event];
    if (result == self) {
        return nil;
    } else {
        return result;
    }
}


@end
