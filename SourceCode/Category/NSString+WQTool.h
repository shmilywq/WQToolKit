//
//  NSString+WQTool.h
//  xiaomayizhan
//
//  Created by shmily on 2017/10/18.
//  Copyright © 2017年 LOUGUAN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (WQTool)

/**
 返回字符串的宽高
 
 @param font 字符的字体
 @param constraintSize label的size, 计算宽度时,constraintSize.width = MAXFLOAT, 计算高度时,constraintSize.height = MAXFLOAT;
 @return 字符串的宽高
 */
- (CGSize)sizeWithTextFont:(UIFont *)font constraintSize:(CGSize)constraintSize;

/**
 * 计算文字高度，可以处理计算带行间距的
 */
- (CGSize)sizeWithTextFont:(UIFont *)font constraintSize:(CGSize)size lineSpacing:(CGFloat)lineSpacing;

/**
 判断字符串是否为空, 若为空返回@""

 @param string 目标字符串
 @return 返回的字符串
 */
+ (NSString *)noNullWithStr:(NSString *)string;

/**
 MD5转换

 @return 转换后的结果
 */
- (NSString *)md5HexDigest;

/**
 JSONString转换成字典
 
 @param JSONString JOSN字符串
 @return 字典
 */
+ (NSDictionary *)JSONStringTransformToDictionary:(NSString *)JSONString;

@end
