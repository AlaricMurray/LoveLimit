//
//  ZJQ.m
//  Day6 - FMDB(封装)
//
//  Created by ZJQ on 15/10/24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZJQ.h"

@implementation ZJQ


+(ZJQ *)shareManager{
    static ZJQ * manager = nil;
    if (manager == nil) {
        manager = [[ZJQ alloc]init];
    }
    return manager;
}

-(instancetype)init{
    
    self = [super init];
    if (self) {
        
        NSString * path = [NSHomeDirectory() stringByAppendingString:@"/Documents/LoveAppInfo2.db"];
        NSLog(@"%@",path);
        
        _fmdb = [[FMDatabase alloc]initWithPath:path];
        BOOL open =  [_fmdb open];
        if (open) {
            
            NSString * sql = @"create table if not exists App (ID integer primary key ,name varchar(256),image varchar(256),url varchar(256))";
          
            BOOL success = [_fmdb executeUpdate:sql];
            if (success) {
                NSLog(@"创建成功");
            }else{
                NSLog(@"%@",_fmdb.lastErrorMessage);
            }
            
        }else{
            NSLog(@"%@",_fmdb.lastErrorMessage);
        }

    }
    return self;
}


-(void)insertInfo:(ZJQAppModel *)model andID:(NSInteger)ID{
    NSString * sql = @"insert into App(ID,name,image,url) values(?,?,?,?)";
  
    NSString * name = model.name;
    NSString * image = model.iconUrl;
    NSString * url = model.itunesUrl;
    
   
    NSNumber * number = [NSNumber numberWithInteger:ID];
    BOOL success = [_fmdb executeUpdate:sql,number,name,image,url];
    if (success) {
        NSLog(@"插入成功");
    }else{
        NSLog(@"%@",_fmdb.lastErrorMessage);
    }

}





-(NSArray *)allPerson{
    
    NSString * sql = @"select * from App ";
  
    FMResultSet * set = [_fmdb executeQuery:sql];
    
    NSMutableArray * array = [[NSMutableArray alloc]initWithCapacity:0];
    while ([set next]) {
        
        ZJQAppModel * model = [[ZJQAppModel alloc]init];
        model.name = [set stringForColumn:@"name"];
        model.iconUrl = [set stringForColumn:@"image"];
        model.itunesUrl = [set stringForColumn:@"url"];
        [array addObject:model];
    }
    
    
    return array;
}










@end
