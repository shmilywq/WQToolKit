//
//  NSDate+WQTool.m
//  xiaomayizhan
//
//  Created by shmily on 2017/10/17.
//  Copyright © 2017年 LOUGUAN. All rights reserved.
//

#import "NSDate+WQTool.h"

@implementation NSDate (WQTool)

// 获取当前的日期
+ (NSString *)getCurrentDateStringWithFormat:(NSString *)format
{
    NSDate *date = [NSDate date];
    return [date getDateStringWithFormat:format];
}

// 日期对应的年月日字符串
- (NSString *)getDateStringWithFormat:(NSString *)format;
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *dateStr = [dateFormatter stringFromDate:self];
    return dateStr;
}

// 字符串转日期
+ (NSDate *)dateWithDateString:(NSString *)dateStr format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter dateFromString:dateStr];
}


@end
