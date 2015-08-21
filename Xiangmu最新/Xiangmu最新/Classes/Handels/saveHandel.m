//
//  saveHandel.m
//  
//
//  Created by lanou3g on 15/8/20.
//
//

#import "saveHandel.h"

@implementation saveHandel
//创建单例
static sqlite3*_db;
+(instancetype)shareInstance{
    static saveHandel *handle=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handle=[[saveHandel alloc]init];
        
    });
    return handle;
}

-(BOOL)saveHomeModel:(HomeModel *)model{
    [self open];
    NSString*createSql=@"CREATE TABLE home (id TEXT,name TEXT,content TEXT,title TEXT,coverimg TEXT);";
    char*errmsg1=NULL;
    int result1= sqlite3_exec(_db, createSql.UTF8String, NULL, NULL, &errmsg1);
    if (result1==SQLITE_OK) {
        NSLog(@"创建表成功");
    }else{
        NSLog(@"创建表失败%s",errmsg1);
    }

    NSString *insertSql=[NSString stringWithFormat:@"insert into home(id,content,name,title,coverimg) values('%@','%@','%@','%@','%@')",model.id,model.content,model.name,model.title,model.coverimg];
    
    char*errmsg2=NULL;
    int result2=sqlite3_exec(_db, insertSql.UTF8String, NULL, NULL, &errmsg2);
    if (result2==SQLITE_OK) {
        NSLog(@"添加成功");
        [self close];
        return YES;
    }else{
        NSLog(@"添加失败%s",errmsg2);
        [self close];
        return NO;
    }
 
}

-(void)open{
    NSString*documentsPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString*dbPath=[documentsPath stringByAppendingPathComponent:@"save.db"];
    NSLog(@"%@",dbPath);
    int result= sqlite3_open(dbPath.UTF8String, &_db);
    if (result==SQLITE_OK) {
        NSLog(@"创建(连接)数据库成功");
    }else{
        NSLog(@"创建(连接)数据库失败");
    }
}

-(void)close{
    int result3= sqlite3_close(_db);
    if (result3==SQLITE_OK) {
        NSLog(@"关闭数据库成功");
        _db=nil;
    }else{
        NSLog(@"关闭数据库失败");
    }
    
}


@end
