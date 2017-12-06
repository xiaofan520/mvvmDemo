//
//  CodeViewModel.h
//  MvvmDemo
//
//  Created by fan on 17/1/6.
//  Copyright © 2017年 changhog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CodeTableViewCell.h"
@protocol codeViewModelTableViewCellClicked <NSObject>

-(void)codeViewModelTableViewCellClicked:(NSIndexPath*)index;

@end
@interface CodeViewModel : NSObject<UITableViewDelegate,UITableViewDataSource,CodeTableViewCellBtClicked>
@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,weak)id<codeViewModelTableViewCellClicked>delegate;
@property (nonatomic,weak)id<CodeTableViewCellBtClicked>btDelegate;

+(instancetype)codeViewModel;

-(void)loadData:(void(^)())success;


@end
