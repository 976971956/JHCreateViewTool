//
//  JHCreateViewTool.h
//  OCOperation
//
//  Created by 李江湖 on 2019/12/13.
//  Copyright © 2019 李江湖. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIButton+JHCreate.h"
#import "UILabel+JHCreate.h"
#import "UIView+JHCreate.h"
#import "UIImageView+JHCreate.h"
#import "UITableView+JHCreate.h"

@interface JHCreateViewTool : NSObject
typedef  UIButton*(^ButtonBlock)(UIButtonType type);
typedef  UITableView*(^TableViewBlock)(CGRect frame,UITableViewStyle style);

@property(nonatomic,copy)ButtonBlock button;
@property(nonatomic,copy)TableViewBlock tableView;

/// hhh
+ (JHCreateViewTool *)sharedManager;

- (UIImageView *(^)(void))imageView;
- (UILabel *(^)(void))label;
- (UIView *(^)(void))view;
@end

