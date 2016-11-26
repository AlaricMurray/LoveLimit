//
//  ZJQAppCell.h
//  ZJQAppLimit
//
//  Created by ZJQ on 15/10/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ZJQAppCell.h"

@implementation ZJQAppCell

- (void)awakeFromNib {
    // Initialization code
   
    _view1 = [[ZJQStarView alloc] initWithFrame:CGRectMake(90, 55, 65, 23)];
    [self.contentView addSubview:_view1];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
