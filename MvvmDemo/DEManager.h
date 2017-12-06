//
//  DEManager.h
//  Limit_Demo_Fan
//
//  Created by 成都千锋 on 15/9/25.
//  Copyright (c) 2015年 成都千锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CellModel.h"
@interface DEManager : NSObject
+ (DEManager*)shareManager;
// 增加一条数据
- (BOOL)insertDataWithModel:(CellModel *)model;
// 删除一条数据
- (BOOL)deleteDataWithModel:(CellModel *)model;

// 修改一条数据
- (BOOL)updateDataWithModel:(CellModel *)model;


// 查询  要知道这条数据是否已经存在数据中
- (BOOL)dataExistsWithModel:(CellModel *)model;

// 获得表格里面所有的数据
- (NSArray *) tableAllData;
@end
