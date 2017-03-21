//
//  TalkTableCell.h
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/17.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareView.h"
#import "ImagesCollectionView.h"
#import "CommentTableView.h"
#import "TalkModelFrame.h"
@interface TalkTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *talkViewHeightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shareViewHeightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageVideoViewHeightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageVideoViewWidthLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentTableViewHeightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *likeViewWidthLayout;

@property (strong, nonatomic)TalkModelFrame *talkFrame;

//头像
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
//昵称
@property (weak, nonatomic) IBOutlet UILabel *nickName;
//内容
@property (weak, nonatomic) IBOutlet UIView *talkView;
//转载分享 视图(转载别人的)
@property (weak, nonatomic) IBOutlet ShareView *shareView;
//图片还是视频(自己发布的)
@property (weak, nonatomic) IBOutlet ImagesCollectionView *imageOrVideoView;
//地址
@property (weak, nonatomic) IBOutlet UILabel *adress;
//发布时间
@property (weak, nonatomic) IBOutlet UILabel *time;
//点赞按钮
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;
//点赞视图
@property (weak, nonatomic) IBOutlet UIView *likeView;
//评论TableView(不可滑动)
@property (weak, nonatomic) IBOutlet CommentTableView *commentTableView;

//点赞按钮回调
- (IBAction)likeBtnClick:(UIButton *)sender;

- (void)GetCellFrame:(TalkModelFrame *)talkFrame;

@end
