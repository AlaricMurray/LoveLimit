//
//  StarView.h
//  LoveLimitApp
//
//  Created by ZJQ on 15/10/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//
//

#import <UIKit/UIKit.h>

@interface ZJQStarView : UIView


@property (nonatomic, strong) UIImageView *backgroundImage;
@property (nonatomic, strong) UIImageView *foregroundImage;


- (void)setStarLevel:(NSString *)level;

@end
