//
//  DEManager.m
//  Limit_Demo_Fan
//
//  Created by 成都千锋 on 15/9/25.
//  Copyright (c) 2015年 成都千锋. All rights reserved.
//

#import "DEManager.h"
#import "FMDatabase.h"
@implementation DEManager{

    // 实例化一个操作数据库的对象
    FMDatabase *_fmdb;
    NSLock *_lock;

}




 /**
  GCD单例写法
  */
+(DEManager *)shareManager{
    static DEManager* _db = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_db) {
            _db = [[DEManager alloc] init];
        }
    });
    return _db;
}
- (instancetype)init{
    if (self = [super init]) {
        
        NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/app.db"];
        _fmdb = [[FMDatabase alloc] initWithPath:path];
        if ([_fmdb open]) {
            NSString *sql = @" create table if not exists appab(content_url varchar(255),title varchar(128),cover_image_url varchar(128),share_msg varchar(1024))";
            if ([_fmdb executeUpdate:sql]) {
//                NSLog(@" create Table Success");
            }else{
//                NSLog(@"create Table Fail %@",_fmdb.lastErrorMessage);
            }
//            NSLog(@"open FMDB success %@",_fmdb.lastErrorMessage);
//            NSLog(@"%@",NSHomeDirectory());
            
        }
      
    }
    return self;

}

#pragma mark 插入一条数据
- (BOOL)insertDataWithModel:(CellModel *)model{

    
    
    if ([[DEManager shareManager] dataExistsWithModel:model]) {
     
        return NO;
    }
    [_lock lock];
  
    NSString *sql = @"insert into appab (content_url,title,cover_image_url,share_msg) values (?,?,?,?)";
    BOOL isSuccess = [_fmdb executeUpdate:sql,model.content_url,model.title,model.cover_image_url,model.share_msg];
    if (isSuccess) {
         NSLog(@" insert Success");
    }else{
       NSLog(@" insert Fail:%@",_fmdb.lastErrorMessage);
    }
    [_lock unlock];
    return isSuccess;
}

#pragma mark 删除一条数据
- (BOOL)deleteDataWithModel:(CellModel *)model{

    
    NSString *sql = @"delete from appab where content_url = ?";
    BOOL isSuccess = [_fmdb executeUpdate:sql,model.content_url,model.title,model.cover_image_url,model.share_msg];
    if (isSuccess) {
        NSLog(@" delete Success");
    }else{
        NSLog(@" delete Fail:%@",_fmdb.lastErrorMessage);
    }
  
    return isSuccess;
}

#pragma mark -- 查询数据库是否包含这条语句

- (BOOL)dataExistsWithModel:(CellModel *)model{
    
//    NSLog(@"home = %@",NSHomeDirectory());

//    NSLog(@"model.content_url = %@",model.content_url);
    NSString *sql = @"select content_url from appab where content_url = ?";
    FMResultSet *set = [_fmdb executeQuery:sql,model.content_url];
    
//    NSString *url  = [set stringForColumn:@"content_url"];
    
    
    return [set next];
}

#pragma mark---- 返回所有数据
-(NSArray *)tableAllData{
    NSString *sql = @"select * from appab";
    FMResultSet * set  = [_fmdb executeQuery:sql];
    NSMutableArray *arr = [NSMutableArray array];
    while ([set next]) {
        CellModel *model = [CellModel new];
        [model setValuesForKeysWithDictionary:[set resultDictionary]];
        [arr addObject:model];
    }
    return arr;
}

#pragma mark ---- 修改某一个数据
-(BOOL)updateDataWithModel:(CellModel *)model{
    [_lock lock];

    NSString *sql = @"update appab set name = ? where applicationId = ? ";
    BOOL isSuccess = [_fmdb executeUpdate:sql,model.content_url,model.title,model.cover_image_url,model.share_msg];
    if (isSuccess) {
        NSLog(@" insert Success");
    }else{
        NSLog(@" insert Fail:%@",_fmdb.lastErrorMessage);
    }
    [_lock unlock];
    return isSuccess;

}


///**
// 枷锁的写法
// */
//+ (DEManager *)shareManager{
//    @synchronized(self){
//        if (!_db) {
//            _db = [[DEManager alloc] init];
//        }
//        return _db;
//    
//    }
//}



@end
