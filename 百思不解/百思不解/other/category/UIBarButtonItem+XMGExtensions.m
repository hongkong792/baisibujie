

//
//  UIBarButtonItem+XMGExtensions.m
//  百思不解
//
//  Created by yangxianggang on 17/1/22.
//  Copyright © 2017年 杨香港. All rights reserved.
//

#import "UIBarButtonItem+XMGExtensions.h"
#import "UIView+extension.h"

@implementation UIBarButtonItem (XMGExtensions)


+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:button action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}


@end
