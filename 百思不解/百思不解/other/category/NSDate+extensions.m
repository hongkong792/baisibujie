//
//  NSDate+extensions.m
//  百思不解
//
//  Created by yangxianggang on 17/2/8.
//  Copyright © 2017年 杨香港. All rights reserved.
//

#import "NSDate+extensions.h"

@implementation NSDate (extensions)
- (BOOL)isThisYear
{
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    return nowYear == selfYear;
}
- (BOOL)isToday
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSString *selfString = [fmt stringFromDate:self];
    return [nowString isEqualToString:selfString];
}

- (BOOL)isYesterday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    if (nowYear != selfYear) {
        return NO;
    }
    NSInteger nowMonth = [calendar component:NSCalendarUnitMonth fromDate:[NSDate date]];
    NSInteger selfMonth = [calendar component:NSCalendarUnitMonth fromDate:self];
    if (nowMonth != selfMonth) {
        return NO;
    }
    NSInteger nowToday = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfToday = [calendar component:NSCalendarUnitYear fromDate:self];
    if (nowToday == selfToday) {
        return YES;
    }
    return NO;
}

- (NSDateComponents *)deltaFrom:(NSDate *)from
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //比较时间
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth
    | NSCalendarUnitYear | NSCalendarUnitHour
    | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return  [calendar components:unit fromDate:from toDate:self options:0];
    
}
@end
