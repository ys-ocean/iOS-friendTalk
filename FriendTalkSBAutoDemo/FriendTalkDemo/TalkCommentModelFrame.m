//
//  TalkCommentModelFrame.m
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/18.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//


#import "TalkCommentModelFrame.h"

@implementation TalkCommentModelFrame

- (void)setComment:(XHCommentModel *)comment
{
    _comment =comment;
    // 文本内容
    CGFloat textX = LabelLeftSpaceFormSuperView;
    CGFloat textY = LabelTopSpaceFormSuperView;
    CGSize  textLimitSize = CGSizeMake(self.cellWidth - 2*textX, MAXFLOAT);
    CGFloat textH = [YYTextLayout layoutWithContainerSize:textLimitSize text:comment.attributedText].textBoundingSize.height;
    textH +=2*LabelTopSpaceFormSuperView;
    self.textFrame = (CGRect){{textX , textY} , {textLimitSize.width , textH}};
    self.cellHeight = CGRectGetMaxY(self.textFrame) +LabelTopSpaceFormSuperView +LabelBottomSpaceFormSuperView;
}

@end
