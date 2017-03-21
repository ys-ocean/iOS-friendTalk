//
//  XHUser.h
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/18.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHUser : NSObject

@property (copy, nonatomic)NSString *userId;
@property (copy, nonatomic)NSString *nickName;
@property (copy, nonatomic)NSString *avatarUrl;
@property (copy, nonatomic)NSString *text;

@end
