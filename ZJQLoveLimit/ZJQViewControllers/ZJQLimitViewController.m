//
//  LimitViewController.m
//  LoveLimitApp
//
//  Created by ZJQ on 15/10/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ZJQLimitViewController.h"
#import "ZJQStarView.h"
#import "ZJQClassViewController.h"
@interface ZJQLimitViewController ()

@end

@implementation ZJQLimitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    [self setUI:@"限免" cellTitle:@"ZJQAppCell" cellID:@"iden" andURl:k_LIMIT_URL];
    
}

- (void)customCell:(UITableViewCell *)myCell andIndexPath:(NSIndexPath *)index{
    [super customCell:myCell andIndexPath:index];
    
    ZJQAppModel *model = self.dataArray[index.row];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.0";
    NSDate *date = [formatter dateFromString:model.expireDatetime];
    int ss = [date timeIntervalSinceNow];
    int HH = ss / 3600;
    int mm = ss % 3600 / 60;
    int SS = ss % 60;
    NSString *allTime = [NSString stringWithFormat:@"剩余：%.2d:%.2d:%.2d",HH,mm,SS];
    ZJQAppCell *cell = (ZJQAppCell *)myCell;
    cell.timeLabel.text = allTime;
    
    
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
