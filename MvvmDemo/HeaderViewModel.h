//
//  HeaderViewModel.h
//  MvvmDemo
//
//  Created by fan on 16/12/21.
//  Copyright © 2016年 changhog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HeadModel.h"
@interface HeaderViewModel : NSObject
+(instancetype)viewModel;
@property (nonatomic,strong)HeadModel *model;


/**header高度*/
@property (nonatomic, assign) CGFloat headerHeight;
- (void)loadDataWithSuccess:(void(^)(id dataSource))success;

@end
