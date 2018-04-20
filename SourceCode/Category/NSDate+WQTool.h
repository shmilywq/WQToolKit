//
//  NSDate+WQTool.h
//  xiaomayizhan
//
//  Created by shmily on 2017/10/17.
//  Copyright © 2017年 LOUGUAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (WQTool)

/**
 获取指定格式的当前字符串
 
 @param format 日期格式
 
 @return 当前字符串
 */
+ (NSString *)getCurrentDateStringWithFormat:(NSString *)format;

/**
 *  将日期转换成对于的格式的字符串
 *
 *  @param format 日期格式
 *
 *  @return 日期字符串
 */
- (NSString *)getDateStringWithFormat:(NSString *)format;

/**
 将日期字符串转换成固定格式的日期
 
 @param dateStr 日期字符串
 @param format  日期格式
 
 @return 日期
 */
+ (NSDate *)dateWithDateString:(NSString *)dateStr format:(NSString *)format;



@end
