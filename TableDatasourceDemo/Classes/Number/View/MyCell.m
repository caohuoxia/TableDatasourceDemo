//
//  MyCell.m
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "MyCell.h"
#import "Number.h"

@interface MyCell()
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbDetail;

@end

@implementation MyCell

+ (instancetype)cellWithTableview:(UITableView*)tableview{
static NSString *cellID = @"cell";
    MyCell *cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyCell" owner:self options:nil] lastObject];
    }
    
    return cell;
}

- (void)cellWithModel:(id)model{
    Number *number = model;
    self.lbTitle.text = number.title;
    self.lbDetail.text =  number.detail;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
