//
//  SetViewController.m
//  爱限免
//
//  Created by ZJQ on 15/10/24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZJQSetViewController.h"
#import "ZJQCollection1ViewController.h"
@interface ZJQSetViewController ()

@end

@implementation ZJQSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    [self createUI];
    
    
}


-(void)createUI{
    
    self.navigationItem.title = @"设置详情";
    self.tabBarController.tabBar.barStyle = UIBarStyleBlack;
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 63, 30);
    
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_back.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
}

-(void)backClick:(UIButton *)button{
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    
    [super viewWillAppear:animated];
    NSDictionary * select = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:12.0]};
    [self.tabBarItem setTitleTextAttributes:select forState:UIControlStateNormal];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.barStyle = UIBarStyleDefault;

    
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



- (IBAction)collectClick:(id)sender {
    
    ZJQCollection1ViewController * collect = [[ZJQCollection1ViewController alloc]init];
    [self.navigationController pushViewController:collect animated:YES];
    
    
}
@end
