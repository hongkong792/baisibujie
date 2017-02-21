//
//  XMGTopicPictureView.h
//  百思不解
//
//  Created by yangxianggang on 17/2/21.
//  Copyright © 2017年 杨香港. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMGTopic.h"

@interface XMGTopicPictureView : UIView
+ (instancetype)pictureView;
/** 帖子数据 */
@property (nonatomic, strong) XMGTopic *topic;
@end
