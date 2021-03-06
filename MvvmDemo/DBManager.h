//
//  DBManager.h
//  志愿家
//
//  Created by 新未来 on 16/9/29.
//  Copyright © 2016年 NewFuture. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserModel;
@interface DBManager : NSObject
/**单例*/
+(instancetype)sharedManager;
/**检查是否存在*/
-(BOOL)isExsitsWithDate:(NSString *)uuid;
/**添加数据*/
-(BOOL)addStepDataModel:(UserModel *)model;
/**删除数据*/
-(BOOL)deleteStepDataModel:(UserModel *)model;
/**获取所有数据*/
-(NSArray *)getAllStepData;

-(BOOL)deleteStepData;

-(NSArray *)getOneData:(NSString *)uuid;

@end
