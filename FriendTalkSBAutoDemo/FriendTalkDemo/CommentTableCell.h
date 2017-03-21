//
//  CommentTableCell.h
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/17.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalkCommentModelFrame.h"
@interface CommentTableCell : UITableViewCell

@property (strong, nonatomic)YYLabel *commentLabel;

@property (strong, nonatomic)TalkCommentModelFrame *commentFrame;
@end
