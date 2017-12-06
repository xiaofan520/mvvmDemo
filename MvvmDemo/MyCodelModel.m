//
//  MyCodelModel.m
//  MvvmDemo
//
//  Created by fan on 17/1/6.
//  Copyright © 2017年 changhog. All rights reserved.
//

#import "MyCodelModel.h"

@implementation MyCodelModel

+(instancetype)MycodelModelWithDict:(NSDictionary *)dict{

    MyCodelModel *model = [[MyCodelModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
   
}

-(void)updateFrame{

    self.imageRect =CGRectMake(15, 10, 45, 45);
    self.contentRect = CGRectMake(CGRectGetMaxX(self.imageRect)+5, 15, WIDTH-75, [NSString stringLengthWithStr:self.content with:WIDTH-75 height:1000 font:16].height);
    self.lineRect = CGRectMake(15, CGRectGetMaxY(self.contentRect)+5, WIDTH-15, 1);
    
    CGFloat space = (WIDTH - 16 - 52 - 17 * 3) / 4.0;
    self.sharedBtnFrame = CGRectMake(space, CGRectGetMaxY(self.lineRect) + 10 + 2, 16, 16);
    self.lockBtnFrame = CGRectMake(CGRectGetMaxX(self.sharedBtnFrame) + space, CGRectGetMaxY(self.lineRect) + 10 , 15, 19);
    self.deleteBtnFrame = CGRectMake(CGRectGetMaxX(self.lockBtnFrame) + space, CGRectGetMaxY(self.lineRect) + 10 , 17, 17);
    
    self.BottomRect = CGRectMake(WIDTH-45, self.lineRect.origin.y+10, 60, 30);
    self.height=CGRectGetMaxY(self.BottomRect)+10;
    
    
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
}

@end
