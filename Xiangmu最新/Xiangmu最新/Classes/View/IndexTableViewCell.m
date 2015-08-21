//
//  IndexTableViewCell.m
//  xiangmu
//
//  Created by lanou3g on 15/8/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "IndexTableViewCell.h"
#import "saveHandel.h"
#import "HomeManger.h"
@implementation IndexTableViewCell



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setHomeModel:(HomeModel *)homeModel{
    self.nameLable.text=homeModel.name;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:homeModel.coverimg]placeholderImage:nil];
    self.titleLable.text=homeModel.title;
    self.contentLable.text=homeModel.content;
    
    CGFloat height=[self getTextLabelHeight:homeModel.content];
    CGRect frame=_contentLable.frame;
    frame.size.height=height;
    _contentLable.frame=frame;

}

-(CGFloat)getTextLabelHeight:(NSString *)text{
    CGSize size=CGSizeMake(320, 88888);
    NSDictionary *dic=@{NSFontAttributeName:[UIFont systemFontOfSize:15.0]};
    CGRect rect=[text boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.height;
    
    
    
}

#pragma mark - 喜欢收藏
- (IBAction)saveButton:(id)sender {
 //[[HomeManger sharedInstance]getModelWithIndex:]
  //  NSLog(@"%d",((UITableViewCell *)[[sender superview]superview]).r
    
   // [self.tableView indexPathForCell:(UITableViewCell *)[sender sup]]
    
    BOOL bo=[[saveHandel shareInstance]saveHomeModel:_homeModel];
    if (bo==YES) {
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"收藏成功" delegate:nil cancelButtonTitle:@"确定"otherButtonTitles: nil];
        [sender setImage:[UIImage imageNamed:@"已收藏.png"]forState:UIControlStateNormal];
        [alert show];
    }else{
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"该信息已经被收藏过" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
    
}



@end
