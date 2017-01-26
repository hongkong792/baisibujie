

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
#import "UIView+extension.h"


@interface XMGEssenceViewController ()<UIScrollViewDelegate>


/** 顶部的所有标签 */
@property (nonatomic, weak) UIView *titlesView;
/** 当前选中的按钮 */
@property (nonatomic, weak) UIButton *selectedButton;
/** 标签栏底部的红色指示器 */
@property (nonatomic, weak) UIView *indicatorView;
/** 底部的所有内容 */
@property (nonatomic, weak) UIScrollView *contentView;
@end

@implementation XMGEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //设置导航栏
    [self setUpNav];
    //初始化子控制器
    [self initChildControllers];
    
    //设置顶部标题拦
    [self setupTitlesView];
    
    //底部的scrooView
    [self setupContentView];
    
    
}

/**
 * 底部的scrollView
 */
- (void)setupContentView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView * contentView = [[UIScrollView alloc] init];
    contentView.frame = self.view.frame;
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    [self.view insertSubview:contentView atIndex:0];
    contentView.contentSize = CGSizeMake(contentView.width*self.childViewControllers.count, 0);
    self.contentView = contentView;
    [self scrollViewDidEndDecelerating:contentView];
    
}

#pragma UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndDecelerating:scrollView];
    // 点击按钮
    NSInteger index = scrollView.contentOffset.x/scrollView.width;
    [self titleClick:self.titlesView.subviews[index]];
    
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/scrollView.width;
    //取出子控制器
    UIViewController *vc = self.childViewControllers[index];
    vc.view.x  = scrollView.contentOffset.x;
    vc,scrollView.y = 0;
    vc.view.height = scrollView.height;// 设置控制器view的height值为整个屏幕的高度(默认是比屏幕高度少个20)
    [scrollView addSubview:vc.view];

    
}



/**
 *设置顶部的标题栏
 */
- (void)setupTitlesView
{
    //标签
    UIView * titleView = [[UIView alloc] init];
    titleView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    titleView.height = XMGTitleHeight;
    titleView.width = self.view.width;
    titleView.y = XMGStatusHeight;
    [self.view addSubview:titleView];
    self.titlesView = titleView;
    
    //标签底部红线
    UIView * indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.height = 2;
    indicatorView.tag = -1;
    indicatorView.y = titleView.height -indicatorView.height;
    self.indicatorView = indicatorView;
    
    //内部子标签
    CGFloat  width = self.titlesView.width / self.childViewControllers.count;
    CGFloat height = titleView.height;
    for (int i= 0; i< self.childViewControllers.count; i++) {
        
        UIButton * btn = [[UIButton alloc] init];
        btn.tag = i;
        btn.width =width;
        btn.height = height;
        btn.x = i*width;
        UIViewController * con = self.childViewControllers[i];
        [btn setTitle:con.title forState:UIControlStateNormal];
        [btn layoutIfNeeded];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
          //默认点击第一个按钮
        if (i == 0) {
            self.selectedButton = btn;
            btn.enabled = NO;
            [btn.titleLabel sizeToFit];
            self.indicatorView.width = btn.titleLabel.width;
            self.indicatorView.centerX = btn.centerX;
        
        }
        
    }
    [titleView addSubview:indicatorView];
}

- (void)titleClick:(UIButton *)button
{
    //修改按钮状态
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    
    //动画gudnong
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.width= button.titleLabel.width;
        self.indicatorView.centerX = button.centerX;
    }];
    //滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = button.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
    
    
}


/**
 *初始化子控制器
 */
 - (void)initChildControllers
{
    //图片
    XMGTopicViewController * picture = [[XMGTopicViewController alloc] init];
    picture.type = XMGTopicTypePicture;
    picture.title = @"图片";
    [self addChildViewController:picture];
    
    XMGTopicViewController *word = [[XMGTopicViewController alloc] init];
    word.title = @"段子";
    word.type = XMGTopicTypeWord;
    [self addChildViewController:word];
    
    XMGTopicViewController *all = [[XMGTopicViewController alloc] init];
    all.title = @"全部";
    all.type = XMGTopicTypeAll;
    [self addChildViewController:all];
    
    XMGTopicViewController *video = [[XMGTopicViewController alloc] init];
    video.title = @"视频";
    video.type = XMGTopicTypeVideo;
    [self addChildViewController:video];
    
    XMGTopicViewController *voice = [[XMGTopicViewController alloc] init];
    voice.title = @"声音";
    voice.type = XMGTopicTypeVoice;
    [self addChildViewController:voice];
    
    
    
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
