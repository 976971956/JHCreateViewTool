//
//  UIView+JHCreate.m
//  JHCreateViewTool
//
//  Created by 江湖 on 2019/12/16.
//  Copyright © 2019 李江湖. All rights reserved.
//

#import "UIView+JHCreate.h"


@implementation UIView (JHCreate)

#pragma mark --基本属性
- (UIView * _Nonnull (^)(CGRect))JH_frame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIView * _Nonnull (^)(UIColor * _Nonnull))JH_backgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UIView * _Nonnull (^)(CGPoint))JH_center{
    return ^(CGPoint point){
        self.center = point;
        return self;
    };
}

- (UIView * _Nonnull (^)(CGFloat))JH_alpha{
    return ^(CGFloat alpha){
        self.alpha = alpha;
        return self;
    };
}

- (UIView * _Nonnull (^)(BOOL))JH_hidden{
    return ^(BOOL ret){
        self.hidden = ret;
        return self;
    };
}

- (UIView * _Nonnull (^)(BOOL))JH_userInteractionEnabled{
    return ^(BOOL ret){
        self.userInteractionEnabled = ret;
        return self;
    };
}
-(UIView * _Nonnull (^)(CGFloat))JH_cornerRadius{
    return ^(CGFloat redius){
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(redius, redius)];
        CAShapeLayer *layer = [[CAShapeLayer alloc] init];
        layer.frame = self.bounds;
        layer.path = path.CGPath;
        self.layer.mask = layer;
        return self;
    };
}

-(UIView * _Nonnull (^)(BOOL, BOOL, BOOL, BOOL, CGFloat))JH_cornerRadius_tlbr{
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

- (UIView * _Nonnull (^)(CGFloat))JH_shadowRadius{
    return ^(CGFloat radius){
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        //剪切边界 如果视图上的子视图layer超出视图layer部分就截取掉 如果添加阴影这个属性必须是NO 不然会把阴影切掉
        self.layer.masksToBounds = NO;
        //阴影半径，默认3
        self.layer.shadowRadius = 3;
        //shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
        self.layer.shadowOffset = CGSizeMake(0.0f,0.0f);
        // 阴影透明度，默认0
        self.layer.shadowOpacity = 0.9f;
        return self;
    };
}

- (UIView * _Nonnull (^)(UIColor * _Nonnull, CGFloat, CGFloat, CGFloat, BOOL, BOOL, BOOL, BOOL))JH_shadowRadius_tlbr{
    return ^(UIColor *shadowColor,CGFloat shadowOpacity,CGFloat shadowRadius,CGFloat shadowPathWidth,BOOL top,BOOL left,BOOL bottom,BOOL right){
        self.layer.masksToBounds = NO;//必须要等于NO否则会把阴影切割隐藏掉
        self.layer.shadowColor = shadowColor.CGColor;// 阴影颜色
        self.layer.shadowOpacity = shadowOpacity;// 阴影透明度，默认0
        self.layer.shadowOffset = CGSizeZero;//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
        self.layer.shadowRadius = shadowRadius;//阴影半径，默认3
        CGRect shadowRect = CGRectZero;
        CGFloat originX,originY,sizeWith,sizeHeight;
        originX = 0;
        originY = 0;
        sizeWith = self.bounds.size.width;
        sizeHeight = self.bounds.size.height;
//        一个阴影
        if (top && !left && !bottom && !right) {
            shadowRect = CGRectMake(originX, originY-shadowPathWidth/2, sizeWith, shadowPathWidth);
        }else if (!top && !left && bottom && !right){
            shadowRect = CGRectMake(originY, sizeHeight-shadowPathWidth/2, sizeWith, shadowPathWidth);
        }else if (!top && left && !bottom && !right){
            shadowRect = CGRectMake(originX-shadowPathWidth/2, originY, shadowPathWidth, sizeHeight);
        }else if (!top && !left && !bottom && right){
            shadowRect = CGRectMake(sizeWith-shadowPathWidth/2, originY, shadowPathWidth, sizeHeight);
        }
//       两个阴影
        if (top && left && !bottom && !right) {
            shadowRect = CGRectMake(originX-shadowPathWidth/2, originY-shadowPathWidth/2, sizeWith, sizeHeight);
        }else if (top && !left && !bottom && right){
            shadowRect = CGRectMake(originX+shadowPathWidth/2, originY-shadowPathWidth/2, sizeWith+shadowPathWidth/4, sizeHeight);

        }else if (!top && left && bottom && !right){
            shadowRect = CGRectMake(originX-shadowPathWidth/2, originY+shadowPathWidth/2, sizeWith+shadowPathWidth/4, sizeHeight);

        }else if (!top && !left && bottom && right){
            shadowRect = CGRectMake(originX+shadowPathWidth/2, originY+shadowPathWidth/2, sizeWith+shadowPathWidth/4, sizeHeight);

        }else if (top && !left && bottom && !right){
            shadowRect = CGRectMake(originX, originY-shadowPathWidth/2, sizeWith, sizeHeight+shadowPathWidth);

        }else if (!top && left && !bottom && right){
            shadowRect = CGRectMake(originX-shadowPathWidth/2, originY, sizeWith+shadowPathWidth, sizeHeight);

        }
//        三个阴影
        if (!top && left && bottom && right) {
            shadowRect = CGRectMake(originX-shadowPathWidth/2, originY, sizeWith+shadowPathWidth, sizeHeight+shadowPathWidth/2);
        }else if (top && !left && bottom && right){
            shadowRect = CGRectMake(originX, originY-shadowPathWidth/2, sizeWith+shadowPathWidth/2, sizeHeight+shadowPathWidth);

        }else if (top && left && !bottom && right){
            shadowRect = CGRectMake(originX-shadowPathWidth/2, originY-shadowPathWidth/2, sizeWith+shadowPathWidth, sizeHeight+shadowPathWidth/2);

        }else if (top && left && bottom && !right){
            shadowRect = CGRectMake(originX-shadowPathWidth/2, originY-shadowPathWidth/2, sizeWith+shadowPathWidth/2, sizeHeight+shadowPathWidth/2);
        }
//        四个阴影
        if (top && left && bottom && right){
            shadowRect = CGRectMake(originX-shadowPathWidth/2,originY-shadowPathWidth/2, sizeWith+shadowPathWidth, sizeHeight+shadowPathWidth);
        }
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:shadowRect];
        self.layer.shadowPath = bezierPath.CGPath;//阴影路径
        return self;
    };
}
-(UIView *(^)(CGFloat))JH_cornerRadius_sytle{
    return ^(CGFloat radius){
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}
@end
