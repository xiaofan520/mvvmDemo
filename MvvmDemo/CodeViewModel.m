//
//  CodeViewModel.m
//  MvvmDemo
//
//  Created by fan on 17/1/6.
//  Copyright © 2017年 changhog. All rights reserved.
//

#import "CodeViewModel.h"
#import "MyCodelModel.h"
#import "CodeTableViewCell.h"
@implementation CodeViewModel

-(NSMutableArray *)dataArr{

    if (!_dataArr) {
        _dataArr= [NSMutableArray array];
    }
    return _dataArr;
    
    
}
+(instancetype)codeViewModel{

    CodeViewModel *model = [[CodeViewModel alloc] init];
    return model;
  
}

-(void)loadData:(void (^)())success{

    NSArray *arr = @[@{@"imageName":@"morentongxiang",@"content":@"我曹你呢怒的护肤的护发ID回复ID回复ID福ID回复"},
                     @{@"imageName":@"morentongxiang",@"content":@"时候耍大牌飞机的飞机迪欧减肥滴哦覅U盾覅U盾不服地方比无偶h'd'h回电话",},
                     @{@"imageName":@"morentongxiang",@"content":@"你们是诶杜甫活动回复的回复对方和对方回答回复第回复你你们是诶杜甫活动回复的回复对方和对方回答回复第回复你你们是诶杜甫活动回复的回复对方和对方回答回复第回复你你们是诶杜甫活动回复的回复对方和对方回答回复第回复你",}
                     ];
    
    for (NSDictionary *dict in arr) {
        
        MyCodelModel *model = [MyCodelModel MycodelModelWithDict:dict];
        [model updateFrame];
        [self.dataArr addObject:model];
        
    }
    
    if (success) {
        success();
        
    }
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    MyCodelModel *model = self.dataArr[indexPath.row];
    return model.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CodeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"codeTableViewCell"];
    MyCodelModel *model = self.dataArr[indexPath.row];
    cell.delegate = self.btDelegate;
    [cell updataWithTableView:tableView andModel:model];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (self.delegate && [self.delegate respondsToSelector:@selector(codeViewModelTableViewCellClicked:)]) {
        [self.delegate codeViewModelTableViewCellClicked:indexPath];
    }

}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 7.0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
@end
