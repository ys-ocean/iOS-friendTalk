//
//  ShowView.h
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/20.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalkModel.h"
@interface ShareView : UIView
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shareLabelViewHeightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shareImageViewHeightLayout;

@property (weak, nonatomic)IBOutlet UIImageView *shareImageView;

@property (weak, nonatomic)IBOutlet UILabel *shareLabel;

@property (strong, nonatomic)XHShareModel *share;
@end
