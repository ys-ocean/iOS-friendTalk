//
//  CommentTableView.h
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/17.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentTableCell.h"
#import "XHUser.h"
@interface CommentTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

//哪些人点过赞
@property (strong, nonatomic)NSAttributedString *likesAttributedText;
/**
 显示点赞人数的headerView高度 为0代表没有人点赞
 */
@property (assign, nonatomic)CGFloat likeHeaderHeight;

@property (strong, nonatomic)NSMutableArray *commentFrames;

@property (strong, nonatomic)UIView *headerView;

@property (strong, nonatomic)YYLabel *header;

@end
