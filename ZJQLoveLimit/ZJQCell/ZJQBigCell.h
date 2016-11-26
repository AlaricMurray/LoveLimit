//
//  BigCell.h
//  LoveLimitApp
//
//  Created by ZJQ on 15/10/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJQSmallCell.h"
#import "ZJQStarView.h"

@protocol  ZJQSmallCellPushDetailDelegate <NSObject>

- (void)pushDetail:(NSString *)Id;

@end

@interface ZJQBigCell : UITableViewCell<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel     *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *bigImageView;
@property (strong, nonatomic) IBOutlet UIImageView *smallImageView;
@property (strong, nonatomic) IBOutlet UILabel     *detailLabel;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, strong) NSMutableArray *array;


- (void)smallCellDataArray:(NSArray *)arr;

@property (nonatomic, assign) id<ZJQSmallCellPushDetailDelegate> delegate;

@end
