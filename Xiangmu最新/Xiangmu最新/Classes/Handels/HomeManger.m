//
//  HomeManger.m
//  xiangmu
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HomeManger.h"
@implementation HomeManger
#pragma mark - 创建单例
+(instancetype)sharedInstance{
    static HomeManger *manger=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manger=[[HomeManger alloc]init];
    });
    return manger;
}

#pragma mark - 获取数据
-(void)getAllDataWithResult:(void (^)(NSMutableArray *))result{
    //解析数据
    AFHTTPRequestOperationManager *manger=[[AFHTTPRequestOperationManager alloc]init];
    manger.securityPolicy.allowInvalidCertificates=YES;
    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manger POST:Kurl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *data=[operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
        NSMutableDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableDictionary *dic1=[dic objectForKey:@"data"];
        
        NSArray *array=[dic1 objectForKey:@"list"];
                self.allDataArray=[NSMutableArray array];
        for (NSDictionary *dict in array) {
            HomeModel *model=[[HomeModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            
            if ([model.name isEqualToString:@"音乐"]||[model.name isEqualToString:@"Ting"]) {
                continue;
            }
            [_allDataArray addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            result(_allDataArray);
        });
        for (HomeModel *model in _allDataArray) {
            NSLog(@"%@",model);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"function==%s line==%d error==%@",__FUNCTION__,__LINE__,error);
    }];

}
#pragma mark - 返回数组个数
-(NSInteger)dataCount{
    return _allDataArray.count;
}

#pragma mark - 根据index找到对象
-(HomeModel *)getModelWithIndex:(NSInteger)index{
    HomeModel *model=[self.allDataArray objectAtIndex:index];
    return model;
    
    
}

#pragma mark - 懒加载
-(NSMutableArray *)allDataArray{
    if (!_allDataArray) {
        _allDataArray=[NSMutableArray array];
    }
    return _allDataArray;
}



@end
