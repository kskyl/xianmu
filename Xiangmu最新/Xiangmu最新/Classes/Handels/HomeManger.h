//
//  HomeManger.h
//  xiangmu
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeModel.h"

@interface HomeManger : NSObject
//创建单例
+(instancetype)sharedInstance;
@property(nonatomic,retain)NSMutableArray *allDataArray;

//解析数据
-(void)getAllDataWithResult:(void (^)(NSMutableArray *))result;
//返回数组个数
-(NSInteger)dataCount;
//根据下标返回对象
-(HomeModel *)getModelWithIndex:(NSInteger)index;

@end
