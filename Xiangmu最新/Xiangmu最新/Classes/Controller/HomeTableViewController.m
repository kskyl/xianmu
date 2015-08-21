//
//  HomeTableViewController.m
//  xiangmu
//
//  Created by lanou3g on 15/8/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HomeTableViewController.h"
#import "HomeModel.h"
#import "HomeManger.h"
#import "IndexTableViewCell.h"
#import "SelectionViewController.h"
@interface HomeTableViewController ()
@property(nonatomic,strong)NSMutableArray *modelArray;
@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *nib=[UINib nibWithNibName:@"IndexTableViewCell" bundle:Nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"myHomeCell"];
    [self creatSetScrollerView];
  //解析数据
     [[HomeManger sharedInstance]getAllDataWithResult:^(NSMutableArray *array) {
        self.modelArray=array;
        [self.tableView reloadData];
    }];
}
    
 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[HomeManger sharedInstance]dataCount];
    
}

////设置区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 150;
}

//创建scrollView
-(void)creatSetScrollerView{
    //创建scrollview
    self.scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(10, 5, CGRectGetWidth(self.view.frame), 150)];
    
    //设置分页效果
    _scrollView.pagingEnabled=YES;
    [self.view addSubview:_scrollView];
    //设置scrollView内容区域大小
    _scrollView.contentSize=CGSizeMake(4*CGRectGetWidth(_scrollView.frame),CGRectGetHeight(_scrollView.frame));
    for (int i=0; i<4; i++) {
       // HomeModel *model=[[HomeModel alloc]init];
              NSString *imageName=[NSString stringWithFormat:@"image%d.jpg",i];
        
        //通过图片名创建图片对象
       UIImage *image=[UIImage imageNamed:imageName];
        
        UIImageView *imamgeView=[[UIImageView alloc]initWithImage:image];
               imamgeView.frame=CGRectMake(i*CGRectGetWidth(_scrollView.frame), 0, CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_scrollView.frame));
        //把imageView添加到scrollView上面
        [_scrollView addSubview:imamgeView];
    }
    _scrollView.delegate=self;
    self.pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(200,80, 150, 30)];
    _pageControl.backgroundColor=[UIColor yellowColor];
   // [self.scrollView addSubview:_pageControl];
    //设置圆点的个数
    _pageControl.numberOfPages=4;
    //设置未选中点的颜色
    _pageControl.pageIndicatorTintColor=[UIColor blackColor];
    //设置选中圆点的颜色
    _pageControl.currentPageIndicatorTintColor=[UIColor whiteColor];
    //由于pagControl是继承自UIControl
    [_pageControl addTarget:self action:@selector(exchangeImage:) forControlEvents:UIControlEventValueChanged];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IndexTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myHomeCell" forIndexPath:indexPath];
    
    HomeModel *model=[[HomeManger sharedInstance]getModelWithIndex:indexPath.row];
    cell.homeModel=model;
    cell.backgroundColor=[UIColor clearColor];
   
    return cell;
}


//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeModel *model=[[HomeManger sharedInstance]getModelWithIndex:indexPath.row];
    IndexTableViewCell *cell=[[IndexTableViewCell alloc]init];
    CGFloat height=[cell getTextLabelHeight:model.content];
    return height+290;

}

//自定义区头
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
       return _scrollView;
}

-(void)exchangeImage:(UIPageControl *)pageControl{
    [_scrollView setContentOffset:CGPointMake(pageControl.currentPage*CGRectGetWidth(_scrollView.frame), 0) animated:YES];
}

//推出下一个页面

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
  //  SelectionViewController *selectionVC=[SelectionViewController alloc]initWithNibName:<#(NSString *)#> bundle:nil];
    
    
    
    
}








@end
