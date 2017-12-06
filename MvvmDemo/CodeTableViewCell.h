//
//  CodeTableViewCell.h
//  MvvmDemo
//
//  Created by fan on 17/1/6.
//  Copyright © 2017年 changhog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCodelModel.h"

typedef NS_ENUM(NSInteger,CDMyCodeClickedType) {
    CDMyCodeClickedTypeShared = 0,  //分享
    CDMyCodeClickedTypeLock,     //锁
    CDMyCodeClickedTypeDelete,   //删除
};
@protocol CodeTableViewCellBtClicked <NSObject>

- (void)CodeTableViewCellBtClicked:(UIButton*)sender andWithCodeModel:(MyCodelModel *)model andClickedType:(CDMyCodeClickedType)type;


@end

@interface CodeTableViewCell : UITableViewCell

@property (nonatomic,weak) id<CodeTableViewCellBtClicked>delegate;
@property (nonatomic,strong) MyCodelModel *model;


- (void)updataWithTableView:(UITableView*)tableview andModel:(MyCodelModel*)model;


@end
