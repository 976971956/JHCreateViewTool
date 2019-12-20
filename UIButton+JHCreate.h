//
//  UIButton+JHCreate.h
//  OCOperation
//
//  Created by 李江湖 on 2019/12/13.
//  Copyright © 2019 李江湖. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIButton (JHCreate)
/// CGFloat
- (UIButton *(^)(CGFloat))JH_font;

/// NSString
- (UIButton *(^)(NSString *))JH_text;

/// NSString
- (UIButton *(^)(NSString *))JH_nomer_Text;

/// NSString
- (UIButton *(^)(NSString *))JH_select_Text;

/// UIColor
- (UIButton *(^)(UIColor *))JH_nomer_TextColor;

/// UIColor
- (UIButton *(^)(UIColor *))JH_selectTextColor;

/// NSString
- (UIButton *(^)(NSString *))JH_image_String;

/// NSString
- (UIButton *(^)(NSString *))JH_nomer_Image_String;

/// NSString
- (UIButton *(^)(NSString *))JH_selectImage_String;


#pragma mark --基本属性
///CGRect
- (UIButton *(^)(CGRect frame))JH_frame;
/// UIColor
- (UIButton *(^)(UIColor *))JH_backgroundColor;
///设置中心位置 参数1：CGPoint
- (UIButton *(^)(CGPoint))JH_center;
///设置透明度 参数1 ：CGFloat
- (UIButton *(^)(CGFloat))JH_alpha;
///设置隐藏 参数1：BOOL
- (UIButton *(^)(BOOL))JH_hidden;
//设置交互开关 参数1：BOOL
- (UIButton *(^)(BOOL))JH_userInteractionEnabled;
///设置四周圆角 参数1 ：CGFloat
- (UIButton *(^)(CGFloat))JH_cornerRadius;
///设置多个圆角 参数1：上左 参数2：上右 参数3：下左 参数4：下右 参数5 ：圆角大小
- (UIButton *(^)(BOOL,BOOL,BOOL,BOOL,CGFloat))JH_cornerRadius_tlbr;
@end

