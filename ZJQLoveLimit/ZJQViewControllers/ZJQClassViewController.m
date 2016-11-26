//
//  ClassViewController.m
//  爱限免
//
//  Created by ZJQ on 15/10/24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZJQClassViewController.h"
#import "ZJQClassCell.h"
#import "ZJQClassModel.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "AppDelegate.h"


@interface ZJQClassViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , strong)NSMutableArray * dataArray;
@property (nonatomic , strong)NSMutableArray * dataArray1;

@property (nonatomic , strong)UITableView * tableView;

@end

@implementation ZJQClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
   

    
}




-(void)createUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _dataArray = [[NSMutableArray alloc]initWithCapacity:0];
    _dataArray1 = [[NSMutableArray alloc]initWithCapacity:0];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    [_tableView registerNib:[UINib nibWithNibName:@"ZJQClassCell" bundle:nil] forCellReuseIdentifier:@"cate"];
    
    [self startrequest];
    
}


-(void)startrequest{
    
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    AppDelegate * app = [[UIApplication sharedApplication]delegate];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@分类",app.title];
    
    if ([app.title isEqualToString:@"限免"]) {
        _urlStr = k_SORTLIST_LIMITED_URL;
    }else if ([app.title isEqualToString:@"降价"]){
        _urlStr = k_SORTLIST_SALES_URL;
        
    }else if ([app.title isEqualToString:@"免费"]){
        _urlStr = k_SORTLIST_FREE_URL;
        
    }else if ([app.title isEqualToString:@"热榜"]){
        _urlStr = k_SORTLIST_URL;
        
    }
    
    
    [manager GET:_urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSArray * array = responseObject[@"category"];
            for (NSDictionary * dic in array) {
                ZJQClassModel * model = [[ZJQClassModel alloc]init];
                model.categoryName = dic[@"categoryName"];
                model.count = dic[@"count"];
                model.categoryId = dic[@"categoryId"];
                
                [_dataArray addObject:model];
            }
            [_tableView reloadData];
        }
        if ([responseObject isKindOfClass:[NSArray class]]) {
            NSArray * array1 = [NSArray arrayWithArray:responseObject];
            for (NSDictionary * dic in array1) {
                ZJQClassModel * model = [[ZJQClassModel alloc]init];
                model.categoryId = dic[@"categoryId"];
                
                model.categoryCname = dic[@"categoryCname"];
                model.categoryCount = dic[@"categoryCount"];
                model.picUrl = dic[@"picUrl"];
                [_dataArray addObject:model];
                
            }
            [_tableView reloadData];
        }
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"ERROR");
         }];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZJQClassCell * cell = [_tableView dequeueReusableCellWithIdentifier:@"cate" forIndexPath:indexPath];
    ZJQClassModel * model = _dataArray[indexPath.row];
   
   
    if (model.categoryCname == nil) {
        

        cell.nameLabel.text = model.categoryName;
        cell.descLabel.text = [NSString stringWithFormat:@"当前分类一共有%@个",model.count];
      
        cell.iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"category_%@.jpg",model.categoryName]];
        if (cell.iconImageView.image == nil) {
            cell.iconImageView.image = [UIImage imageNamed:@"category_All.jpg"];
        }
        
    }else{
        cell.nameLabel.text = model.categoryCname;
        cell.descLabel.text = [NSString stringWithFormat:@"当前分类一共有%@个",model.categoryCount];
        [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.picUrl]];
    }
    
    
    
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AppDelegate * app = [[UIApplication sharedApplication]delegate];

    if ([app.title isEqualToString:@"限免"]) {
        _urlStr = k_LIST_LIMITED_URL;
    }else if ([app.title isEqualToString:@"降价"]){
        _urlStr = k_LIST_SALES_URL;
        
    }else if ([app.title isEqualToString:@"免费"]){
        _urlStr = k_LIST_FREE_URL;
        
    }else if ([app.title isEqualToString:@"热榜"]){
        _urlStr = n_LIST_HOST_URL;
        
    }
    
    ZJQClassModel * model = _dataArray[indexPath.row];
    _urlStr = [_urlStr stringByAppendingString:model.categoryId];
    
    
    
    [self.delegate cateViewControllerToList:_urlStr];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
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
