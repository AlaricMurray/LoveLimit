//
//  ListViewController.m
//  LoveLimitApp
//
//  Created by ZJQ on 15/10/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ZJQListViewController.h"
#import "UIImageView+AFNetworking.h"
#import "ZJQClassViewController.h"
#import "AppDelegate.h"
#import "ZJQSetViewController.h"
#import "EGORefreshTableHeaderView.h"
#import "LoadMoreTableFooterView.h"
@interface ZJQListViewController ()<EGORefreshTableHeaderDelegate,LoadMoreTableFooterDelegate>
{
    EGORefreshTableHeaderView *_refreshHeaderView;
    LoadMoreTableFooterView * _footView;
    BOOL _reloading;
    BOOL _headerRefresh;
}
@end

@implementation ZJQListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatLeftOrRightButtonTitle:@"分类" andAction:@selector(cateButtonClick:) andLeft:YES];
    [self creatLeftOrRightButtonTitle:@"设置" andAction:@selector(setButtonClick:) andLeft:NO];
    
    
    [self createUI];
    
       
    

}



-(void)createUI{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 49) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    
//    //下拉刷新
//    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefresh)];
//    //上拉加载
//    _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upRefresh)];
    
    _page = 2;
    _refreshHeaderView = [[EGORefreshTableHeaderView alloc] init];
    _refreshHeaderView.frame = CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.tableView.bounds.size.width, self.tableView.bounds.size.height);
    _refreshHeaderView.delegate = self;
    [self.tableView addSubview:_refreshHeaderView];
    
    
    _footView = [[LoadMoreTableFooterView alloc] init];
    
    _footView.frame = CGRectMake(0,0,  self.tableView.bounds.size.width, 0);
    
    _footView.delegate = self;
    
    self.tableView.tableFooterView = _footView;
    
    
    [_refreshHeaderView refreshLastUpdatedDate];

    
    
    
}
- (void)finishRefresh{
    //LOG_METHOD;
    
    if (NO == _headerRefresh) {
        //上拉加载
        [self.tableView reloadData];
        [_footView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
    }
    else{
        //下拉刷新 默认刷新
        
        [self.tableView reloadData];
        [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
    }
    _reloading = NO;
}

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view{
    //LOG_METHOD;
    _reloading = YES;
    
    NSString *url = [NSString stringWithFormat:self.urlStr,1];
      [self startRequest:url andTag:1];
    
    [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(finishRefresh) userInfo:nil repeats:NO];
    
}


- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view{
    //   NSLog(@"isLoading");
    //LOG_METHOD;
    return _reloading;
}

- (NSDate *)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView *)view{
    //LOG_METHOD;
    return [NSDate date];
}

#pragma mark - Footer Refresh delegate methods

- (void)egoRefreshTableFootDidTriggerRefresh:(LoadMoreTableFooterView*)view{
    //LOG_METHOD;
    _reloading = YES;
   
        NSString *url = [NSString stringWithFormat:self.urlStr,_page++];
      [self startRequest:url andTag:2];
  
    
    
    [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(finishRefresh) userInfo:nil repeats:NO];
    
}
- (BOOL)egoRefreshTableFootDataSourceIsLoading:(LoadMoreTableFooterView*)view{
    //LOG_METHOD;
    return _reloading;
    
}

- (NSDate*)egoRefreshTableFootDataSourceLastUpdated:(LoadMoreTableFooterView*)view{
    //LOG_METHOD;
    return  [NSDate date];
}


#pragma mark - scroll delegate methods

//scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //LOG_METHOD;
    
    CGPoint offset1 = scrollView.contentOffset;
    CGRect bounds1 = scrollView.bounds;
    UIEdgeInsets inset1 = scrollView.contentInset;
    float y1 = offset1.y + bounds1.size.height - inset1.bottom;
    
    if (y1 > self.tableView.frame.size.height) { //判断是下拉刷新 还是上拉加载
        _headerRefresh = NO;    //上拉加载
        [_footView egoRefreshScrollViewDidScroll:scrollView];
    }
    else if (y1 < self.tableView.frame.size.height) {
        _headerRefresh = YES;   //下拉刷新
        [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    }
    else if (y1 == self.tableView.frame.size.height) {
        //        DLog(@"%@", flagShuaxin ? @"上拉刷新" : @"下拉刷新");
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    //LOG_METHOD;
    
    if (YES == _headerRefresh ) { //下拉刷新
        [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    }
    else{ //上拉加载更多
        [_footView egoRefreshScrollViewDidEndDragging:scrollView];
    }
}





-(void)setUI:(NSString *)title cellTitle:(NSString *)cellTitle cellID:(NSString *)cellID andURl:(NSString *)url{
    
    
    self.navigationItem.title = title;
    
    [self.tableView registerNib:[UINib nibWithNibName:cellTitle bundle:nil] forCellReuseIdentifier:cellID];
    
    self.urlStr = url;

    //[self.tableView.header beginRefreshing];
    
}

//- (void)downRefresh{
//    NSString *url = [NSString stringWithFormat:self.urlStr,1];
//    [self startRequest:url andTag:1];
//}
//- (void)upRefresh{
//    NSString *url = [NSString stringWithFormat:self.urlStr,_page ++];
//    [self startRequest:url andTag:2];
//}
//
#pragma mark - 数据请求
- (void)startRequest:(NSString *)url andTag:(NSInteger)tag{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (tag == 1) {
            [_dataArray removeAllObjects];
            [self loadData:responseObject];
            _page = 2;
        }else if (tag == 2){
            [self loadData:responseObject];
        }
        
        [_tableView reloadData];
//        [_tableView.header endRefreshing];
//        [_tableView.footer endRefreshing];

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
//        [_tableView.header endRefreshing];
//        [_tableView.footer endRefreshing];
    }];
    
}





#pragma mark - 数据解析
- (void)loadData:(id)responseObject{
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        NSArray *array = [responseObject objectForKey:@"applications"];
        for (NSDictionary *subDic in array) {
            ZJQAppModel *model = [[ZJQAppModel alloc] init];

            [model setValuesForKeysWithDictionary:subDic];
            
            [_dataArray addObject:model];
        }
    }
}

- (void)cateButtonClick:(UIButton *)button{
    ZJQClassViewController * myclass = [[ZJQClassViewController alloc]init];
    AppDelegate * app = [[UIApplication sharedApplication]delegate];
    
    myclass.delegate = self;
    myclass.hidesBottomBarWhenPushed = YES;
    app.title = self.navigationItem.title;
    [self.navigationController pushViewController:myclass animated:YES];
}


//-(void)cateViewControllerToList:(NSString *)url{
//    
//    self.urlStr = url;
//    [self.tableView.header beginRefreshing];
//    
//}

- (void)setButtonClick:(UIButton *)button{
    ZJQSetViewController * set = [[ZJQSetViewController alloc]init];
    [self.navigationController pushViewController:set animated:YES];
}

#pragma mark - UITableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZJQAppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"iden" forIndexPath:indexPath];
    
    [self customCell:cell andIndexPath:indexPath];
    
    return cell;
}

#pragma mark - cell的设置
- (void)customCell:(UITableViewCell *)myCell andIndexPath:(NSIndexPath *)index{
    ZJQAppCell *cell = (ZJQAppCell *)myCell;
    ZJQAppModel *model = _dataArray[index.row];
    NSURL *url = [NSURL URLWithString:model.iconUrl];
 
    [cell.iconImageView sd_setImageWithURL:url];
    
    cell.titleLabel.text = model.name;
    cell.priceLabel.text = [NSString stringWithFormat:@"¥：%@.0",model.lastPrice];
    cell.styleLabel.text = model.categoryName;
    NSString *all = [NSString stringWithFormat:@"收藏：%@次 分享：%@次 下载：%@次",model.favorites,model.shares,model.downloads];
    cell.otherLabel.text = all;
    
    
    [cell.view1 setStarLevel:model.starOverall];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ZJQDetailViewController *detail = [[ZJQDetailViewController alloc] init];
    
    ZJQAppModel *model = _dataArray[indexPath.row];
    detail.model = model.applicationId;
    detail.name = model.name;
    detail.hidesBottomBarWhenPushed = YES;
    detail.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:detail animated:YES];
    
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
