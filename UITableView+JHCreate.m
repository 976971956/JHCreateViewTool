//
//  UITableView+JHCreate.m
//  JHCreateViewTool
//
//  Created by 李江湖 on 2019/12/18.
//  Copyright © 2019 李江湖. All rights reserved.
//

#import "UITableView+JHCreate.h"



@implementation UITableView (JHCreate)

- (UITableView *(^)(id))JH_delegate{
    return ^(id vc){
        self.delegate = vc;
        self.dataSource = vc;
        return self;
    };
}
- (UITableView *(^)(UITableViewCellSeparatorStyle))JH_separatorStyle{
    return ^(UITableViewCellSeparatorStyle style){
        self.separatorStyle = style;
        return self;
    };
}
- (UITableView *(^)(void))JH_automaticHeight{
    return ^(void){
        self.estimatedRowHeight = UITableViewAutomaticDimension;
        return self;
    };
}

- (UITableView *(^)(id))JH_defaullSetting{
    return ^(id uid){
        self.delegate = uid;
        self.dataSource = uid;
        self.backgroundColor = [UIColor clearColor];
        self.tableFooterView = [UIView new];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.estimatedRowHeight = UITableViewAutomaticDimension;

        return self;
    };
}
- (UITableView *(^)(id))JH_registClass{
    return ^(id class){
        NSString *str = NSStringFromClass(class);
        [self registerClass:class forCellReuseIdentifier:str];
        return self;
    };
}
#pragma mark --基本属性
- (UITableView * _Nonnull (^)(CGRect))JH_frame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UITableView * _Nonnull (^)(UIColor * _Nonnull))JH_backgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UITableView * _Nonnull (^)(CGPoint))JH_center{
    return ^(CGPoint point){
        self.center = point;
        return self;
    };
}

- (UITableView * _Nonnull (^)(CGFloat))JH_alpha{
    return ^(CGFloat alpha){
        self.alpha = alpha;
        return self;
    };
}

- (UITableView * _Nonnull (^)(BOOL))JH_hidden{
    return ^(BOOL ret){
        self.hidden = ret;
        return self;
    };
}

- (UITableView * _Nonnull (^)(BOOL))JH_userInteractionEnabled{
    return ^(BOOL ret){
        self.userInteractionEnabled = ret;
        return self;
    };
}
-(UITableView * _Nonnull (^)(CGFloat))JH_cornerRadius{
    return ^(CGFloat redius){
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(redius, redius)];
        CAShapeLayer *layer = [[CAShapeLayer alloc] init];
        layer.frame = self.bounds;
        layer.path = path.CGPath;
        self.layer.mask = layer;
        return self;
    };
}

-(UITableView * _Nonnull (^)(BOOL, BOOL, BOOL, BOOL, CGFloat))JH_cornerRadius_tlbr{
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
@end
