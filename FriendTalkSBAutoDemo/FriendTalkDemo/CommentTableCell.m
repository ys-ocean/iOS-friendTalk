//
//  CommentTableCell.m
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/17.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import "CommentTableCell.h"

@implementation CommentTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.selectionStyle =UITableViewCellSelectionStyleNone;
    
    [self addSubview:self.commentLabel];
}

- (void)setCommentFrame:(TalkCommentModelFrame *)commentFrame
{
    _commentFrame =commentFrame;
    self.commentLabel.frame =CGRectMake(LabelLeftSpaceFormSuperView, LabelTopSpaceFormSuperView, _commentFrame.cellWidth -2*LabelLeftSpaceFormSuperView, _commentFrame.cellHeight -2*LabelTopSpaceFormSuperView);
    
    self.commentLabel.attributedText =_commentFrame.comment.attributedText;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (YYLabel *)commentLabel
{
    if (_commentLabel ==nil)
    {
        _commentLabel =[YYLabel new];
        _commentLabel.numberOfLines =0;
        _commentLabel.font =CommentFont;
        _commentLabel.textAlignment = NSTextAlignmentLeft;
        _commentLabel.textColor = TextColor;
        _commentLabel.backgroundColor =[UIColor clearColor];
    }
    return _commentLabel;
}
@end
