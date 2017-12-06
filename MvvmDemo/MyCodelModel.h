//
//  MyCodelModel.h
//  MvvmDemo
//
//  Created by fan on 17/1/6.
//  Copyright © 2017年 changhog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MyCodelModel : NSObject

@property (nonatomic,copy) NSString *imageName;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,assign) CGRect imageRect;
@property (nonatomic,assign)CGRect lineRect;

@property (nonatomic,assign) CGRect contentRect;

@property (nonatomic, assign) CGRect sharedBtnFrame;

@property (nonatomic, assign) CGRect lockBtnFrame;

@property (nonatomic, assign) CGRect deleteBtnFrame;
@property (nonatomic,assign) CGRect BottomRect;


@property (nonatomic,assign)CGFloat height;


+(instancetype)MycodelModelWithDict:(NSDictionary*)dict;
- (void)updateFrame;


@end
