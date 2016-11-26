//
//  ZJQ.h
//  Day6 - FMDB(封装)
//
//  Created by ZJQ on 15/10/24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "ZJQAppModel.h"


@interface ZJQ : NSObject

@property (nonatomic ,strong)FMDatabase * fmdb;

+(ZJQ *)shareManager;


-(void)insertInfo:(ZJQAppModel *)model andID:(NSInteger)ID;



-(NSArray *)allPerson;
@end
