//
//  HeadModel.h
//  MvvmDemo
//
//  Created by fan on 16/12/21.
//  Copyright © 2016年 changhog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HeadModel : NSObject
@property(nonatomic,copy) NSString *headImg;
@property(nonatomic,copy) NSString *userName;
@property (nonatomic, strong) NSNumber *rank;
@property (nonatomic, strong) NSNumber *feel;
@property (nonatomic, copy) NSString *sign;


/**
 header Frame
 */
@property (nonatomic, assign) CGRect headImgFrame;

@property (nonatomic, assign) CGRect userNameFrame;

@property (nonatomic, assign) CGRect rankFrame;

@property (nonatomic, assign) CGRect rankImgFrame;

@property (nonatomic, assign) CGRect centerLineFrame;

@property (nonatomic, assign) CGRect feelFrame;

@property (nonatomic, assign) CGRect feelImgFrame;

@property (nonatomic, assign) CGRect signFrame;

@property (nonatomic, assign) CGRect bottomLineFrame;
/**header高度*/
@property (nonatomic, assign) CGFloat headerHeight;


+ (instancetype) modelWithDict:(NSDictionary *)dict;
/**根据数据计算控件frame*/
- (void) updataHeadViewFrameWithModel:(HeadModel *)model;

@end
