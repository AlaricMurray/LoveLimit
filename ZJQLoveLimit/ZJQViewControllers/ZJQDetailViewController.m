//
//  DetailViewController.m
//  LoveLimitApp
//
//  Created by ZJQ on 15/10/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ZJQDetailViewController.h"
#import "AppDelegate.h"
#import "UMSocial.h"

@interface ZJQDetailViewController ()<UMSocialUIDelegate>

@end

@implementation ZJQDetailViewController




-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    ZJQ * manager = [ZJQ shareManager];
    NSArray * array = [manager allPerson];
    for (ZJQAppModel * model in array) {
        if ([model.name isEqualToString:_name]) {
            [_collectButton setTitle:@"已收藏" forState:UIControlStateNormal];
        }
    }
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.navigationItem.title = @"应用详情";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    [self startRequest:[NSString stringWithFormat:k_DETAIL_URL,_model] andTag:1];
   
    [self startRequest:k_RECOMMEND_URL andTag:2];
    
    
}
- (void)startRequest:(NSString *)url andTag:(NSInteger)tag{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (tag == 1) {
            [self loadData:responseObject];
        }else if (tag == 2){
            [self loadDataForPerson:responseObject];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //
        NSLog(@"请求失败");
    }];
   
}
#pragma mark - 数据解析:附近的人正在用
- (void)loadDataForPerson:(id)responseObject{
    NSArray *array = [responseObject objectForKey:@"applications"];
    for (int i = 0; i < array.count; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5 + 70 * i, 0, 55, 55)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:[array[i] objectForKey:@"iconUrl"]]];
        [_imageScrollView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5 + 70 * i, 55, 55, 20)];
        label.text = [array[i] objectForKey:@"name"];
        label.font = [UIFont systemFontOfSize:10.0];
        label.textAlignment = NSTextAlignmentCenter;
        [_imageScrollView addSubview:label];
    }
    _imageScrollView.contentSize = CGSizeMake(10 + 70 * array.count, 75);
    _imageScrollView.showsVerticalScrollIndicator = NO;

}

#pragma mark - 数据解析:应用详情
- (void)loadData:(id)responseObject{
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        _titleLabel.text = [responseObject objectForKey:@"name"];
        [_iconImageView sd_setImageWithURL:[NSURL URLWithString:[responseObject objectForKey:@"iconUrl"]]];
        NSString *all = [NSString stringWithFormat:@"原价：¥%@.0 %@ %@MB",[responseObject objectForKey:@"lastPrice"],[responseObject objectForKey:@"priceTrend"],[responseObject objectForKey:@"fileSize"]];
        _priceLabel.text = all;
        NSString *cate = [NSString stringWithFormat:@"类型：%@ 评分：%@",[responseObject objectForKey:@"categoryName"],[responseObject objectForKey:@"starOverall"]];
        _styleLabel.text = cate;
        
        NSArray *array = [responseObject objectForKey:@"photos"];
        for (int i = 0; i < array.count; i ++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15 + 57 * i, 0, 45, 85)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:[array[i] objectForKey:@"smallUrl"]]];
            [_backView addSubview:imageView];
        }
        
        NSString *detail = [responseObject objectForKey:@"description_long"];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 280, 40)];
        label.text = detail;
        label.font = [UIFont systemFontOfSize:12.0];
        label.numberOfLines = 0;
        [label sizeToFit];
        [_detailScrollView addSubview:label];
        _detailScrollView.contentSize = CGSizeMake(280, label.frame.size.height);
        _appModel = [[ZJQAppModel alloc]init];
        [_appModel setValuesForKeysWithDictionary:responseObject];
        
    }
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






- (IBAction)shareButtonClick:(id)sender {
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5507875dfd98c5fef20001dd"
                                      shareText:@"你要分享的文字"
                                     shareImage:nil
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToFacebook,UMShareToTwitter,nil]
                                       delegate:self];
    
}

-(BOOL)isDirectShareInIconActionSheet{
    return YES;
}

- (IBAction)collectButtonClick:(id)sender {


    UIButton * button = (UIButton *)sender;
    
    //判断当按钮文字为已收藏时按钮改为不可用
    
    if ([button.currentTitle isEqualToString:@"已收藏"]) {
        return;
    }
    
    [button setTitle:@"已收藏" forState:UIControlStateNormal];
    
    //收藏
    
    ZJQ * manager = [ZJQ shareManager];
    //查询数据库里数据个数
    NSArray * array = [manager allPerson];
    [manager insertInfo:_appModel andID:array.count+1];
}

- (IBAction)downloadButtonClick:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_appModel.itunesUrl]];
}
@end


