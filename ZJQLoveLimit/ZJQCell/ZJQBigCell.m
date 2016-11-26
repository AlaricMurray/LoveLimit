//
//  BigCell.m
//  LoveLimitApp
//
//  Created by ZJQ on 15/10/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ZJQBigCell.h"

@implementation ZJQBigCell

- (void)awakeFromNib {
  
    _tableView.scrollEnabled = NO;
    
    _array = [[NSMutableArray alloc] initWithCapacity:0];
    
}

- (void)smallCellDataArray:(NSArray *)arr{
    _array = [[NSMutableArray alloc] initWithArray:arr];
    [_tableView reloadData];
}

#pragma mark - tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZJQSmallCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZJQSmallCell" owner:self options:nil] lastObject];
    }
   
    [cell creatSmallCellUI:_array[indexPath.row]];
    
    ZJQStarView * view = [[ZJQStarView alloc]initWithFrame:CGRectMake(55, 35, 65, 23)];
    [view setStarLevel:_array[indexPath.row][@"starOverall"]];
    [cell.contentView addSubview:view];
    

    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dic = _array[indexPath.row];
    [self.delegate pushDetail:[dic objectForKey:@"applicationId"]];
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
