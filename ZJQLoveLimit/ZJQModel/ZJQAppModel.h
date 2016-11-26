//
//  AppModel.h
//  Day07-AppLimit
//
//  Created by ZJQ on 15/10/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZJQAppModel : NSObject


@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *expireDatetime;
@property (nonatomic, strong) NSString *lastPrice;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, strong) NSString *favorites;
@property (nonatomic, strong) NSString *shares;
@property (nonatomic, strong) NSString *downloads;
@property (nonatomic, strong) NSString *starOverall;
@property (nonatomic, strong) NSString *currentPrice;
@property (nonatomic , strong) NSString * itunesUrl;


//applicationId  appID
@property (nonatomic, strong) NSString *applicationId;

@end
