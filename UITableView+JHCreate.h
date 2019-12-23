//
//  UITableView+JHCreate.h
//  JHCreateViewTool
//
//  Created by 李江湖 on 2019/12/18.
//  Copyright © 2019 李江湖. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface UITableView (JHCreate)
///设置代理 参数1：id代理设置给谁
- (UITableView *(^)(id))JH_delegate;
/*设置分隔线 参数1：UITableViewCellSeparatorStyle
   UITableViewCellSeparatorStyleNone,//隐藏默认分隔线
   UITableViewCellSeparatorStyleSingleLine,//默认分隔线
   UITableViewCellSeparatorStyleSingleLineEtched
 **/
- (UITableView *(^)(UITableViewCellSeparatorStyle))JH_separatorStyle;
///设置cell自动调整高度
- (UITableView *(^)(void))JH_automaticHeight;
///默认设置 参数1：id代理设置给谁
- (UITableView *(^)(id))JH_defaullSetting;
///设置注册cell 参数1：class
- (UITableView *(^)(id))JH_registClass;
#pragma mark --基本属性
///CGRect
- (UITableView *(^)(CGRect frame))JH_frame;
/// UIColor
- (UITableView *(^)(UIColor *))JH_backgroundColor;
///设置中心位置 参数1：CGPoint
- (UITableView *(^)(CGPoint))JH_center;
///设置透明度 参数1 ：CGFloat
- (UITableView *(^)(CGFloat))JH_alpha;
///设置隐藏 参数1：BOOL
- (UITableView *(^)(BOOL))JH_hidden;
//设置交互开关 参数1：BOOL
- (UITableView *(^)(BOOL))JH_userInteractionEnabled;
///设置四周圆角 参数1 ：CGFloat
- (UITableView *(^)(CGFloat))JH_cornerRadius;
///设置多个圆角 参数1：上左 参数2：上右 参数3：下左 参数4：下右 参数5 ：圆角大小
- (UITableView *(^)(BOOL,BOOL,BOOL,BOOL,CGFloat))JH_cornerRadius_tlbr;
///设置默认倒圆角 参数1：CGFoat
- (UITableView *(^)(CGFloat))JH_cornerRadius_sytle;
@end

