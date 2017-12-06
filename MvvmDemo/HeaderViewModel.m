//
//  HeaderViewModel.m
//  MvvmDemo
//
//  Created by fan on 16/12/21.
//  Copyright © 2016年 changhog. All rights reserved.
//

#import "HeaderViewModel.h"
#import "HeaderViewModel.h"
@implementation HeaderViewModel
+(instancetype)viewModel{

    HeaderViewModel*viewModel = [[HeaderViewModel alloc] init];
    return viewModel;
    
}

- (void)loadDataWithSuccess:(void (^)(id))success{
    NSDictionary *dict = @{@"headImg":@"morentongxiang",@"userName":@"我是贾先生_org",@"sign":@"生前何必久睡，死后必会长眠!"};
    HeadModel *model = [HeadModel modelWithDict:dict];
    [model updataHeadViewFrameWithModel:model];
    model.headerHeight = 221;
    self.model = model;
    if (success) {
        success(self.model);
    }
    
    
}
- (void)setHeaderHeight:(CGFloat)headerHeight{

    _headerHeight=headerHeight;
    self.model.headerHeight = headerHeight;
    
}
@end
