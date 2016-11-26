//
//  DetailViewController.h
//  LoveLimitApp
//
//  Created by ZJQ on 15/10/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJQAppModel.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "Header.h"
#import "ZJQ.h"

@interface ZJQDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *styleLabel;
@property (strong, nonatomic) IBOutlet UIView *backView;
@property (strong, nonatomic) IBOutlet UIScrollView *detailScrollView;
@property (strong, nonatomic) IBOutlet UIScrollView *imageScrollView;
- (IBAction)shareButtonClick:(id)sender;

- (IBAction)collectButtonClick:(id)sender;
- (IBAction)downloadButtonClick:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *collectButton;


@property (nonatomic, strong) NSString *model;
@property (nonatomic , strong)ZJQAppModel * appModel;


@property (nonatomic , strong)NSString * name;

@end
