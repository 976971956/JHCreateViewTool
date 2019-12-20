//
//  UIView+JHCreate.h
//  JHCreateViewTool
//
//  Created by 江湖 on 2019/12/16.
//  Copyright © 2019 李江湖. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger , JHShadowPathType) {
    JHShadowPathAll = 1,//全部
    JHShadowPathTop    = 2,//上
    JHShadowPathBottom = 3,//下
    JHShadowPathLeft   = 4,//左
    JHShadowPathRight  = 5,//右
    JHShadowPathTopLeft = 6,//上左
    JHShadowPathTopRight =7,//上右
    JHShadowPathBottomLeft = 8,//下左
    JHShadowPathBottomRight = 8,//下右

    JHShadowPathLeftRightBottom = 6,//左右下
    
};
@interface UIView (JHCreate)

#pragma mark --基本属性
///CGRect
- (UIView *(^)(CGRect frame))JH_frame;
/// UIColor
- (UIView *(^)(UIColor *))JH_backgroundColor;
///设置中心位置 参数1：CGPoint
- (UIView *(^)(CGPoint))JH_center;
///设置透明度 参数1 ：CGFloat
- (UIView *(^)(CGFloat))JH_alpha;
///设置隐藏 参数1：BOOL
- (UIView *(^)(BOOL))JH_hidden;
///设置交互开关 参数1：BOOL
- (UIView *(^)(BOOL))JH_userInteractionEnabled;
///设置四周圆角 参数1 ：CGFloat
- (UIView *(^)(CGFloat))JH_cornerRadius;
///设置多个圆角 参数1：上左 参数2：上右 参数3：下左 参数4：下右 参数5 ：圆角大小
- (UIView *(^)(BOOL,BOOL,BOOL,BOOL,CGFloat))JH_cornerRadius_tlbr;
///设置四周阴影 参数1 ：CGFloat
- (UIView *(^)(CGFloat))JH_shadowRadius;
/**给设置阴影
 参数1：UIColor shadowColor 阴影颜色
 参数2：CGFloat shadowOpacity 阴影透明度 默认0
 参数3：CGFloat shadowRadius 阴影半径 也就是阴影放射程度 默认3
 参数5：CGFloat shadowPathWidth 阴影放射g宽度
 参数6：BOOL
 参数7：BOOL
 参数8：BOOL
 参数9：BOOL
*/
- (UIView *(^)(UIColor *,CGFloat,CGFloat ,CGFloat,BOOL,BOOL,BOOL,BOOL))JH_shadowRadius_tlbr;


@end

NS_ASSUME_NONNULL_END
