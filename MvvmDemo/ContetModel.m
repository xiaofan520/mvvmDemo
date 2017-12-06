//
//  ContetModel.m
//  MvvmDemo
//
//  Created by fan on 16/12/23.
//  Copyright © 2016年 changhog. All rights reserved.
//

#import "ContetModel.h"

@implementation ContetModel


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
+(instancetype)modelWithDict:(NSDictionary *)dict{

    ContetModel *model = [[ContetModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

-(void)updateFrameWithModel:(ContetModel*)model{
    
    self.distanceFrame = CGRectMake(15, 10, 50, 30);
    self.timeFrame = CGRectMake(WIDTH-50-15, 10, 50, 30);
    self.contentFrame = CGRectMake(15, CGRectGetMaxY(self.distanceFrame)+15, WIDTH-30, [NSString stringLengthWithStr:model.content with:WIDTH-30 height:1000 font:16].height);
    self.byFrame = CGRectMake(15, CGRectGetMaxY(self.contentFrame)+30, 20, 30);
    self.userNameFrame = CGRectMake(CGRectGetMaxX(self.byFrame)+5, self.byFrame.origin.y, 100, 30);
    self.iconImageFrame = CGRectMake(WIDTH-15-50, self.byFrame.origin.y-25, 50, 50);
    self.totalHeight = CGRectGetMaxY(self.iconImageFrame)+10;

}

@end
