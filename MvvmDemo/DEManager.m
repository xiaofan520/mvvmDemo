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
        
        NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/userInfo.db"];
        _fmdb = [[FMDatabase alloc] initWithPath:path];
        if ([_fmdb open]) {
            NSString *sql = @" create table if not exists userInfo(uuid varchar(255),name varchar(255),age varchar(255),asign varchar(255))";
            if ([_fmdb executeUpdate:sql]) {
                NSLog(@" create Table Success");
            }else{
                NSLog(@"create Table Fail %@",_fmdb.lastErrorMessage);
            }
//            NSLog(@"open FMDB success %@",_fmdb.lastErrorMessage);
//            NSLog(@"%@",NSHomeDirectory());
            
        }
      
    }
    return self;

}

#pragma mark 插入一条数据
- (BOOL)insertDataWithModel:(UserModel *)model{
    if ([[DEManager shareManager] dataExistsWithModel:model]) {
        [self deleteDataWithModel:model];
//        return NO;
    }
    [_lock lock];
  
    NSString *sql = @"insert into userInfo (uuid,name,age,asign) values (?,?,?,?)";
    BOOL isSuccess = [_fmdb executeUpdate:sql,model.uuid,model.name,model.age,model.asign];
    if (isSuccess) {
         NSLog(@"添加一条数据成功");
    }else{
       NSLog(@" 添加 Fail:%@",_fmdb.lastErrorMessage);
    }
    [_lock unlock];
    return isSuccess;
}

#pragma mark 删除一条数据
- (BOOL)deleteDataWithModel:(UserModel *)model{

    
    NSString *sql = @"delete from userInfo where uuid = ?";
    BOOL isSuccess = [_fmdb executeUpdate:sql,model.uuid];
    if (isSuccess) {
        NSLog(@" delete Success");
    }else{
        NSLog(@" delete Fail:%@",_fmdb.lastErrorMessage);
    }
  
    return isSuccess;
}

#pragma mark -- 查询数据库是否包含这条语句

- (BOOL)dataExistsWithModel:(UserModel *)model{

    NSString *sql = @"select uuid from userInfo where uuid = ?";
    FMResultSet *set = [_fmdb executeQuery:sql,model.uuid];
    
    return [set next];
}

#pragma mark---- 返回所有数据
-(NSArray *)tableAllData{
    NSString *sql = @"select * from userInfo";
    FMResultSet * set  = [_fmdb executeQuery:sql];
    NSMutableArray *arr = [NSMutableArray array];
    while ([set next]) {
        UserModel *model = [[UserModel alloc] init];
        [model setValuesForKeysWithDictionary:[set resultDictionary]];
        [arr addObject:model];
    }
    return arr;
}

//#pragma mark ---- 修改某一个数据
-(BOOL)updateDataWithModel:(UserModel *)model{
    [_lock lock];
    NSString *sql = @"update userInfo set name='%@',age='%@',asign='%@' where uuid='%@'";
    BOOL isSuccess = [_fmdb executeUpdate:sql,model.name,model.age,model.asign,model.uuid];
    if (isSuccess) {
        NSLog(@" update Success");
    }else{
        NSLog(@" update Fail:%@",_fmdb.lastErrorMessage);
    }
    [_lock unlock];
    return isSuccess;

}

-(NSArray *)getOneData:(NSString *)uuid {
    
    FMResultSet *set =[_fmdb executeQuery:@"select * from userInfo where uuid=?",uuid];
    NSMutableArray *array =[[NSMutableArray alloc]init];
    
    while ([set next]) {
        UserModel *model = [[UserModel alloc] init];
        [model setValuesForKeysWithDictionary:[set resultDictionary]];
        [array addObject:model];
        
    }
    return array ;
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
