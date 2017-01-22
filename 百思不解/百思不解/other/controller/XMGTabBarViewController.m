

//
//  XMGTabBarViewController.m
//  百思不解
//
//  Created by 杨香港 on 2017/1/22.
//  Copyright © 2017年 杨香港. All rights reserved.
//

#import "XMGTabBarViewController.h"
#import "XMGEssenceViewController.h"
#import "XMGNavViewController.h"

@interface XMGTabBarViewController ()

@end

@implementation XMGTabBarViewController
+ (void)initialize
{
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    NSMutableDictionary *itemDicNormal = [NSMutableDictionary dictionary];
    itemDicNormal[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    itemDicNormal[NSForegroundColorAttributeName] = [UIColor greenColor];
    

    NSMutableDictionary *itemDicHigh = [NSMutableDictionary dictionary];
    itemDicHigh[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    itemDicHigh[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    [tabBarItem setTitleTextAttributes:itemDicNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:itemDicHigh forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    XMGEssenceViewController *essenceCon = [[XMGEssenceViewController alloc] init];
    [self setChildVc:essenceCon title:@"精华" normalImage:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    //更换tabBar

    
}
/**
 *初始化子控制器
 */

- (void)setChildVc:(UIViewController *)vc title:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage
{
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:normalImage];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    //包装一个导航控制器，添加导航控制器为tabBarViewController的子控制器
    XMGNavViewController * nac = [[XMGNavViewController alloc] initWithRootViewController:vc];
    [self addChildViewController:nac];
}





@end
