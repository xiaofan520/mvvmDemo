//
//  FindViewController.m
//  MvvmDemo
//
//  Created by fan on 16/12/23.
//  Copyright © 2016年 changhog. All rights reserved.
//

#import "FindViewController.h"
#import "FindViewModel.h"
#import "FindTableViewCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface FindViewController ()
@property (nonatomic,strong)FindViewModel*findViewModel;
@property (nonatomic,strong)UITableView*tableView;
@property (nonatomic, strong) UIButton *leftButton;



@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton.frame = CGRectMake(0, 0, 23/2, 38/2);
    self.leftButton.backgroundColor = [UIColor clearColor];
    [self.leftButton setTitle:@"返回" forState:UIControlStateNormal];
    //[self.leftButton setImage:[UIImage imageNamed:@"houtui"] forState:UIControlStateNormal];
    [self.leftButton addTarget:self action:@selector(leftButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.tableView];
    [self.findViewModel loadDataSuccess:^(id data) {
        NSLog(@"%@",data);
        [self.tableView reloadData];
    }];
    
    
    
}

-(void)leftButtonClicked{

    [self.navigationController popViewControllerAnimated:YES];
}
-(FindViewModel *)findViewModel{

    if (!_findViewModel) {
        _findViewModel = [FindViewModel findViewModel];
        
    }
    return _findViewModel;

}

-(UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64-49) style:UITableViewStylePlain];
        _tableView.delegate = self.findViewModel;
        _tableView.dataSource = self.findViewModel;
        [_tableView registerClass:[FindTableViewCell class] forCellReuseIdentifier:@"FindTableViewCell"];
    }
    return _tableView;
    
    
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
