//
//  ImagesCollectionView.h
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/18.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalkModel.h"

typedef NS_ENUM(NSUInteger, AttachmentType)
{
    unKnowAttachmentType =0,
    imageAttachmentType,
    videoAttachmentType,
};

@interface ImagesCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/**
 是图片 还是视频 (image video)
 */
@property (assign, nonatomic)AttachmentType attachmentType;
//图片数组
@property (strong, nonatomic)NSArray <XHVideoImageModel *> *images;
//视频model
@property (strong, nonatomic)XHVideoImageModel *video;

@end
