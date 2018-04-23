//
//  UIImage+WQTool.m
//  WQToolKitDemo
//
//  Created by shmily on 2017/10/12.
//  Copyright © 2017年 shmily. All rights reserved.
//

#import "UIImage+WQTool.h"
#import "UIView+WQFrame.h"

@implementation UIImage (WQTool)

- (NSString *)imageTobase64String
{
    NSData *imageData = UIImageJPEGRepresentation(self, 0.3f);
    return [NSString stringWithFormat:@"%@",[imageData base64EncodedStringWithOptions: 0]];
}


+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
//保持原来的长宽比，生成一个缩略图
- (UIImage *)thumbnailWithImageWithNewSize:(CGSize)size
{
    UIImage *newimage;
    if (nil == self) {
        newimage = nil;
    }
    else{
        CGSize oldsize = self.size;
        CGRect rect;
        if (size.width/size.height > oldsize.width/oldsize.height) {
            rect.size.width = size.height*oldsize.width/oldsize.height;
            rect.size.height = size.height;
            rect.origin.x = (size.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else{
            rect.size.width = size.width;
            rect.size.height = size.width*oldsize.height/oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (size.height - rect.size.height)/2;
        }
        UIGraphicsBeginImageContext(size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, size.width, size.height));//clear background
        [self drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}
- (UIImage *)compressedImageWithQualityRatio:(CGFloat)qualityRatio
{
    // 压缩质量
    NSData *imgData = UIImageJPEGRepresentation(self, qualityRatio);
    UIImage *newImg = [UIImage imageWithData:imgData];
    
    // 压缩大小
    CGFloat compressFraction = 1.f;
    CGSize imageSize = newImg.size;
    CGFloat newWidth;
    CGFloat newHeight;
    CGFloat scaleWidth = 1.f;
    CGFloat scaleHeight = 1.f;
    if (imageSize.height > kWQScreenHeight) {
        scaleHeight = compressFraction*kWQScreenHeight/imageSize.height;
    }
    if (imageSize.width*compressFraction > kWQScreenWidth) {
        scaleWidth = compressFraction*kWQScreenWidth/imageSize.width;
    }
    compressFraction = scaleWidth > scaleHeight ? scaleWidth : scaleHeight;
    newHeight = (imageSize.height)*compressFraction;
    newWidth = (imageSize.width)*compressFraction;
    CGSize newSize = CGSizeMake(ceil(newWidth), ceil(newHeight));
    // 创建图片上下文
    UIGraphicsBeginImageContext(newSize);
    // 根据新大小重新绘制图片
    [newImg drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    //
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // End the context
    UIGraphicsEndImageContext();
    return newImage;
}

@end
