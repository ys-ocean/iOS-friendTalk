//
//  ShowView.m
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/20.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import "ShareView.h"

@implementation ShareView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.shareBgView.backgroundColor =[UIColor colorWithRed:233.0/255.0 green:233.0/255.0 blue:233.0/255.0 alpha:1];
}

- (void)setShare:(XHShareModel *)share
{
    _share =share;
    [self.shareImageView  setImageWithURL:[NSURL URLWithString:_share.imageSmallUrl] placeholder:[UIImage imageNamed:@"mh_defaultAvatar"]];
    self.shareLabel.text =_share.text;
}


- (void)layoutIfNeeded
{
    [super layoutIfNeeded];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
}
@end
