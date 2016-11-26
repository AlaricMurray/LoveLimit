//
//  SmallCell.m
//  LoveLimitApp
//
//  Created by ZJQ on 15/10/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ZJQSmallCell.h"
#import "UIImageView+WebCache.h"

@implementation ZJQSmallCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)creatSmallCellUI:(NSDictionary *)dic{
    _titleLabel.text = [dic objectForKey:@"name"];
    _detailLabel.text = [NSString stringWithFormat:@"评论%@次 下载%@次",[dic objectForKey:@"ratingOverall"],[dic objectForKey:@"downloads"]];
    
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"iconUrl"]]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
