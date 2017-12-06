//
//  ViewController.m
//  MvvmDemo
//
//  Created by fan on 16/9/20.
//  Copyright © 2016年 changhog. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "HeaderViewModel.h"
//宏定义
#import "CDMineContentCell.h"
#import "MyTableviewContViewModel.h"
#import "FindViewController.h"
#import "FmdbViewController.h"
#import "RealmViewController.h"
#import "MyCodeViewController.h"
#import "FriendViewController.h"
#import "MvvmDemo-Swift.h"
#import <objc/runtime.h>
typedef NS_ENUM(NSInteger,CellContentOptionType){

    CDMineOptionTypeAttention = 0,  //关注
    CDMineOptionTypeInfo,       //资料
    CDMineOptionTypeMyCode,         //My code
    CDMineOptionTypeAccount,        //账户
    CDMineOptionTypeSetting,        //设置
    
    
};
@interface ViewController()<CDTableViewDelegate>
@property(nonatomic,strong)HeaderView *headerView;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)MyTableviewContViewModel*contentModel;
@property (nonatomic,strong)HeaderViewModel *headViewModel;




@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    [self test];
    
 
}


+ (BOOL)resolveClassMethod:(SEL)sel{

    return YES;
}
- (void)test{

    unsigned int count;
    //获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"property---->%@", [NSString stringWithUTF8String:propertyName]);
    }
    
    //获取方法列表
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i; i<count; i++) {
        Method method = methodList[i];
        NSLog(@"method---->%@", NSStringFromSelector(method_getName(method)));
    }
    
    //获取成员变量列表
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i; i<count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        NSLog(@"Ivar---->%@", [NSString stringWithUTF8String:ivarName]);
    }
    
    //获取协议列表
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    for (unsigned int i; i<count; i++) {
        Protocol *myProtocal = protocolList[i];
        const char *protocolName = protocol_getName(myProtocal);
        NSLog(@"protocol---->%@", [NSString stringWithUTF8String:protocolName]);
    }
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.tableView];

    [self.view addSubview:self.headerView];
    
    [self.headViewModel loadDataWithSuccess:^(id dataSource) {
        
        HeadModel *model =(HeadModel*)dataSource;
        [self.headerView updateFrameWithModel:model];
    }];
    
    [self.contentModel loadDataWithSuccess:^(id dataSource) {
        [self.tableView reloadData];
    }];

}


-(HeaderViewModel *)headViewModel{

    if (!_headViewModel) {
        _headViewModel = [HeaderViewModel viewModel];
        
    }
    return _headViewModel;
    
}

- (MyTableviewContViewModel *)contentModel{

    if (!_contentModel) {
        _contentModel = [MyTableviewContViewModel contentViewModel];
        _contentModel.delegate =self;
    }
    return _contentModel;
    
}
-(UITableView*)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.contentInset= UIEdgeInsetsMake(221-64, 0, 0, 0);
        
        [_tableView registerClass:[CDMineContentCell class] forCellReuseIdentifier:@"cell"];
        
        _tableView.delegate = self.contentModel;
        _tableView.dataSource = self.contentModel;
        
        
    }
    return _tableView;
    

}

- (HeaderView *)headerView{

    if (!_headerView) {
        _headerView = [[HeaderView alloc] init];
        _headerView.frame = CGRectMake(0, 0, WIDTH, 221);
        
    }
    return _headerView;
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{

    
    if ([keyPath isEqualToString:@"contentOffset"]) {
        // 最新的偏移位置
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
        
        // 原始的位置
        CGFloat oraginY = 64;
        if (- offset.y >= 221) {
            self.headViewModel.headerHeight =-offset.y;
            oraginY = 64;
            
        }else{
        
            self.headViewModel.headerHeight = 221;
            oraginY =64+(-offset.y-221);
        }
        
        self.headerView.frame = CGRectMake(0, oraginY, WIDTH, self.headViewModel.headerHeight);
        [self.headerView updateFrameWithModel:self.headViewModel.model];
        

    }
    
}

-(void)tableViewWithModel:(id)model indexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case CDMineOptionTypeAttention:{
            FindViewController *vc = [[FindViewController alloc] init];
            vc.title = @"我的关注";

//            [self.navigationController pushViewController:vc animated:YES];
            UIView *fooView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            fooView.backgroundColor = [UIColor grayColor];
            fooView.alpha = 0.3;
            [[UIApplication sharedApplication].keyWindow addSubview:fooView];
            
            UIView *foo1 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 200)];
            [[UIApplication sharedApplication].keyWindow addSubview:foo1];
            foo1.backgroundColor = [UIColor orangeColor];
            
            [UIView animateWithDuration:0.4 animations:^{
//                CGPoint centerPoint = foo1.center;
//                centerPoint.y -= 200;
//                foo1.center = centerPoint;
                
                CGRect fooRect = foo1.frame;
                fooRect.origin.y -= 200;
                foo1.frame = fooRect;
            }];
        }

            break;
        case CDMineOptionTypeInfo:{
            
            FmdbViewController *fmdbVc=[[FmdbViewController alloc] init];
            fmdbVc.title =@"FMDB";
            self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
            [self.navigationController pushViewController:fmdbVc animated:YES];

            
            
        }
            break;
        case CDMineOptionTypeMyCode:{
            
            MyCodeViewController *vc = [[MyCodeViewController alloc] init];
            vc.title =@"MYCODE";
            self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
            
            [self.navigationController pushViewController:vc animated:YES];


        }
            
            
            break;
        case CDMineOptionTypeAccount:{
            SwiftViewController *demo = [[SwiftViewController alloc]init];
            
            
            self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
            


            [self.navigationController pushViewController:demo animated:YES];
//            SwiftView *view = [[SwiftView alloc] init];
            
            
            
        }
            
            
            break;
        case CDMineOptionTypeSetting:{
        
            FriendViewController*vc = [[FriendViewController alloc] init];
            self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
            
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
            
        default:
            break;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
