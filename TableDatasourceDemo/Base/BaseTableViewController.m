//
//  BaseTableViewController.m
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()
{
    UIView *noDataView;
}
@end

@implementation BaseTableViewController

#pragma mark- 刷新处理
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 隐藏状态
    header.stateLabel.hidden = YES;
    //    // 马上进入刷新状态
    //    [header beginRefreshing];
    // 设置header
    self.tableView.mj_header = header;
    
    //上拉加载更多
    self.tableView.mj_footer = [MJChiBaoZiFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

- (void)loadMoreData{
}

- (void)loadNewData{
}

- (void)endRefreshing{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark- 没有数据页面处理
//添加没有数据页面
- (void)addNoDataViewWithFrame:(CGRect)frame{
    noDataView= [[UIView alloc]initWithFrame:frame];
    noDataView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.tableView addSubview:noDataView];
    //解决存在分割线问题
    self.tableView.tableFooterView = [UIView new];
    
    UIImage *image = [UIImage imageNamed:@"NoData"];
    CGSize sizeImage = image.size;
    UIImageView *imageView = [[UIImageView alloc]init];//和new初始化有什么区别呢？
    imageView.image = image;
    [noDataView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(noDataView.mas_top).offset(100);
        make.centerX.equalTo(noDataView);
        make.size.mas_equalTo(sizeImage);
    }];
}

//移除没有数据页面
- (void)removeNoDataView{
    
    [noDataView removeFromSuperview];
    noDataView = nil;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
