//
//  FmdbViewController.m
//  MvvmDemo
//
//  Created by fan on 16/12/26.
//  Copyright © 2016年 changhog. All rights reserved.
//

#import "FmdbViewController.h"
#import "UserModel.h"

#import "DBManager.h"
#import "DEManager.h"
@interface FmdbViewController (){
    
}

@end

@implementation FmdbViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    
    
    
    UIButton *createBt = [[UIButton alloc] initWithFrame:CGRectMake(15, 66, 100, 30)];
    [createBt setTitle:@"保存" forState:UIControlStateNormal];
    [createBt setBackgroundColor:[UIColor redColor]];
    [createBt addTarget:self action:@selector(create:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:createBt];
    
    UIButton *readBt = [[UIButton alloc] initWithFrame:CGRectMake(15, 100, 100, 30)];
    [readBt setTitle:@"读取" forState:UIControlStateNormal];
    [readBt setBackgroundColor:[UIColor redColor]];
    [readBt addTarget:self action:@selector(read:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:readBt];
    
    UIButton *delateBt = [[UIButton alloc] initWithFrame:CGRectMake(15, 150, 100, 30)];
    [delateBt setTitle:@"删除" forState:UIControlStateNormal];
    [delateBt setBackgroundColor:[UIColor redColor]];
    [delateBt addTarget:self action:@selector(delateBt:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:delateBt];
    
    UIButton *updateBt = [[UIButton alloc] initWithFrame:CGRectMake(15, 200, 100, 30)];
    [updateBt setTitle:@"更新" forState:UIControlStateNormal];
    [updateBt setBackgroundColor:[UIColor redColor]];
    [updateBt addTarget:self action:@selector(updateBt) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:updateBt];
    
    
    
    
}

- (void)create:(UIButton*)sender{
//
//
//    [[BGFMDB intance] saveObject:model complete:^(BOOL isSuccess) {
//        
//        NSLog(@"保存成功");
//        
//        
//    }];
    
    
    NSArray *arr1 = @[@{@"uuid":@"511623199012237498",
                             @"name":@"fan",
                             @"age":@"26",
                             @"asign":@"何以解忧，唯有暴富"
                             },
                      @{@"uuid":@"12345",
                        @"name":@"liu",
                        @"age":@"26",
                        @"asign":@"不会啊不会啊"
                        }];
    
    for (NSDictionary *dic in arr1) {
        UserModel *model = [UserModel modelWithDic:dic];
        [[DEManager shareManager] insertDataWithModel:model];

    }
    
    
    
}

- (void)read:(UIButton*)sender{

    
//    [[BGFMDB intance] queryAllObject:[UserModel class] complete:^(NSArray *array) {
//        
//        NSLog(@"%@",array);
//        UserModel *modle = array[0];
//        NSLog(@"%@-%@-%d-%@",modle.uuid,modle.name,modle.age,modle.asign);
//        
//        
//    }];

//   NSArray *arr =  [[DBManager sharedManager] getAllStepData];
    
    NSArray *arr = [[DEManager shareManager] tableAllData];
    
    for (UserModel *tempModel in arr) {
        
        NSLog(@"%@",tempModel.uuid);
        NSLog(@"name=%@ asige = %@ age = %@",tempModel.name,tempModel.asign,tempModel.age);

        
    }
    
}

-(void)delateBt:(UIButton*)sender{

//    [[BGFMDB intance]clearWithClass:[UserModel class] complete:^(BOOL isSuccess) {
//        
//        NSLog(@"删除表成功");
//    }];
//    if ([model.uuid isEqualToString:@"11"]) {
//        [[DBManager sharedManager] deleteStepDataModel:model];
//    }
    
    
}
- (void)updateBt{

    
//    [[BGFMDB intance]updateWithClass:[UserModel class] valueDict:@{@"name":@"liu"} where:nil complete:^(BOOL isSuccess) {
//        NSLog(@"更新成功");
//    }];
    
   NSArray *arr =  [[DEManager shareManager] getOneData:@"12345"];
    
    
    UserModel *model = arr[0];
    model.name = @"nimei111111";
//    model.age = @"111111111";
//    model.asign =@"dfsdfds";
    
    [[DEManager shareManager] insertDataWithModel:model];
    
    NSArray *arr2 = [[DEManager shareManager] getOneData:model.uuid];
    UserModel *model2 = arr2[0];
    NSLog(@"name=%@ asige = %@ age = %@",model2.name,model2.asign,model2.age);

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
