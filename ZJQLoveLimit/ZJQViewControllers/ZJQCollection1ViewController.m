//
//  ZJQCollection1ViewController.m
//  ZJQLoveLimit
//
//  Created by ZJQ on 15/10/24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZJQCollection1ViewController.h"
#import "ZJQ.h"
#import "UIImageView+WebCache.h"
#import "ZJQAppModel.h"
@interface ZJQCollection1ViewController ()<UITableViewDataSource,UITableViewDelegate>



@property (nonatomic , strong)NSMutableArray * dataArray;
@property (nonatomic , strong)UITableView * tableView;

@end

@implementation ZJQCollection1ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}



-(void)createUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"我的收藏";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _dataArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    ZJQ * manager = [ZJQ shareManager];
    NSArray * array = [manager allPerson];
    for (ZJQAppModel * model in array) {
        [_dataArray addObject:model];
    }
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString * iden = @"iden";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    
    ZJQAppModel * model = _dataArray[indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.iconUrl]];
    cell.textLabel.text = model.name;
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZJQAppModel * model = _dataArray[indexPath.row];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:model.itunesUrl]];
    
    
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
