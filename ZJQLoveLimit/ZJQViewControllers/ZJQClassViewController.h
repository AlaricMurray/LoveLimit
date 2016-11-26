//
//  ClassViewController.h
//  爱限免
//
//  Created by ZJQ on 15/10/24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"



@protocol cateDelegate <NSObject>

-(void)cateViewControllerToList:(NSString *)url;

@end


@interface ZJQClassViewController : UIViewController


@property (nonatomic , strong)NSString * urlStr;
@property (nonatomic , assign)id<cateDelegate> delegate;

@end
