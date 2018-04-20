//
//  UIColor+WQHexTool.h
//  xiaomayizhan
//
//  Created by WQ on 2018/4/20.
//  Copyright © 2018年 LOUGUAN. All rights reserved.
//

#import <UIKit/UIKit.h>

/*↓↓↓↓↓↓↓↓↓↓↓↓ <颜色> ↓↓↓↓↓↓↓↓↓↓↓↓*/
// 数值RGB颜色 RGB(234,223,145)
#define kWQRGB(r,g,b) RGBA(r,g,b,1.0f)
// 数值RGB颜色,带透明度 RGBA(234,223,145,0.6f)
#define kWQRGBAlpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
// 十六进制RGB颜色
#define kWQHexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// 十六进制RGB颜色,带透明度
#define kWQHexRGBAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
// 随机颜色
#define kWQRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]
/*↑↑↑↑↑↑↑↑↑↑↑↑ <颜色> ↑↑↑↑↑↑↑↑↑↑↑↑*/

@interface UIColor (WQHexTool)

/**
 十六进制颜色字符串转化成UIColor

 @param color 颜色字符串
 @return UIColor对象
 */
+ (UIColor *)colorwithHexString:(NSString *)color;


@end
