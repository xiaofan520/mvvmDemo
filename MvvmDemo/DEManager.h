//
//  DEManager.h
//  Limit_Demo_Fan
//
//  Created by 成都千锋 on 15/9/25.
//  Copyright (c) 2015年 成都千锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface DEManager : NSObject
+ (DEManager*)shareManager;
// 增加一条数据
- (BOOL)insertDataWithModel:(UserModel *)model;
// 删除一条数据
- (BOOL)deleteDataWithModel:(UserModel *)model;

// 查询  要知道这条数据是否已经存在数据中
- (BOOL)dataExistsWithModel:(UserModel *)model;


-(BOOL)updateDataWithModel:(UserModel *)model;

// 获得表格里面所有的数据
- (NSArray *) tableAllData;


/**
 根据模型key 获取指定的单个数据

 @param uuid 传入的uuid

 @return 返回数组
 */
-(NSArray *)getOneData:(NSString *)uuid;

@end
