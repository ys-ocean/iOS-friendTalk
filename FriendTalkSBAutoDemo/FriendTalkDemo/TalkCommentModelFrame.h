//
//  TalkCommentModelFrame.h
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/18.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TalkModel.h"
@interface TalkCommentModelFrame : NSObject

/** 内容尺寸 */
@property (nonatomic , assign) CGRect textFrame;

/** cell宽度 */
@property (nonatomic , assign) CGFloat cellWidth;

/** cell高度 */
@property (nonatomic , assign) CGFloat cellHeight;

@property (strong ,nonatomic)XHCommentModel * comment;

@end
