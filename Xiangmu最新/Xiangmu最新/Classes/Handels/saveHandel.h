//
//  saveHandel.h
//  
//
//  Created by lanou3g on 15/8/20.
//
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "HomeModel.h"
@interface saveHandel : NSObject
+(instancetype)shareInstance;
//创建数据库

-(BOOL)saveHomeModel:(HomeModel *)model;

@end
