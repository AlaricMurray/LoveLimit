//
//  SmallCell.h
//  LoveLimitApp
//
//  Created by ZJQ on 15/10/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJQSmallCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;

- (void)creatSmallCellUI:(NSDictionary *)dic;

@end
