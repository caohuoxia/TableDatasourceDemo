//
//  ViewController.m
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
#import "Number.h"
#import "ArrayDataSource.h"
#import "TradeRecordTVC.h"



@interface ViewController ()
{
    NSString *titleTest;
}
@property(nonatomic, strong)UITableView *tb;
@property(nonatomic, strong)NSMutableArray *datalist;
@property(nonatomic, strong)ArrayDataSource *myDatasource;
@property(nonatomic, copy)NSString *titleTest; 
@end

@implementation ViewController
- (void)setTitleTest:(NSString *)title{
    if (titleTest!=title) {
        titleTest = title;
    }
}

- (NSString *)titleTest{ 
    return titleTest;
}

- (UITableView *)tb{
    if (!_tb) {
        _tb = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        //自动调整行高设置+xib约束布局 ok
        _tb.estimatedRowHeight = 80;
        _tb.rowHeight = UITableViewAutomaticDimension;
        [_tb registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellReuseIdentifier:@"MyCell"];
    }
    
    return _tb;
}

- (NSMutableArray *)datalist{
    if (!_datalist) {
        _datalist = [NSMutableArray arrayWithCapacity:10];
        //添加假数据
        for (int i = 0; i < 10; i++) {
            Number *num = [Number number];
            [_datalist addObject:num];
        }
    }
    
    return _datalist;
}

- (void)toTradeRecord{
    [self.navigationController pushViewController:[[TradeRecordTVC alloc]init] animated:NO];
}
- (void)addNavigationItem{
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"资金流水" style:UIBarButtonItemStylePlain target:self action:@selector(toTradeRecord)];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.titleTest = [NSMutableString stringWithString:@"烦死了"];
//    self.titleTest = [NSMutableString stringWithString:@"你好"];
//    self.title = self.titleTest;
    [self setTitleTest:@"huoxia"];
    self.title = self.titleTest;//[self titleTest];
    
    [self addNavigationItem];
    
    ArrayDataSource * myDatasource = [[ArrayDataSource alloc]initWithItems:self.datalist cellIdentifier:@"MyCell" configureCellBlock:^(id cell, id item) {
        [cell cellWithModel:item];
    }];
    self.myDatasource = myDatasource;
    self.tb.dataSource = self.myDatasource;
    
    [self.view addSubview:self.tb];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
