
//
//  XMGTopicViewController.m
//  百思不解
//
//  Created by yangxianggang on 17/1/22.
//  Copyright © 2017年 杨香港. All rights reserved.
//

#import "XMGTopicViewController.h"
#import "UIView+extension.h"
#import "XMGTopicCell.h"
#import "XMGTopic.h"
#import <MJExtension.h>
#import <MJRefresh.h>
@interface XMGTopicViewController ()

/**帖子数据*/
@property (nonatomic,strong)NSMutableArray *topics;
/**当前页码*/
@property (nonatomic,assign)NSInteger page;
/**上一次请求的参数*/
@property (nonatomic,strong)NSDictionary *params;
@end

@implementation XMGTopicViewController
static NSString * const topicCell = @"topicCell";
- (NSMutableArray *)topics
{
    if (!_topics) {
        _topics = [NSMutableArray array];
    }
    return _topics;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//初始化表格
    [self setupTableView];
    //添加刷新控价
    [self setupRefresh];
    
}


/**
 *初始化表格
 */
- (void)setupTableView
{
    self.tableView.backgroundColor = [UIColor clearColor];
    CGFloat buttom = self.tabBarController.tabBar.height;
    self.tableView.contentInset = UIEdgeInsetsMake(XMGTitleHeight+XMGStatusHeight, 0, buttom, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //右侧的
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XMGTopicCell class]) bundle:nil] forCellReuseIdentifier:topicCell];
    
}

#pragma mark UITableViewDelegate, UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMGTopic * topic = self.topics[indexPath.row];
    return topic.height;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMGTopicCell * cell = [tableView dequeueReusableCellWithIdentifier:topicCell];
    cell.topic = self.topics[indexPath.row];
    return cell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.topics.count ==0) {
        self.tableView.footer.hidden = YES;
    }else{
         self.tableView.footer.hidden = NO;
    }
    return self.topics.count;
}




@end
