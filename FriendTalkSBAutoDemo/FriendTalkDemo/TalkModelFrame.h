//
//  TalkModelFrame.h
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/17.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "TalkModel.h"
@interface TalkModelFrame : NSObject

@property (strong ,nonatomic)TalkModel * talk;

@property (assign, nonatomic)CGRect headerFrame;

@property (assign, nonatomic)CGRect nickNameFrame;

@property (assign, nonatomic)CGRect textFrame;

@property (assign, nonatomic)CGRect shareFrame;

@property (assign, nonatomic)CGRect attachmentFrame;

@property (assign, nonatomic)CGRect adressFrame;

@property (assign, nonatomic)CGRect timeFrame;

@property (assign, nonatomic)CGRect likeFrame;

@property (assign, nonatomic)CGRect commentTableViewFrame;

/** 评论尺寸模型*/
@property (nonatomic , strong ) NSMutableArray *commentFrames;

/** height*/
@property (nonatomic , assign) CGFloat height;
@end
