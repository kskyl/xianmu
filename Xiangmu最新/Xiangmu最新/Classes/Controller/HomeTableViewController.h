//
//  HomeTableViewController.h
//  xiangmu
//
//  Created by lanou3g on 15/8/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewController : UITableViewController<UIScrollViewDelegate>
@property(nonatomic,retain) UIScrollView *scrollView;
@property(nonatomic,retain)UIPageControl *pageControl;
@property(nonatomic,retain)HomeModel *homeModel;
@end
