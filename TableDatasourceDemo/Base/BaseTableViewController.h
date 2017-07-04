//
//  BaseTableViewController.h
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
#import <MJRefresh.h>
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter.h"

@interface BaseTableViewController : UITableViewController
- (void)endRefreshing;
- (void)addNoDataViewWithFrame:(CGRect)frame;
- (void)removeNoDataView;
@end
