//
//  UIBarButtonItem+XMGExtensions.h
//  百思不解
//
//  Created by yangxianggang on 17/1/22.
//  Copyright © 2017年 杨香港. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XMGExtensions)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
