//
//  FindViewModel.m
//  MvvmDemo
//
//  Created by fan on 16/12/23.
//  Copyright © 2016年 changhog. All rights reserved.
//

#import "FindViewModel.h"
#import "FindTableViewCell.h"
#import "ContetModel.h"
@interface FindTableViewCell ()



@end
@implementation FindViewModel

-(NSMutableArray *)dataArr{

    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;  
}
+(instancetype)findViewModel{

    FindViewModel *viewModel = [[FindViewModel alloc] init];
    return viewModel;
    
    
}

-(void)loadDataSuccess:(void (^)(id))success{

     NSArray *arr = @[@{@"distance":@"0.01km",@"time":@"35分钟前",@"content":@"老师没教过你吗？不会做的题就跳过去做后面的啊，追不到的人你就换一个追啊。你在追谁？",@"userName":@"Mr.zhang",@"iconImage":@"morentongxiang",},
                     @{@"distance":@"0.21km",@"time":@"昨天 12:00",@"content":@"别曾我提曾经，就是不想回到曾经所以才将他彻底忘记别曾我提曾经别曾我提曾经别曾我提曾经别曾我提曾经别曾我提曾经别曾我提曾经。经别曾我提曾经别曾我提曾经别经别曾我提曾经别曾我提曾经别经别曾我提曾经别曾我提曾经别",@"userName":@"张先生cre",@"iconImage":@"morentongxiang",}];
    
    for (NSDictionary *dict in arr) {
        ContetModel *model = [ContetModel modelWithDict:dict];
        [model updateFrameWithModel:model];
        
        [self.dataArr addObject:model];

    }
    if (success) {
        success(self.dataArr);
        
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 7.0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    
    return self.dataArr.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    FindTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FindTableViewCell"];
    [cell cellWithModel:self.dataArr[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    ContetModel*model = self.dataArr[indexPath.row];
    
    
    return model.totalHeight;
    
    
    
}

@end
