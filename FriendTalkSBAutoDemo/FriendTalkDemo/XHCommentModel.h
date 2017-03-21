//
//  XHCommentModel.h
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/18.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XHUser.h"
@interface XHCommentModel : NSObject
@property (copy, nonatomic)NSString *commentId;
@property (strong, nonatomic)XHUser *fromUser;
@property (strong, nonatomic)XHUser *toUser;

/** 获取富文本 */
- (NSAttributedString *)attributedText;
@end
