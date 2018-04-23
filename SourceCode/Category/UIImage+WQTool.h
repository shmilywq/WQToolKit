//
//  UIImage+WQTool.h
//  WQToolKitDemo
//
//  Created by shmily on 2017/10/12.
//  Copyright © 2017年 shmily. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WQTool)

/**
 图片转化base64字符串
 
 @return 图片字符串信息
 */
- (NSString *)imageTobase64String;


/**
 依据颜色转化成图片
 
 @param color   颜色信息
 @param size    图片size
 @return        转化图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 依据原图的宽高比生成缩略图
 
 @param size 缩略图大小
 @return     缩略图
 */
- (UIImage *)thumbnailWithImageWithNewSize:(CGSize)size;
@end
