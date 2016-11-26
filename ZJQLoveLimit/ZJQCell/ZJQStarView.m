//
//  StarView.m
//  LoveLimitApp
//
//  Created by ZJQ on 15/10/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ZJQStarView.h"

@implementation ZJQStarView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    
    _backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 65, 23)];
    _backgroundImage.image = [UIImage imageNamed:@"StarsBackground.png"];
    [self addSubview:_backgroundImage];
    
    
    _foregroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 65, 23)];
    _foregroundImage.image = [UIImage imageNamed:@"StarsForeground.png"];
    [self addSubview:_foregroundImage];
    
    
    _foregroundImage.clipsToBounds = YES;
    
    
    _foregroundImage.contentMode = UIViewContentModeLeft;
    
}
- (void)setStarLevel:(NSString *)level{
 
    _foregroundImage.frame = CGRectMake(0, 0, _backgroundImage.frame.size.width * level.floatValue / 5, 23);
}


@end
