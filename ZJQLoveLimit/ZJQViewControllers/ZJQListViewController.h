//
//  ListViewController.h
//  LoveLimitApp
//
//  Created by ZJQ on 15/10/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ZJQRootViewController.h"

#import "AFNetworking.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"

#import "ZJQAppCell.h"
#import "ZJQAppModel.h"
#import "Header.h"
#import "ZJQStarView.h"

#import "ZJQDetailViewController.h"
#import "ZJQClassViewController.h"

@interface ZJQListViewController : ZJQRootViewController<UITableViewDataSource, UITableViewDelegate,cateDelegate>


@property (nonatomic, strong) UITableView    *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) int            page;
@property (nonatomic, strong) NSString       *urlStr;



-(void)setUI:(NSString *)title cellTitle:(NSString *)cellTitle cellID:(NSString *)cellID andURl:(NSString *)url;


- (void)customCell:(UITableViewCell *)myCell andIndexPath:(NSIndexPath *)index;

- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;
- (void)loadData:(id)responseObject;

@end
