//
//  MyTabBarController.m
//  LoveLimitApp
//
//  Created by ZJQ on 15/10/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ZJQMyTabBarController.h"
#import "ZJQLimitViewController.h"
#import "ZJQReduceViewController.h"
#import "ZJQFreeViewController.h"
#import "ZJQSpecialViewController.h"
#import "ZJQHotViewController.h"

@interface ZJQMyTabBarController ()

@end

@implementation ZJQMyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createTabBarController];
   
}



-(void)createTabBarController{
    
    ZJQLimitViewController   *limit   = [[ZJQLimitViewController alloc] init];
    ZJQReduceViewController  *reduce  = [[ZJQReduceViewController alloc] init];
    ZJQFreeViewController    *free    = [[ZJQFreeViewController alloc] init];
    ZJQSpecialViewController *special = [[ZJQSpecialViewController alloc] init];
    ZJQHotViewController     *hot     = [[ZJQHotViewController alloc] init];
    
    NSArray *controllerArray = @[limit, reduce, free, special, hot];
    NSArray *imageArray = @[@"tabbar_limitfree.png",@"tabbar_reduceprice.png",@"tabbar_appfree.png",@"tabbar_subject.png",@"tabbar_rank.png"];
    NSArray *selectImageArray = @[@"tabbar_limitfree_press.png",@"tabbar_reduceprice_press.png",@"tabbar_appfree_press.png",@"tabbar_subject_press.png",@"tabbar_rank_press.png"];
    NSArray *titleArray = @[@"限免",@"降价",@"免费",@"专题",@"热榜"];
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < controllerArray.count; i ++) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controllerArray[i]];
        nav.tabBarItem.title = titleArray[i];
        nav.tabBarItem.image = [[UIImage imageNamed:imageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [viewControllers addObject:nav];
    }
    
    self.viewControllers = viewControllers;
    
    
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
