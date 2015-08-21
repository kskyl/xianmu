//
//  IndexTableViewCell.h
//  xiangmu
//
//  Created by lanou3g on 15/8/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface IndexTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *nameLable;

@property (strong, nonatomic) IBOutlet UILabel *titleLable;
@property (strong, nonatomic) IBOutlet UILabel *contentLable;

@property(nonatomic,retain)HomeModel *homeModel;

@property (strong, nonatomic) IBOutlet UIButton *saveButton;

-(CGFloat)getTextLabelHeight:(NSString *)text;
@end
