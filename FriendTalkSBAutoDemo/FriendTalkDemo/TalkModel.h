//
//  TalkModel.h
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/17.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XHUser.h"
#import "XHShareModel.h"
#import "XHVideoImageModel.h"
#import "XHCommentModel.h"

@interface TalkModel : NSObject
//会话id
@property (copy, nonatomic)NSString *talkId;

//会话人物模型数据(id,头像,说了什么,昵称)
@property (strong, nonatomic)XHUser *user;

//是否是分享转载来得 (分享转载文章或视频 都是一个图片一段文字一个url,其实展示都一样;0 不是)
@property (copy, nonatomic)NSString *isShare;
@property (strong, nonatomic)XHShareModel *share;

//用户手动发布的(包含视频k:video,图片k:image;0 不是   代表isShare 必须为YES,反之同理 纯文字情况都为0)dkajhsdk
@property (copy, nonatomic)NSNumber *isAttachmentType;

@property (strong, nonatomic)NSArray <XHVideoImageModel *>*images;

@property (strong, nonatomic)XHVideoImageModel *video;
//是否点过赞
@property (assign, nonatomic) BOOL isLike;

//哪些人点过赞
@property (strong, nonatomic)NSMutableArray <XHUser *>*likes;

//会话发布地址
@property (copy, nonatomic)NSString *adress;

//会话发布时间
@property (copy, nonatomic)NSString *time;

@property (assign, nonatomic)CGFloat likeHeaderHeight;

//会话的所有评论
@property (copy, nonatomic)NSMutableArray <XHCommentModel *>*comments;

/** 富文本 text内容*/
- (NSAttributedString *)textAttributedText;

/** 富文本 点赞人物昵称汇总*/
- (NSAttributedString *)likesAttributedText;
@end




