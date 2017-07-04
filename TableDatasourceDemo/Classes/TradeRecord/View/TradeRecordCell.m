//
//  TradeRecordCell.m
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TradeRecordCell.h"
#import "TradeRecordModel.h"

@interface TradeRecordCell ()
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbOprate;
@property (weak, nonatomic) IBOutlet UILabel *lbDate;
@property (weak, nonatomic) IBOutlet UILabel *lbBalance;

@end

@implementation TradeRecordCell

+ (instancetype)cellWithTableview:(UITableView*)tableview{
    static NSString *cellID = @"cell";
    TradeRecordCell *cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TradeRecordCell" owner:self options:nil] lastObject];//NSStringFromClass([self class])
    }
    
    return cell;
}

- (void)cellWithModel:(id)model{
    TradeRecordItem *item = model;
    self.lbTitle.text = item.name;
    self.lbOprate.text = item.operate;
    self.lbDate.text = item.createDate;
    self.lbBalance.text = item.balance;
}

@end
