//
//  SpecialViewController.m
//  LoveLimitApp
//
//  Created by ZJQ on 15/10/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ZJQSpecialViewController.h"

@interface ZJQSpecialViewController ()

@end

@implementation ZJQSpecialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    [self setUI:@"专题" cellTitle:@"ZJQBigCell" cellID:@"big" andURl:n_SPECIAL_URL];
    
}
#pragma mark - tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 340;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZJQBigCell *cell = [tableView dequeueReusableCellWithIdentifier:@"big" forIndexPath:indexPath];
    
    [self customCell:cell andIndexPath:indexPath];
        cell.delegate = self;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
- (void)pushDetail:(NSString *)Id{
    ZJQDetailViewController *detail = [[ZJQDetailViewController alloc] init];
    detail.model = Id;
    detail.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)loadData:(id)responseObject{
    if([responseObject isKindOfClass:[NSArray class]]){
        NSArray *array = (NSArray *)responseObject;
        for (NSDictionary *dic in array) {
            ZJQBigModel *model = [[ZJQBigModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.dataArray addObject:model];
        }
    }
}
- (void)customCell:(UITableViewCell *)myCell andIndexPath:(NSIndexPath *)index{
    
    
   ZJQBigCell *cell = (ZJQBigCell *)myCell;
    ZJQBigModel *model = self.dataArray[index.row];
    cell.titleLabel.text = model.title;
    [cell.bigImageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    [cell.smallImageView sd_setImageWithURL:[NSURL URLWithString:model.desc_img]];
    cell.detailLabel.text = model.desc;
    
    [cell smallCellDataArray:model.applications];
    
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
