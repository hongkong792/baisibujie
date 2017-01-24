
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
#import <AFNetworking.h>
@interface XMGTopicViewController ()

/**帖子数据*/
@property (nonatomic,strong)NSMutableArray *topics;
/**当前页码*/
@property (nonatomic,assign)NSInteger page;
/**上一次请求的参数*/
@property (nonatomic,strong)NSDictionary *params;
/** 当加载下一页数据时需要这个参数 */
@property (nonatomic, copy) NSString *maxtime;
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
 *添加刷新控件
 */
- (void)setupRefresh
{
    self.tableView.header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    self.tableView.header.autoChangeAlpha = YES;
    [self.tableView.header beginRefreshing];
    self.tableView.footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
    
    
}

#pragma mark - 数据处理
/**
 * 加载新的帖子数据
 */
- (void)loadNewTopics
{
    // 结束上啦
    [self.tableView.footer endRefreshing];
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @(self.type);
    self.params = params;
    
    // 发送请求
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        if (self.params != params) return;
        
        // 存储maxtime
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 字典 -> 模型
        self.topics = [XMGTopic objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 刷新表格
        [self.tableView reloadData];
        
        // 结束刷新
        [self.tableView.header endRefreshing];
        
        // 清空页码
        self.page = 0;
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (self.params != params) return;
        
        // 结束刷新
        [self.tableView.header endRefreshing];
    }];
}

// 先下拉刷新, 再上拉刷新第5页数据

// 下拉刷新成功回来: 只有一页数据, page == 0
// 上啦刷新成功回来: 最前面那页 + 第5页数据

/**
 * 加载更多的帖子数据
 */
- (void)loadMoreTopics
{
    // 结束下拉
    [self.tableView.header endRefreshing];
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @(self.type);
    NSInteger page = self.page + 1;
    params[@"page"] = @(page);
    params[@"maxtime"] = self.maxtime;
    self.params = params;
    
    // 发送请求
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        if (self.params != params) return;
        
        // 存储maxtime
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 字典 -> 模型
        NSArray *newTopics = [XMGTopic objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.topics addObjectsFromArray:newTopics];
        
        // 刷新表格
        [self.tableView reloadData];
        
        // 结束刷新
        [self.tableView.footer endRefreshing];
        
        // 设置页码
        self.page = page;
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (self.params != params) return;
        
        // 结束刷新
        [self.tableView.footer endRefreshing];
    }];
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
