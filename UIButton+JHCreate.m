//
//  UIButton+JHCreate.m
//  OCOperation
//
//  Created by 李江湖 on 2019/12/13.
//  Copyright © 2019 李江湖. All rights reserved.
//

#import "UIButton+JHCreate.h"

@implementation UIButton (JHCreate)

- (UIButton * _Nonnull (^)(CGFloat))JH_font{
    return ^(CGFloat size){
        if (size) {
            self.titleLabel.font = [UIFont systemFontOfSize:size];
        }
        return self;
    };
}

- (UIButton *_Nonnull(^)(NSString *))JH_text{
    return ^(NSString *text){
        if (text) {
            [self setTitle:text forState:UIControlStateNormal];
        }
        return self;
    };
}
- (UIButton *_Nonnull(^)(NSString *))JH_nomer_Text;{
    return ^(NSString *text){
        if (text) {
            [self setTitle:text forState:UIControlStateNormal];
        }
        return self;
    };
}
- (UIButton *_Nonnull(^)(NSString *))JH_select_Text{
    return ^(NSString *text){
        if (text) {
            [self setTitle:text forState:UIControlStateSelected];
        }
        return self;
    };
}

- (UIButton *_Nonnull(^)(UIColor *))JH_nomer_TextColor{
    return ^(UIColor *color){
        if (color) {
            [self setTitleColor:color forState:UIControlStateNormal];
        }
        return self;
    };
}
- (UIButton *_Nonnull(^)(UIColor *))JH_selectTextColor{
    return ^(UIColor *color){
        if (color) {
            [self setTitleColor:color forState:UIControlStateSelected];
        }
        return self;
    };
}

- (UIButton *_Nonnull(^)(NSString *))JH_image_String{
    return ^(NSString *text){
        if (text) {
            [self setImage:[UIImage imageNamed:text] forState:UIControlStateNormal];
        }
        return self;
    };
}
- (UIButton *_Nonnull(^)(NSString *))JH_nomer_Image_String{
    return ^(NSString *text){
        if (text) {
            [self setImage:[UIImage imageNamed:text] forState:UIControlStateNormal];
        }
        return self;
    };
}
- (UIButton *_Nonnull(^)(NSString *))JH_selectImage_String{
    return ^(NSString *text){
        if (text) {
            [self setImage:[UIImage imageNamed:text] forState:UIControlStateSelected];
        }
        return self;
    };
}
-(UIButton *(^)(BOOL))JH_selected{
    return ^(BOOL select){
        self.selected = select;
        return self;
    };
}

- (UIButton *(^)(JHButtoniImageEdgeInsetsStyle, CGFloat))JH_layoutButtonWithEdgeInsetsStyle{
    return ^(JHButtoniImageEdgeInsetsStyle style,CGFloat space){
        /**
         *  知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
         *  如果只有title，那它上下左右都是相对于button的，image也是一样；
         *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
         */
        
        // 1. 得到imageView和titleLabel的宽、高
        CGFloat imageWith = self.imageView.frame.size.width;
        CGFloat imageHeight = self.imageView.frame.size.height;
        
        CGFloat labelWidth = 0.0;
        CGFloat labelHeight = 0.0;
        if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
            // 由于iOS8中titleLabel的size为0，用下面的这种设置
            labelWidth = self.titleLabel.intrinsicContentSize.width;
            labelHeight = self.titleLabel.intrinsicContentSize.height;
        } else {
            labelWidth = self.titleLabel.frame.size.width;
            labelHeight = self.titleLabel.frame.size.height;
        }
        
        // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
        UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
        UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
        
        // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        /**
         MKButtonEdgeInsetsStyleTop, // image在上，label在下
         MKButtonEdgeInsetsStyleLeft, // image在左，label在右
         MKButtonEdgeInsetsStyleBottom, // image在下，label在上
         MKButtonEdgeInsetsStyleRight // image在右，label在左
         */
        switch (style) {
            case MKButtonEdgeInsetsStyleTop:
            {
                imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
                labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
            }
                break;
            case MKButtonEdgeInsetsStyleLeft:
            {
                imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
                labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
            }
                break;
            case MKButtonEdgeInsetsStyleBottom:
            {
                imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
                labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
            }
                break;
            case MKButtonEdgeInsetsStyleRight:
            {
                imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
                labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
            }
                break;
            default:
                break;
        }
        
        // 4. 赋值
        self.titleEdgeInsets = labelEdgeInsets;
        self.imageEdgeInsets = imageEdgeInsets;

        return self;
    };
}
- (UIButton *(^)(UIColor *))JH_tintColor{
    return ^(UIColor *color){
        self.tintColor = color;
        return self;
    };
}
#pragma mark --基本属性
- (UIButton * _Nonnull (^)(CGRect))JH_frame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIColor * _Nonnull))JH_backgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UIButton * _Nonnull (^)(CGPoint))JH_center{
    return ^(CGPoint point){
        self.center = point;
        return self;
    };
}

- (UIButton * _Nonnull (^)(CGFloat))JH_alpha{
    return ^(CGFloat alpha){
        self.alpha = alpha;
        return self;
    };
}

- (UIButton * _Nonnull (^)(BOOL))JH_hidden{
    return ^(BOOL ret){
        self.hidden = ret;
        return self;
    };
}

- (UIButton * _Nonnull (^)(BOOL))JH_userInteractionEnabled{
    return ^(BOOL ret){
        self.userInteractionEnabled = ret;
        return self;
    };
}
- (UIButton * _Nonnull (^)(CGFloat))JH_cornerRadius{
    return ^(CGFloat redius){
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(redius, redius)];
        CAShapeLayer *layer = [[CAShapeLayer alloc] init];
        layer.frame = self.bounds;
        layer.path = path.CGPath;
        self.layer.mask = layer;
        return self;
    };
}

- (UIButton * _Nonnull (^)(BOOL, BOOL, BOOL, BOOL, CGFloat))JH_cornerRadius_tlbr{
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
-(UIButton *(^)(CGFloat))JH_cornerRadius_sytle{
    return ^(CGFloat radius){
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}
@end
