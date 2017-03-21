//
//  XHCommentModel.m
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/18.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//


#import "XHCommentModel.h"

@implementation XHCommentModel
- (NSAttributedString *)attributedText
{
    if ([self.toUser.nickName length]<1)
    {//没有回复别人的字符串A:xxx
        NSString *textString = [NSString stringWithFormat:@"%@:%@", self.fromUser.nickName, self.fromUser.text];
        NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:textString];
        mutableAttributedString.font = CommentFont;
        mutableAttributedString.color = TextColor;
        mutableAttributedString.lineSpacing = 5.0f;
        NSRange fromUserRange = NSMakeRange(0, self.fromUser.nickName.length+1);
        // 设置昵称颜色
        [mutableAttributedString setColor:NickNameColor range:fromUserRange];
        [mutableAttributedString setFont:NickNameFont range:fromUserRange];
        
        YYTextHighlight *textStringHighlight = [YYTextHighlight highlightWithBackgroundColor:CommentHColor];
        textStringHighlight.userInfo = @{@"commentText":textString};
        [mutableAttributedString setTextHighlight:textStringHighlight range:NSMakeRange(0, textString.length)];
        
        return mutableAttributedString;
        
    }
    else
    {//有回复别人的字符串 A回复B:xxxxx
        NSString *textString = [NSString stringWithFormat:@"%@回复%@:%@", self.fromUser.nickName, self.toUser.nickName,self.fromUser.text];
        
        NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:textString];
        mutableAttributedString.font = CommentFont;
        mutableAttributedString.color = TextColor;
        mutableAttributedString.lineSpacing = 5.0f;
        NSRange fromUserRange = NSMakeRange(0, self.fromUser.nickName.length);
        // 设置回复昵称颜色
        [mutableAttributedString setColor:NickNameColor range:fromUserRange];
        [mutableAttributedString setFont:NickNameFont range:fromUserRange];
        
        NSRange toUserRange = NSMakeRange(self.fromUser.nickName.length+2, self.toUser.nickName.length);
        [mutableAttributedString setColor:NickNameColor range:toUserRange];
        [mutableAttributedString setFont:NickNameFont range:toUserRange];
        YYTextHighlight *textStringHighlight = [YYTextHighlight highlightWithBackgroundColor:CommentHColor];
        textStringHighlight.userInfo = @{@"commentText":textString};
        [mutableAttributedString setTextHighlight:textStringHighlight range:NSMakeRange(0, textString.length)];
        
        return mutableAttributedString;
    }
}
@end
