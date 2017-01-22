

//
//  XMGEssenceViewController.m
//  百思不解
//
//  Created by 杨香港 on 2017/1/22.
//  Copyright © 2017年 杨香港. All rights reserved.
//

#import "XMGEssenceViewController.h"
#import "UIBarButtonItem+XMGExtensions.h"
#import "XMGTopicViewController.h"


@interface XMGEssenceViewController ()

@end

@implementation XMGEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //设置导航栏
    [self setUpNav];
    //初始化子控制器
    [self initChildControllers];
    
    //设置顶部标题拦
    
    
    //底部的scrooView
    
    
    
}
/**
 *初始化子控制器
 */
 - (void)initChildControllers
{
    //图片
    
    
    
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
