//
//  UILabel+JHCreate.h
//  JHCreateViewTool
//
//  Created by 江湖 on 2019/12/13.
//  Copyright © 2019 李江湖. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UILabel (JHCreate)

///设置默认文字大小 参数1：CGFloat
- (UILabel *(^)(CGFloat))JH_systemFont;

///设置加粗默认文字大小 参数1：CGFloat
- (UILabel *(^)(CGFloat))JH_boldSystemFontOfSize;

///设置文字字体 参数1：UIFont
- (UILabel *(^)(UIFont *))JH_font;

/// 设置文字 参数1：NSString
- (UILabel *(^)(NSString *))JH_text;

/// 设置文字颜色 参数1：UIColor
- (UILabel *(^)(UIColor *))JH_textColor;

/// 设置属性文字 参数1：NSMutableAttributedString
- (UILabel *(^)(NSMutableAttributedString *))JH_attributedText;

///设置文字排版方式 参数1：NSTextAlignment
- (UILabel *(^)(NSTextAlignment))JH_textAlignment;

///设置文字阴影颜色 参数1：UIColor
- (UILabel *(^)(UIColor *))JH_shadowColor;
///设置文字阴影位置
- (UILabel *(^)(CGSize))JH_shadowOffset;

/**
 设置文字省略模式 参数1：NSLineBreakMode
    NSLineBreakByWordWrapping = 0，//在单词边界处换行，默认
    NSLineBreakByCharWrapping，//在字符边界处换行
    NSLineBreakByClipping，//简单剪辑
    NSLineBreakByTruncatingHead，//在行首截断：“ ... wxyz”
    NSLineBreakByTruncatingTail，//在行尾截断：“ abcd ...”
    NSLineBreakByTruncatingMiddle //截断行中间：“ ab ... yz”
 */
- (UILabel *(^)(NSLineBreakMode))JH_lineBreakMode;
///设置文字高亮下文字颜色 参数1：UIColor
- (UILabel *(^)(UIColor*))JH_highlightedTextColor;
///设置文字高亮 参数1：BOOL
- (UILabel *(^)(BOOL))JH_highlighted;

///设置不可点击 参数1：BOOL
- (UILabel *(^)(BOOL))JH_enabled;
///设置文字换行 参数1：NSInteger换行数
- (UILabel *(^)(NSInteger))JH_numberOfLines;
///设置根据宽度来自动适应文字大小 参数1：BOOL
- (UILabel *(^)(BOOL))JH_adjustsFontSizeToFitWidth;
///设置文字基线 参数1 ：UIBaselineAdjustment  只有在UIlable 的  adjustsFontSizeToFitWidth = true 和 numberOfLines = 1 的时候才生效。
- (UILabel *(^)(UIBaselineAdjustment))JH_baselineAdjustment;
///设置文字缩放 0~1 最小级别 参数1:CGFloat 配合JH_adjustsFontSizeToFitWidth使用
- (UILabel *(^)(CGFloat))JH_minimumScaleFactor;
///设置多行label的最大宽度的
- (UILabel *(^)(BOOL))JH_allowsDefaultTighteningForTruncation;

#pragma mark --基本属性
///CGRect
- (UILabel *(^)(CGRect frame))JH_frame;
/// UIColor
- (UILabel *(^)(UIColor *))JH_backgroundColor;
///设置中心位置 参数1：CGPoint
- (UILabel *(^)(CGPoint))JH_center;
///设置透明度 参数1 ：CGFloat
- (UILabel *(^)(CGFloat))JH_alpha;
///设置隐藏 参数1：BOOL
- (UILabel *(^)(BOOL))JH_hidden;
//设置交互开关 参数1：BOOL
- (UILabel *(^)(BOOL))JH_userInteractionEnabled;
///设置四周圆角 参数1 ：CGFloat
- (UILabel *(^)(CGFloat))JH_cornerRadius;
///设置多个圆角 参数1：上左 参数2：上右 参数3：下左 参数4：下右 参数5 ：圆角大小
- (UILabel *(^)(BOOL,BOOL,BOOL,BOOL,CGFloat))JH_cornerRadius_tlbr;
@end

