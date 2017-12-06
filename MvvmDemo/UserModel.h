//
//  UserModel.h
//  MvvmDemo
//
//  Created by fan on 16/12/26.
//  Copyright © 2016年 changhog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *uuid;
@property (nonatomic,copy) NSString *age;
@property (nonatomic,copy) NSString *asign;


+(instancetype)modelWithDic:(NSDictionary *)dict;
@end
