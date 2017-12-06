//
//  MyTableviewContViewModel.h
//  MvvmDemo
//
//  Created by fan on 16/12/21.
//  Copyright © 2016年 changhog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CDTableViewDelegate <NSObject>

@optional
/*!
 @brief tableView点击回调
 @param model 数据参数 indexPath 下标
 */
- (void)tableViewWithModel:(id)model indexPath:(NSIndexPath *)indexPath;

@end
@interface MyTableviewContViewModel : NSObject<UITableViewDelegate,UITableViewDataSource>
+(instancetype)contentViewModel;
@property(nonatomic,weak)id<CDTableViewDelegate>delegate;


- (void) loadDataWithSuccess:(void(^)(id dataSource))success;



@end
