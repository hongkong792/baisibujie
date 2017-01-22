

//
//  XMGEssenceViewController.m
//  百思不解
//
//  Created by 杨香港 on 2017/1/22.
//  Copyright © 2017年 杨香港. All rights reserved.
//

#import "XMGEssenceViewController.h"
#define XMGGlobalBg XMGRGBColor(223, 223, 223)
#define XMGRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@interface XMGEssenceViewController ()

@end

@implementation XMGEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//设置导航栏
    [self setUpNav];
    
    
}

/**
 *设置导航栏
 */
- (void)setUpNav
{
    // 设置导航栏标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:nil];
    
    // 设置背景色
    self.view.backgroundColor = XMGGlobalBg;
    
    
}



@end
