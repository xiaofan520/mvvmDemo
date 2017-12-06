//
//  HeadModel.m
//  MvvmDemo
//
//  Created by fan on 16/12/21.
//  Copyright © 2016年 changhog. All rights reserved.
//

#import "HeadModel.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "NSString+CDStringSize.h"
static CGFloat margin = 15;

@interface HeadModel ()

@property (nonatomic, assign) CGFloat signHeigth;

@end
@implementation HeadModel

+(instancetype)modelWithDict:(NSDictionary *)dict{

    HeadModel *model = [[HeadModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
    
    
}

- (void)updataHeadViewFrameWithModel:(HeadModel *)model {
    
    CGSize size = [NSString stringLengthWithStr:model.sign with:WIDTH - margin * 2 height:0 font:12];
    self.signHeigth = size.height;
}

- (void)setHeaderHeight:(CGFloat)headerHeight{

    self.bottomLineFrame = CGRectMake(0, headerHeight - 1, WIDTH, 1);
    self.signFrame = CGRectMake(margin, headerHeight - 25 - self.signHeigth, WIDTH - margin, self.signHeigth);
    self.centerLineFrame = CGRectMake(WIDTH / 2.0 - 0.5,CGRectGetMidY(self.signFrame) - 21 - 20, 1, 20);
    CGFloat currentY = CGRectGetMidY(self.signFrame) - 21 - 20;
    CGFloat currentX = WIDTH / 2.0 - 0.5 - 36 - 21;
    self.rankImgFrame = CGRectMake(currentX, currentY + 1, 21, 18);
    self.rankFrame = CGRectMake(currentX - 13 - 25,  currentY + 4, 25, 11);
    self.feelFrame = CGRectMake(WIDTH / 2.0 + 0.5 + 36, currentY + 4, 25, 11);
    self.feelImgFrame = CGRectMake(CGRectGetMaxX(self.feelFrame) + 13,currentY, 21, 20);
    
    self.userNameFrame = CGRectMake(margin, CGRectGetMinY(self.centerLineFrame) - 19 - 17, WIDTH - margin * 2, 17);
    CGFloat height = CGRectGetMinY(self.userNameFrame) - 14 - margin;
    self.headImgFrame = CGRectMake(WIDTH / 2.0 - height / 2.0, margin, height, height);

    
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end
