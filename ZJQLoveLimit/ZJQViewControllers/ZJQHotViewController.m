//
//  HotViewController.m
//  LoveLimitApp
//
//  Created by ZJQ on 15/10/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ZJQHotViewController.h"

@interface ZJQHotViewController ()

@end

@implementation ZJQHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setUI:@"热榜" cellTitle:@"ZJQAppCell" cellID:@"iden" andURl:n_HOSTLIST_URL];

}

- (void)customCell:(UITableViewCell *)myCell andIndexPath:(NSIndexPath *)index{
    [super customCell:myCell andIndexPath:index];
    
    ZJQAppCell *cell = (ZJQAppCell *)myCell;
    ZJQAppModel *model = self.dataArray[index.row];
    
    cell.timeLabel.text = [NSString stringWithFormat:@"评分：%@分",model.starOverall];
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
