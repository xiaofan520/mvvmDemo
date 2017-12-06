//
//  MyCodeViewController.m
//  MvvmDemo
//
//  Created by fan on 17/1/6.
//  Copyright © 2017年 changhog. All rights reserved.
//

#import "MyCodeViewController.h"
#import "CodeViewModel.h"
#import "CodeTableViewCell.h"
@interface MyCodeViewController ()<CodeTableViewCellBtClicked,codeViewModelTableViewCellClicked>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) NSMutableArray* dataSource;
@property (nonatomic,strong) CodeViewModel *codeViewModel;


@end

@implementation MyCodeViewController

- (CodeViewModel *)codeViewModel{

    if (!_codeViewModel) {
        _codeViewModel = [CodeViewModel codeViewModel];
        _codeViewModel.delegate =self;
        _codeViewModel.btDelegate = self;
        
    }
    return _codeViewModel;
    
    
}
-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
        _tableView.delegate = self.codeViewModel;
        _tableView.dataSource =self.codeViewModel;
        _tableView.estimatedRowHeight = 80;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[CodeTableViewCell class] forCellReuseIdentifier:@"codeTableViewCell"];

    }
    return _tableView;
    
    
}
- (NSMutableArray *)dataSource {
    if (_dataSource) {
        return _dataSource;
    }
    _dataSource = [[NSMutableArray alloc] init];
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.codeViewModel loadData:^{
        
        [self.tableView reloadData];
        
    }];
    
}
- (void)codeViewModelTableViewCellClicked:(NSIndexPath *)index{

    NSLog(@"--%ld",(long)index.row);
    
    
    
}
-(void)CodeTableViewCellBtClicked:(UIButton *)sender andWithCodeModel:(MyCodelModel *)model andClickedType:(CDMyCodeClickedType)type{

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
