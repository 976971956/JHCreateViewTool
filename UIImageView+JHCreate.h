//
//  UIImageView+JHCreate.h
//  JHCreateViewTool
//
//  Created by 李江湖 on 2019/12/18.
//  Copyright © 2019 李江湖. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (JHCreate)

///设置图片 参数1：UIImage
- (UIImageView *(^)(UIImage*))JH_image;
///设置图片 参数1：NSString
- (UIImageView *(^)(NSString*))JH_image_str;

#pragma mark --基本属性
///CGRect
- (UIImageView *(^)(CGRect frame))JH_frame;
/// UIColor
- (UIImageView *(^)(UIColor *))JH_backgroundColor;
///设置中心位置 参数1：CGPoint
- (UIImageView *(^)(CGPoint))JH_center;
///设置透明度 参数1 ：CGFloat
- (UIImageView *(^)(CGFloat))JH_alpha;
///设置隐藏 参数1：BOOL
- (UIImageView *(^)(BOOL))JH_hidden;
//设置交互开关 参数1：BOOL
- (UIImageView *(^)(BOOL))JH_userInteractionEnabled;
///设置四周圆角 参数1 ：CGFloat
- (UIImageView *(^)(CGFloat))JH_cornerRadius;
///设置多个圆角 参数1：上左 参数2：上右 参数3：下左 参数4：下右 参数5 ：圆角大小
- (UIImageView *(^)(BOOL,BOOL,BOOL,BOOL,CGFloat))JH_cornerRadius_tlbr;
///设置默认倒圆角 参数1：CGFoat
- (UIImageView *(^)(CGFloat))JH_cornerRadius_sytle;
@end

NS_ASSUME_NONNULL_END
