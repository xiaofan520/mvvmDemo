//
//  DBManager.m
//  志愿家
//
//  Created by 新未来 on 16/9/29.
//  Copyright © 2016年 NewFuture. All rights reserved.
//

#import "DBManager.h"
#import "FMDB.h"
#import "UserModel.h"
@implementation DBManager{
    //FMDB的数据库管理对象.
    FMDatabase *_dataBase;
    
}

/**单例*/
+(instancetype)sharedManager {
    static dispatch_once_t token;
    static DBManager *gDBManager =nil;
    dispatch_once(&token, ^{
        gDBManager =[[DBManager alloc]init];
    });
    return gDBManager;

}

-(instancetype)init{
    if (self =[super init]) {
        //创建数据库 使用第三方框架.
        //创建数据库文件保存路径
        //sqlite数据库,在本质意义上来说,也是一个个普通的文件,和TXT是一样的,只不过里面的内容不一样而已.MySQL Oracle这些比较大型的数据库,它需要一个管理服务,是一整套的配置.
        NSString *dbPath =[NSString stringWithFormat:@"%@/Documents/app.sqlite",NSHomeDirectory()];
        NSLog(@"%@",dbPath);
        
        //创建数据库.
        _dataBase =[[FMDatabase alloc]initWithPath:dbPath];
        
        //打开数据库
        [_dataBase open];
        
        //创建数据库表(date,myStep,goalStep)
        //如果在目录下没有这个数据库文件,那么就会创建该文件.
        NSString *createSql =@"create table if not exists userInfo(uuid varchar(255),name varchar(255),age asign(255))";
        //执行文件,创建数据库表,
        [_dataBase executeUpdate:createSql];
        
        
        
    }
    return self;
}


/**检查是否存在*/
-(BOOL)isExsitsWithDate:(NSString *)uuid{
    NSString *querySQL =[NSString stringWithFormat:@"select * from userInfo where uuid=%@",uuid];
    FMResultSet *set =[_dataBase executeQuery:querySQL];
    if ([set next]) {
        return YES;
    }
    else{
        return NO;
    }

}
/**添加数据*/
-(BOOL)addStepDataModel:(UserModel *)model{
    BOOL isExsits =[self isExsitsWithDate:model.uuid];
    if (isExsits) {
        //删除数据.
        [self deleteStepDataModel:model];
//        NSString *deleteSQL =[NSString stringWithFormat:@"delete from stepData where date=%@",model.date];
//        [_dataBase executeQuery:deleteSQL];
       
        //添加新数据.
        NSString *insertSQL =@"insert into userInfo (uuid,name,age,asign)values(?,?,?,?)";
        BOOL success = [_dataBase executeUpdate:insertSQL,model.uuid,model.name,model.age,model.asign];
        return success;
    }else {
        //添加新数据.
        NSString *insertSQL =@"insert into userInfo (uuid,name,age,asign)values(?,?,?,?)";
        BOOL success = [_dataBase executeUpdate:insertSQL,model.uuid,model.name,model.age,model.asign];
        return success;
    }
  
}
/**删除数据*/
-(BOOL)deleteStepDataModel:(UserModel *)model{
    //删除对应的记录.
    BOOL isExists =[self isExsitsWithDate:model.uuid];
    if (isExists) {
        BOOL success =[_dataBase executeUpdate:@"delete from userInfo where uuid=?",model.uuid];
        return success;
    }
    else{
        NSLog(@"thit meassage not save");
        return NO;
    }

}


-(BOOL)deleteStepData{
   
    
        BOOL success =[_dataBase executeUpdate:@"DELETE FROM userInfo"];
    
        return success;
    

 
}

-(NSArray *)getOneData:(NSString *)uuid {
   
    FMResultSet *set =[_dataBase executeQuery:@"select * from userInfo where uuid=?",uuid];
    NSMutableArray *array =[[NSMutableArray alloc]init];
    
    while ([set next]) {
        UserModel *model = [[UserModel alloc] init];
        //从结果集中获取数据.
        //数据库中是不去分大小写的.
        model.uuid =[set stringForColumn:@"uuid"];
        model.name =[set stringForColumn:@"name"];
        
        [array addObject:model];
        
    }
    return array ;
}

/**获取所有数据*/
-(NSArray *)getAllStepData{
    NSString *fetchsql =@"select * from userInfo";
    FMResultSet *set =[_dataBase executeQuery:fetchsql];
    NSMutableArray *array =[[NSMutableArray alloc]init];
   
    while ([set next]) {
        UserModel *model = [[UserModel alloc] init];
        //从结果集中获取数据.
        //数据库中是不去分大小写的.
        model.uuid =[set stringForColumn:@"uuid"];
        [array addObject:model];
        
    }
    return array;

}
@end
