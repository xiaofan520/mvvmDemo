//
//  MyTableviewContViewModel.m
//  MvvmDemo
//
//  Created by fan on 16/12/21.
//  Copyright © 2016年 changhog. All rights reserved.
//


#import "MyTableviewContViewModel.h"

#import "CDMineContentCell.h"
@interface MyTableviewContViewModel()
/**数据源文本*/
@property (nonatomic, strong) NSArray *contentDataSource;
/**图片*/
@property (nonatomic, strong) NSArray *ImgDataSource;


@end
@implementation MyTableviewContViewModel


+(instancetype)contentViewModel{

    MyTableviewContViewModel*viewModel =[[MyTableviewContViewModel alloc] init];
    return viewModel;
}
- (NSArray *)contentDataSource {
    if (!_contentDataSource) {
        _contentDataSource = [NSArray array];
    }
    return _contentDataSource;
}

- (NSArray *)ImgDataSource {
    if (!_ImgDataSource) {
        _ImgDataSource = [NSArray array];
    }
    return _ImgDataSource;
}

-(void)loadDataWithSuccess:(void (^)(id))success{
    self.contentDataSource = @[@"我的关注",@"个人资料",@"My Code",@"我的账户",@"设置选项"];
    self.ImgDataSource = @[@"guanzhu",@"ziliao",@"suo",@"zhanghu",@"shezhi"];
    if (success) {
        success(self.contentDataSource);
    }

    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    
    return self.contentDataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CDMineContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.contentDataSource.count) {
        [cell updataWithImg:self.ImgDataSource[indexPath.row] content:self.contentDataSource[indexPath.row]];
        
    }
    
    return cell;
}
#pragma mark table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 72;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewWithModel:indexPath:)]) {
        if (self.contentDataSource.count) {
            [self.delegate tableViewWithModel:self.contentDataSource[indexPath.row] indexPath:indexPath];
        }else {
            [self.delegate tableViewWithModel:nil indexPath:indexPath];
        }
    }
    
    
}

@end
