//
//  TalkTableCell.m
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/17.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import "TalkTableCell.h"
#import "NotificationClass.h"
@interface TalkTableCell()

@property (strong ,nonatomic)YYTextView *yyTalkView;
@end

@implementation TalkTableCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.selectionStyle =UITableViewCellSelectionStyleNone;
    
    self.headImageView.userInteractionEnabled =YES;
    self.nickName.textColor =[UIColor blueColor];
    self.nickName.font =[UIFont boldSystemFontOfSize:17];//昵称加粗
    self.talkView.backgroundColor =[UIColor clearColor];
}

- (void)setTalkFrame:(TalkModelFrame *)talkFrame
{
    _talkFrame =talkFrame;
    [self updateLayout:_talkFrame];//更新约束
    
    [self updateFrameModelData:_talkFrame];//更新数据
}

- (IBAction)likeBtnClick:(UIButton *)sender
{
    sender.selected =!sender.selected;
    if (sender.selected)
    {
        [self showLikeView];
    }
    else
    {
        [self hiddenLikeView];
    }
}

- (void)showLikeView
{
    [[NotificationClass shareCore]AddLikeViewShowNofica:self sel:@selector(hiddenLikeView)];
    
    self.likeViewWidthLayout.constant =120.0f;
    
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {

    }];
}

- (void)hiddenLikeView
{
    [[NotificationClass shareCore]RemoveLikeViewShowNofica:self];
    
    self.likeBtn.selected =NO;
    self.likeViewWidthLayout.constant =0.0f;
    
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}


- (void)updateFrameModelData:(TalkModelFrame *)talkFrame
{
    TalkModel *model =talkFrame.talk;
    
    XHUser *user =model.user;
    //头像
    [self.headImageView  setImageWithURL:[NSURL URLWithString:talkFrame.talk.user.avatarUrl] placeholder:[UIImage imageNamed:@"defaultAvatar"]];
    //昵称
    self.nickName.text =user.nickName;
    
    //内容
    self.yyTalkView.attributedText =model.textAttributedText;
    //分享
    if (![model.isShare isEqualToString:@"0"])
    {
        self.shareView.share =model.share;
    }
    //图片视频
    if (![model.isAttachmentType isEqualToNumber:@0])
    {
        if ([model.isAttachmentType isEqualToNumber:@1])
        {
            self.imageOrVideoView.attachmentType =imageAttachmentType;
            self.imageOrVideoView.images =model.images;
            
        }
        else
        {
            self.imageOrVideoView.attachmentType =videoAttachmentType;
            self.imageOrVideoView.video =model.video;
            
        }
    }
    else
    {
        [self.imageOrVideoView reloadData];
    }
    //地点
    self.adress.text =model.adress;
    //时间
    self.time.text =model.time;
    
    //评论
    self.commentTableView.likeHeaderHeight =talkFrame.talk.likeHeaderHeight;
    self.commentTableView.likesAttributedText =talkFrame.talk.likesAttributedText;
    self.commentTableView.commentFrames =talkFrame.commentFrames;
}

- (void)updateLayout:(TalkModelFrame *)talkFrame
{

    self.talkViewHeightLayout.constant =talkFrame.textFrame.size.height;
    
    if (talkFrame.shareFrame.size.height<1)
    {
        self.shareView.shareImageViewHeightLayout.constant =0.0f;
        self.shareView.shareBgViewHeightLayout.constant =0.0f;
        self.shareView.shareLabelViewHeightLayout.constant =0.0f;
    }
    else
    {
        self.shareView.shareImageViewHeightLayout.constant =38.0f;
        self.shareView.shareBgViewHeightLayout.constant =42.0f;
        self.shareView.shareLabelViewHeightLayout.constant =38.0f;
    }
    self.shareViewHeightLayout.constant =talkFrame.shareFrame.size.height;

    self.imageVideoViewHeightLayout.constant =talkFrame.attachmentFrame.size.height;
    //self.imageVideoViewWidthLayout.constant =talkFrame.attachmentFrame.size.width;
    
    self.likeViewWidthLayout.constant =0.0f;

    self.commentTableViewHeightLayout.constant =talkFrame.commentTableViewFrame.size.height;
    
    [self.talkView addSubview:self.yyTalkView];
    [self.yyTalkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [self layoutIfNeeded];
}

- (YYTextView *)yyTalkView
{
    if (_yyTalkView ==nil)
    {
        _yyTalkView =[YYTextView new];
        _yyTalkView.scrollEnabled =NO;
        _yyTalkView.editable =NO;
        _yyTalkView.font =TextFont;
        _yyTalkView.backgroundColor =[UIColor clearColor];
        _yyTalkView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _yyTalkView.textContainerInset = UIEdgeInsetsMake(TopBottomTextSpace/2, TopBottomTextSpace/2, TopBottomTextSpace/2, TopBottomTextSpace/2);
    }
    return _yyTalkView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
