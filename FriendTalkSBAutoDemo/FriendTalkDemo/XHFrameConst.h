//
//  XHFrameConst.h
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/20.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

//多半根据约束上来的定义的数值大小 (如果不需要SB+约束 可以按照布局用代码初始化+约束)
UIKIT_EXTERN const CGFloat TopRightBottomLeftSpace;
UIKIT_EXTERN const CGFloat XHHeaderImageLeftSpaceForSuperView;
UIKIT_EXTERN const CGFloat XHHeaderImageTopSpaceForSuperView;
UIKIT_EXTERN const CGFloat XHHeaderImageWW;
UIKIT_EXTERN const CGFloat XHHeaderImageHH;

UIKIT_EXTERN const CGFloat XHNickNameLeftSpaceForHeaderImage;
UIKIT_EXTERN const CGFloat XHNickNameRightSpaceForSuperView;
UIKIT_EXTERN const CGFloat XHNickNameHH;

UIKIT_EXTERN const CGFloat XHTestTopSpaceForNickName;
UIKIT_EXTERN const CGFloat XHTestRightSpaceForNickName;

UIKIT_EXTERN const CGFloat XHShareTopSpaceForText;
UIKIT_EXTERN const CGFloat XHShareRightSpaceForSuperView;
UIKIT_EXTERN const CGFloat XHShareHH;

UIKIT_EXTERN const CGFloat XHAttachmentTopSpaceForShare;
UIKIT_EXTERN const CGFloat XHAttachmentRightSpaceForSuperView;

UIKIT_EXTERN const CGFloat XHImageSpace;

UIKIT_EXTERN const CGFloat XHAdressTopSpaceForAttachment;

UIKIT_EXTERN const CGFloat XHTimeTopSpaceForAdress;

UIKIT_EXTERN const CGFloat XHLikeBtnTopSpaceForAttachment;
UIKIT_EXTERN const CGFloat XHLikeBtnRightSpaceForSuperView;
UIKIT_EXTERN const CGFloat XHLikeBtnWW;
UIKIT_EXTERN const CGFloat XHLikeBtnHH;

UIKIT_EXTERN const CGFloat XHTableViewTopSpaceForLikeBtn;
UIKIT_EXTERN const CGFloat XHTableViewRightSpaceForLikeBtn;
UIKIT_EXTERN const CGFloat XHTableViewBottomSpaceForLikeBtn;

UIKIT_EXTERN const CGFloat XHCommentCellTopBottomSpace;

UIKIT_EXTERN const CGFloat LabelSpace; //上一层 定义了likeCell TopBottom间距一起5.0f
UIKIT_EXTERN const CGFloat LabelTopSpaceFormSuperView;
UIKIT_EXTERN const CGFloat LabelRightSpaceFormSuperView;
UIKIT_EXTERN const CGFloat LabelBottomSpaceFormSuperView;
UIKIT_EXTERN const CGFloat LabelLeftSpaceFormSuperView;

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define LineSpace 5.0f
#define TextColor [UIColor blackColor]
#define TextFont  [UIFont systemFontOfSize:17.0]

#define LikesColor [UIColor blueColor]
#define LikesFont  [UIFont boldSystemFontOfSize:15.0]

#define TextColor [UIColor blackColor]

#define NickNameColor [UIColor blueColor]
#define NickNameFont  [UIFont boldSystemFontOfSize:15.0]

#define CommentFont  [UIFont systemFontOfSize:15.0]
#define CommentHColor [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3]

#define SeparatorColor [UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1]

#define TopBottomTextSpace 10.0f
