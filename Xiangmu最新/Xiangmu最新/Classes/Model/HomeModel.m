//
//  HomeModel.m
//  xiangmu
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
    
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@,%@,%@,%@,%@,%@,%@",_name,_title,_content,_id,_coverimg,_date,_enname];
}

@end
