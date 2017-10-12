//
//  UIImage+WQTool.m
//  WQToolKitDemo
//
//  Created by shmily on 2017/10/12.
//  Copyright © 2017年 shmily. All rights reserved.
//

#import "UIImage+WQTool.h"

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

@end
