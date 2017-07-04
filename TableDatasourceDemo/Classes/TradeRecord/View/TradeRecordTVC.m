//
//  TradeRecordTVC.m
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//
#import <MJRefresh.h>
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter.h"
#import "TradeRecordTVC.h"
#import "ArrayDataSource.h"
#import "TradeRecordCell.h"
#import "TradeRecordVM.h"

@interface TradeRecordTVC ()
@property(nonatomic, strong)NSMutableArray *tradeRecordItems;
@property(nonatomic, strong)ArrayDataSource *myDatasource;
@end

@implementation TradeRecordTVC 

//懒加载tradeRecordItems
- (NSMutableArray *)tradeRecordItems{
    if (!_tradeRecordItems) {
        _tradeRecordItems = [NSMutableArray array];
    }
    
    return _tradeRecordItems;
}

- (void)hideNoDataView{
    [self removeNoDataView];
}

- (void)addNoDataView{
    [self addNoDataViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //测试的两个按钮
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn setFrame:CGRectMake(0, 450, 100, 50)];
//    [btn setTitle:@"hideNoDataView" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(hideNoDataView) forControlEvents:UIControlEventTouchUpInside];
//    [self.tableView addSubview:btn];
//    
//    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn1 setFrame:CGRectMake(120, 450, 100, 50)];
//    [btn1 setTitle:@"addNoDataView" forState:UIControlStateNormal];
//    [btn1 addTarget:self action:@selector(addNoDataView) forControlEvents:UIControlEventTouchUpInside];
//    [self.tableView addSubview:btn1];
//    return;
    
    [self setupTable];
    
    [self getToken];
    
    [self dataAccess];
}

- (void)setupTable{
    self.tableView.estimatedRowHeight =  80;
    self.tableView.rowHeight = UITableViewAutomaticDimension; 
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"TradeRecordCell" bundle:nil] forCellReuseIdentifier:@"TradeRecordCell"];
    
    //重定向DataSource
    self.myDatasource = [[ArrayDataSource alloc] initWithItems:self.tradeRecordItems cellIdentifier:@"TradeRecordCell" configureCellBlock:^(id cell, id item) {
        [cell cellWithModel:item];
    }];
    self.tableView.dataSource = self.myDatasource;
}

- (void)dataAccess{
    TradeRecordVM *vm = [[TradeRecordVM alloc]init];
    
    __weak typeof(self) weakself = self;
    [vm getDataWithSuccess:^(NSMutableArray *datalist) {
        [weakself.tradeRecordItems removeAllObjects];
        [weakself.tradeRecordItems addObjectsFromArray:datalist];
//        //为什么下面这个代码，执行 数据是不会显示的呢？
//        weakself.tradeRecordItems = datalist;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.tableView reloadData];
            [weakself endRefreshing];
        });
    } fail:^(NSError *err) {
        NSLog(@"%@",err.description);
    }];
}

#pragma mark- 下拉刷新，上拉加载更多
- (void)loadMoreData{
    [self dataAccess];
}

- (void)loadNewData{
    [self dataAccess];
}

- (void)getToken{
    //请求登录接口，获取token
    [[NetworkManager sharedNetworkManager] postLoginWithAccount:@"hehe58" password:@"123456" success:^(id model) {
        [StaticTools saveToken:[model objectForKey:@"token"]];
    } failure:^(NSError *err) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
