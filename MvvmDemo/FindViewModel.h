//
//  FindViewModel.h
//  MvvmDemo
//
//  Created by fan on 16/12/23.
//  Copyright © 2016年 changhog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface FindViewModel : NSObject<UITableViewDelegate,UITableViewDataSource>

+(instancetype)findViewModel;
@property (nonatomic,strong) NSMutableArray *dataArr;


-(void)loadDataSuccess:(void(^)(id))success;


@end
