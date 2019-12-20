//
//  JHCreateViewTool.m
//  OCOperation
//
//  Created by 李江湖 on 2019/12/13.
//  Copyright © 2019 李江湖. All rights reserved.
//

#import "JHCreateViewTool.h"


@implementation JHCreateViewTool



+ (JHCreateViewTool *)sharedManager {
        static dispatch_once_t once;
       static JHCreateViewTool *instance;
       dispatch_once(&once, ^{
           instance = [[JHCreateViewTool alloc] init];
       });
        
       return instance;
}
- (ButtonBlock)button{
    return ^(UIButtonType type){
        UIButton *button = [UIButton buttonWithType:type];
       return button;
    };
}

- (TableViewBlock)tableView{
    return ^(CGRect frame,UITableViewStyle style){
        UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
        return tableView;
    };
}
- (UIImageView *(^)(void))imageView {
    return ^(void){
         UIImageView *imageView = [[UIImageView alloc]init];
        return imageView;
    };
}

- (UILabel *(^)(void))label{
    return ^(void){
        UILabel *lable = [[UILabel alloc] init];
        return lable;
    };
}

- (UIView *(^)(void))view{
    return ^(void){
        UIView *view = [[UIView alloc] init];
        return view;
    };
}
@end
