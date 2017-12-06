//
//  UserModel.m
//  MvvmDemo
//
//  Created by fan on 16/12/26.
//  Copyright © 2016年 changhog. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
+(instancetype)modelWithDic:(NSDictionary *)dict{

    UserModel *model = [[UserModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
    
    
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

@end
