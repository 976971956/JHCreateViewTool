//
//  UILabel+JHCreate.m
//  JHCreateViewTool
//
//  Created by 江湖 on 2019/12/13.
//  Copyright © 2019 李江湖. All rights reserved.
//

#import "UILabel+JHCreate.h"

@implementation UILabel (JHCreate)


- (UILabel *(^)(UIFont *))JH_font{
    return ^(UIFont* font){
        if (font) {
            self.font = font;
        }
        return self;
    };
}

- (UILabel * _Nonnull (^)(CGFloat))JH_systemFont{
    return ^(CGFloat size){
        if (size) {
            self.font = [UIFont systemFontOfSize:size];
        }
        return self;
    };
}

- (UILabel *(^)(CGFloat))JH_boldSystemFontOfSize{
    return ^(CGFloat size){
        if (size) {
            self.font = [UIFont boldSystemFontOfSize:size];
        }
        return self;
    };
}
- (UILabel *_Nonnull(^)(NSString *))JH_text{
    return ^(NSString *text){
        if (text) {
            self.text = text;
        }
        return self;
    };
}

-(UILabel * _Nonnull (^)(UIColor * _Nonnull))JH_textColor{
    return ^(UIColor *color){
        if (color) {
            self.textColor  = color;
//            self.textAlignment
        }
        return self;
    };
}

- (UILabel *(^)(NSMutableAttributedString *))JH_attributedText{
    return ^(NSMutableAttributedString *att){
        self.attributedText = att;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment))JH_textAlignment{
    return ^(NSTextAlignment type){
        self.textAlignment = type;
        return self;
    };
}

- (UILabel *(^)(UIColor *))JH_shadowColor{
    return ^(UIColor *color){
        self.shadowColor = color;
        return self;
    };
}

-(UILabel *(^)(CGSize))JH_shadowOffset{
    return ^(CGSize size){
        self.shadowOffset = size;
        return self;
    };
}

-(UILabel *(^)(NSLineBreakMode))JH_lineBreakMode{
    return ^(NSLineBreakMode type){
        self.lineBreakMode = type;
        return self;
    };
}

-(UILabel *(^)(UIColor*))JH_highlightedTextColor{
    return ^(UIColor*color){
        self.highlightedTextColor = color;
        return self;
    };
}
-(UILabel *(^)(BOOL))JH_highlighted{
    return ^(BOOL ret){
        self.highlighted = ret;
        return self;
    };
}

-(UILabel *(^)(BOOL))JH_enabled{
    return ^(BOOL ret){
        self.enabled = ret;
        return self;
    };
}
-(UILabel *(^)(NSInteger))JH_numberOfLines{
    return ^(NSInteger num){
        self.numberOfLines = num;
        return self;
    };
}
-(UILabel *(^)(BOOL))JH_adjustsFontSizeToFitWidth{
    return ^(BOOL ret){
        self.adjustsFontSizeToFitWidth = ret;
        return self;
    };
}

-(UILabel *(^)(UIBaselineAdjustment))JH_baselineAdjustment{
    return ^(UIBaselineAdjustment ment){
        self.baselineAdjustment = ment;
        return self;
    };
}
-(UILabel *(^)(CGFloat))JH_minimumScaleFactor{
    return ^(CGFloat size){
        self.minimumScaleFactor = size;
        return self;
    };
}
-(UILabel *(^)(BOOL))JH_allowsDefaultTighteningForTruncation{
    return ^(BOOL ret){
        self.allowsDefaultTighteningForTruncation = ret;
        return self;
    };
}

#pragma mark --基本属性
- (UILabel * _Nonnull (^)(CGRect))JH_frame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UILabel * _Nonnull (^)(UIColor * _Nonnull))JH_backgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UILabel * _Nonnull (^)(CGPoint))JH_center{
    return ^(CGPoint point){
        self.center = point;
        return self;
    };
}

- (UILabel * _Nonnull (^)(CGFloat))JH_alpha{
    return ^(CGFloat alpha){
        self.alpha = alpha;
        return self;
    };
}

- (UILabel * _Nonnull (^)(BOOL))JH_hidden{
    return ^(BOOL ret){
        self.hidden = ret;
        return self;
    };
}

- (UILabel * _Nonnull (^)(BOOL))JH_userInteractionEnabled{
    return ^(BOOL ret){
        self.userInteractionEnabled = ret;
        return self;
    };
}
- (UILabel * _Nonnull (^)(CGFloat))JH_cornerRadius{
    return ^(CGFloat redius){
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(redius, redius)];
        CAShapeLayer *layer = [[CAShapeLayer alloc] init];
        layer.frame = self.bounds;
        layer.path = path.CGPath;
        self.layer.mask = layer;
        return self;
    };
}

- (UILabel * _Nonnull (^)(BOOL, BOOL, BOOL, BOOL, CGFloat))JH_cornerRadius_tlbr{
    return ^(BOOL topLeftCorner,BOOL topRightCorner,BOOL bottomLeftCorner,BOOL bottomRightCorner,CGFloat redius){
         UIRectCorner corners = UIRectCornerAllCorners;
            
        // 一个圆角
        if (topLeftCorner && !topRightCorner && !bottomLeftCorner && !bottomRightCorner) {
            // topLeftCorner
            corners = UIRectCornerTopLeft;
        }
        if (!topLeftCorner && topRightCorner && !bottomLeftCorner && !bottomRightCorner) {
            // topRightCorner
            corners = UIRectCornerTopRight;
        }
        if (!topLeftCorner && !topRightCorner && bottomLeftCorner && !bottomRightCorner) {
            // bottomLeftCorner
            corners = UIRectCornerBottomLeft;
        }
        if (!topLeftCorner && !topRightCorner && !bottomLeftCorner && bottomRightCorner) {
            // bottomRightCorner
            corners = UIRectCornerBottomRight;
        }
        
        //  两个圆角
        //1
        if (topLeftCorner && topRightCorner && !bottomLeftCorner && !bottomRightCorner) {
            // topLeftCorner  topRightCorner
            corners = UIRectCornerTopLeft | UIRectCornerTopRight;
        }
        if (topLeftCorner && !topRightCorner && bottomLeftCorner && !bottomRightCorner) {
            // topLeftCorner  bottomLeftCorner
            corners = UIRectCornerTopLeft | UIRectCornerBottomLeft;
        }
        if (topLeftCorner && !topRightCorner && !bottomLeftCorner && bottomRightCorner) {
            // topLeftCorner  bottomRightCorner
            corners = UIRectCornerTopLeft | UIRectCornerBottomRight;
        }
        
        //2
        if (!topLeftCorner && topRightCorner && bottomLeftCorner && !bottomRightCorner) {
            // topRightCorner  bottomLeftCorner
            corners = UIRectCornerTopRight | UIRectCornerBottomLeft;
        }
        
        if (!topLeftCorner && topRightCorner && !bottomLeftCorner && bottomRightCorner) {
            // topRightCorner  bottomRightCorner
            corners = UIRectCornerTopRight | UIRectCornerBottomRight;
        }
        
        //3
        if (!topLeftCorner && !topRightCorner && bottomLeftCorner && bottomRightCorner) {
            // bottomLeftCorner  bottomRightCorner
            corners = UIRectCornerBottomLeft | UIRectCornerBottomRight;
        }
        
        // 三个圆角
        //1
        if (!topLeftCorner && topRightCorner && bottomLeftCorner && bottomRightCorner) {
            //  topRightCorner bottomLeftCorner bottomRightCorner
            corners = UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight;
        }
        //2
        if (topLeftCorner && !topRightCorner && bottomLeftCorner && bottomRightCorner) {
            // topLeftCorner  bottomLeftCorner bottomRightCorner
            corners = UIRectCornerTopLeft | UIRectCornerBottomLeft | UIRectCornerBottomRight;
        }
        //3
        if (topLeftCorner && topRightCorner && !bottomLeftCorner && bottomRightCorner) {
            // topLeftCorner topRightCorner bottomRightCorner
            corners = UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomRight;
        }
        //4
        if (topLeftCorner && topRightCorner && bottomLeftCorner && !bottomRightCorner) {
            // topLeftCorner topRightCorner bottomLeftCorner
            corners = UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft;
        }
        
        // 四个圆角
        if (topLeftCorner && topRightCorner && bottomLeftCorner && bottomRightCorner) {
            // topLeftCorner topRightCorner bottomLeftCorner bottomRightCorner
            corners = UIRectCornerAllCorners;
        }
        
        // 没有圆角
        if (!topLeftCorner && !topRightCorner && !bottomLeftCorner && !bottomRightCorner) {
            return self;
        }
     
        NSMutableArray<CALayer *> *subLayers = [NSMutableArray arrayWithArray: self.layer.sublayers];
    //    NSArray<CALayer *> *subLayers =  self.layer.sublayers;
    //    NSLog(@"%@",subLayers);

        [subLayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"%@",obj);

                if([obj isKindOfClass:[CAShapeLayer class]]){
                    [obj removeFromSuperlayer];
                }
      
          }];

     
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                       byRoundingCorners:corners
                                                             cornerRadii:CGSizeMake(redius, redius)];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame         = self.bounds;
        maskLayer.path          = maskPath.CGPath;
//        maskLayer.fillColor = fillColor.CGColor;
//        maskLayer.strokeColor = lineColor.CGColor;
//        maskLayer.lineWidth = 1;
        self.layer.mask         = maskLayer;
        return self;
    };
    
}
-(UILabel *(^)(CGFloat))JH_cornerRadius_sytle{
    return ^(CGFloat radius){
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}
@end
