
//
//  UIView+extension.m
//  百思不解
//
//  Created by yangxianggang on 17/1/22.
//  Copyright © 2017年 杨香港. All rights reserved.
//

#import "UIView+extension.h"

@implementation UIView (extension)

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
    
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (CGFloat)x
{
    return  self.frame.origin.x;
    
}


- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
    
}
- (CGFloat)y
{
    return self.frame.origin.y;
    
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
    
}
- (CGFloat)width
{
    return self.frame.size.width;
    
}


- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGSize)size
{
    return self.frame.size;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
    
}

- (CGFloat)height
{
    return self.frame.size.height;
    
}
@end
