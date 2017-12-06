//
//  ContetModel.h
//  MvvmDemo
//
//  Created by fan on 16/12/23.
//  Copyright © 2016年 changhog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ContetModel : NSObject

@property(nonatomic,copy) NSString *distance;
@property(nonatomic,copy) NSString *time;
@property(nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *by;
@property(nonatomic,copy) NSString *userName;
@property(nonatomic,copy) NSString *iconImage;



@property(nonatomic,assign)CGRect distanceFrame;
@property(nonatomic,assign)CGRect timeFrame;
@property(nonatomic,assign)CGRect contentFrame;
@property(nonatomic,assign)CGRect byFrame;
@property(nonatomic,assign)CGRect userNameFrame;
@property(nonatomic,assign)CGRect iconImageFrame;
@property(nonatomic,assign)CGFloat totalHeight;


+ (instancetype)modelWithDict:(NSDictionary*)dict;

- (void)updateFrameWithModel:(ContetModel*)model;


@end
