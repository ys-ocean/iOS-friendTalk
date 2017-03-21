//
//  TalkModelFrame.m
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/17.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import "TalkModelFrame.h"
#import "TalkCommentModelFrame.h"

@interface TalkModelFrame()
{

}
@end

@implementation TalkModelFrame

- (void)setTalk:(TalkModel *)talk
{
    _talk =talk;
    
    //头像
    self.headerFrame =(CGRect){{XHHeaderImageLeftSpaceForSuperView,XHHeaderImageTopSpaceForSuperView},{XHHeaderImageWW,XHHeaderImageHH}};
    
    //昵称
    self.nickNameFrame =[self returnNickNameFrame];
    
    //内容
    self.textFrame =[self returnTextFrame:self.nickNameFrame.origin.x];
    
    //转载分享
    self.shareFrame =[self returnShareFrame:self.nickNameFrame.origin.x];
    
    //图片视频
    self.attachmentFrame =[self returnAttachmentFrame:self.nickNameFrame.origin.x];
    
    //地址
    self.adressFrame =[self returnAdressFrame:self.nickNameFrame.origin.x];
    
    //时间
    self.timeFrame =[self returnTimeFrame:self.nickNameFrame.origin.x];
    
    //点赞按钮
    self.likeFrame =(CGRect){{self.nickNameFrame.origin.x,CGRectGetMaxY(self.attachmentFrame)+XHLikeBtnTopSpaceForAttachment},{XHLikeBtnWW,XHLikeBtnHH}};
    
    //评论tableView
    self.commentTableViewFrame =[self returnCommentTableViewFrame:self.nickNameFrame.origin.x];
    
    //自身height
    if (self.commentTableViewFrame.size.height <1)
    {
        self.height =CGRectGetMaxY(self.likeFrame) +XHTableViewBottomSpaceForLikeBtn;
    }
    else
    {
        self.height =CGRectGetMaxY(self.commentTableViewFrame) +XHTableViewBottomSpaceForLikeBtn;
    }
    
}

- (CGRect)returnNickNameFrame
{
    CGFloat nickNameX =CGRectGetMaxX(self.headerFrame)+XHNickNameLeftSpaceForHeaderImage;
    CGFloat nickNameY =self.headerFrame.origin.y;
    CGFloat nickNameW =SCREEN_WIDTH -nickNameX -XHNickNameRightSpaceForSuperView;
    CGFloat nickNameH =XHNickNameHH;
    return (CGRect){{nickNameX,nickNameY},{nickNameW,nickNameH}};
}

- (CGRect)returnTextFrame:(CGFloat)X
{
    CGFloat textX =X;
    CGFloat textY =CGRectGetMaxY(self.nickNameFrame) +XHTestTopSpaceForNickName;
    CGFloat textW =SCREEN_WIDTH -textX -XHTestRightSpaceForNickName;
    CGFloat textH =[YYTextLayout layoutWithContainerSize:CGSizeMake(textW -TopBottomTextSpace, MAXFLOAT) text:_talk.textAttributedText].textBoundingSize.height;
    textH +=TopBottomTextSpace;
    return (CGRect){{textX,textY},{textW,textH}};
}

- (CGRect)returnShareFrame:(CGFloat)X
{
    if ([_talk.isShare isEqualToString:@"0"])
    {
        CGFloat shareY =CGRectGetMaxY(self.textFrame) +XHShareTopSpaceForText;
        return (CGRect){{X,shareY},{0,0}};
    }
    CGFloat shareX =X;
    CGFloat shareY =CGRectGetMaxY(self.textFrame) +XHShareTopSpaceForText;
    CGFloat shareW =SCREEN_WIDTH -shareX -XHShareRightSpaceForSuperView;
    CGFloat shareH =XHShareHH +TopRightBottomLeftSpace;// 下一个控件距离这个为0 所以要加上
    return (CGRect){{shareX,shareY},{shareW,shareH}};
}

- (CGRect)returnAttachmentFrame:(CGFloat)X
{
    CGFloat attachmentX =X;
    CGFloat attachmentY =CGRectGetMaxY(self.shareFrame) +XHAttachmentTopSpaceForShare;
    CGFloat attachmentW =0.0f;
    CGFloat attachmentH =0.0f;
    CGFloat lowImageW =((SCREEN_WIDTH -attachmentX -TopRightBottomLeftSpace) -2*TopRightBottomLeftSpace)/3;
    CGFloat lowImageH =lowImageW;
    if ([_talk.isAttachmentType isEqualToNumber:@0])
    {
        self.adressFrame =(CGRect){{X,attachmentY},{0,0}};
    }
    else if ([_talk.isAttachmentType isEqualToNumber:@1])
    {
        
//        if ([_talk.images count]==4)
//        {
//            attachmentW =2*lowImageW +XHImageSpace;
//        }
//        else if([_talk.images count]==1)
//        {
//            attachmentW =[_talk.images[0].imageWidth floatValue];
//        }
//        else
//        {
//            if (_talk.images.count >3)
//            {
//                attachmentW =lowImageW *3 +(_talk.images.count-1)*XHImageSpace;
//            }
//            else
//            {
//                attachmentW =lowImageW *_talk.images.count +(_talk.images.count-1)*XHImageSpace;
//            }
//        }
//       宽度固定 避免打印警告 虽然并不会有什么问题The relevant UICollectionViewFlowLayout instance is <UICollectionViewFlowLayout: 0x100622240>, and it is attached to <ImagesCollectionView: 0x1008f2c00; baseClass = UICollectionView; frame = (66 234; 100 108); autoresize = RM+BM; gestureRecognizers = <NSArray: 0x170055780>; layer = <CALayer: 0x17003d120>; contentOffset: {0, 0}; contentSize: {120, 140}> collection view layout: <UICollectionViewFlowLayout: 0x100622240>.
        attachmentW =lowImageW *3 +(_talk.images.count-1)*XHImageSpace;
        
        if ([_talk.images count]>6)
        {
            attachmentH =attachmentW;
        }
        else if ([_talk.images count]>3)
        {
            attachmentH =2*lowImageH +XHImageSpace;
        }
        else
        {
            if ([_talk.images count]==1)
            {
                attachmentH =[_talk.images[0].imageHeight floatValue];
            }
            else
            {
                attachmentH =(1+XHImageSpace)*lowImageH;
            }
            
        }
        attachmentH +=TopRightBottomLeftSpace;// 下一个控件距离这个为0 所以要加上
    }
    else
    {
        attachmentW =[_talk.video.imageWidth floatValue];
        attachmentH =[_talk.video.imageHeight floatValue];
        attachmentH +=TopRightBottomLeftSpace;// 下一个控件距离这个为0 所以要加上
    }
    return (CGRect){{attachmentX,attachmentY},{attachmentW,attachmentH}};
}

- (CGRect)returnAdressFrame:(CGFloat)X
{
    if ([_talk.adress length]>0)
    {//随意用不上,约束弄好了
        CGFloat adressX =X;
        CGFloat adressY =CGRectGetMaxY(self.attachmentFrame)+XHAdressTopSpaceForAttachment;
        CGFloat adressW =100;
        CGFloat adressH =15;
        
        return (CGRect){{adressX,adressY},{adressW,adressH}};
    }
    CGFloat adressY =CGRectGetMaxY(self.attachmentFrame)+XHAdressTopSpaceForAttachment;
    return (CGRect){{X,adressY},{0,0}};
}

- (CGRect)returnTimeFrame:(CGFloat)X
{
    if ([_talk.time length]>0)
    {//随意用不上,约束弄好了
        CGFloat timeX =X;
        CGFloat timeY =CGRectGetMaxY(self.adressFrame)+XHTimeTopSpaceForAdress;
        CGFloat timeW =100;
        CGFloat timeH =15;
        
        return (CGRect){{timeX,timeY},{timeW,timeH}};
    }
    CGFloat timeY =CGRectGetMaxY(self.adressFrame)+XHTimeTopSpaceForAdress;
    return (CGRect){{X,timeY},{0,0}};
}

- (CGRect)returnCommentTableViewFrame:(CGFloat)X
{
    CGFloat tableViewY =CGRectGetMaxY(self.likeFrame) +XHTableViewTopSpaceForLikeBtn;
    CGFloat tableViewW =SCREEN_WIDTH -X -XHTableViewRightSpaceForLikeBtn;
    if ([_talk.likes count]<1 && [_talk.comments count]<1)
    {
        return (CGRect){{X,tableViewY},{0,0}};
    }
    else
    {
        __block CGFloat tableViewH =0.0f;
        
        if ([_talk.likes count]>0)
        {
            tableViewH =[YYTextLayout layoutWithContainerSize:CGSizeMake(tableViewW -TopBottomTextSpace, MAXFLOAT) text:_talk.likesAttributedText].textBoundingSize.height;
            tableViewH +=XHCommentCellTopBottomSpace;
            
            _talk.likeHeaderHeight =tableViewH;
        }
        else
        {
            _talk.likeHeaderHeight =0.0;
        }
        [_talk.comments enumerateObjectsUsingBlock:^(XHCommentModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            TalkCommentModelFrame * commentFrame =[[TalkCommentModelFrame alloc]init];
            commentFrame.cellWidth =tableViewW;
            commentFrame.comment =obj;
            [self.commentFrames addObject:commentFrame];
            tableViewH += commentFrame.cellHeight;
        }];
        
        return (CGRect){{X,tableViewY},{tableViewW,tableViewH}};
    }
}

- (NSMutableArray *)commentFrames
{
    if (_commentFrames ==nil)
    {
        _commentFrames =[NSMutableArray new];
    }
    return _commentFrames;
}
@end
