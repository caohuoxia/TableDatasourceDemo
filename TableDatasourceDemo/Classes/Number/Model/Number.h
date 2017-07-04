//
//  Number.h
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Number : NSObject
@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *detail;
+ (instancetype)number;
@end
