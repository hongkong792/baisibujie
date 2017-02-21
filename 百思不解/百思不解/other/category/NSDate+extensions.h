//
//  NSDate+extensions.h
//  百思不解
//
//  Created by yangxianggang on 17/2/8.
//  Copyright © 2017年 杨香港. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (extensions)
/**
 * 是否为今年
 */
- (BOOL)isThisYear;
/**
 *是否为今天
 */
- (BOOL)isToday;
/**
 * 比较from和self的时间差值
 */
- (NSDateComponents *)deltaFrom:(NSDate *)from;

/**
 *是否为昨天
 */
- (BOOL)isYesterday;

@end
