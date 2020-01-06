//
//  UIImage+JHCreate.h
//  JHCreateViewTool
//
//  Created by 李江湖 on 2020/1/6.
//  Copyright © 2020 李江湖. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface UIImage (JHCreate)

/// 获取View图片 参数1：截取的view
- (UIImage *(^)(UIView *))JH_captureScreenForView;

/// 生成二维码 参数1：二维码文字 参数2：二维码image大小
- (UIImage *(^)(NSString *,CGSize))JH_imageWithQRCode;
- (UIImage *(^)(UIImage *bgImage,UIImage *logoImage,CGSize size))JH_imagewithAddImage;
@end
