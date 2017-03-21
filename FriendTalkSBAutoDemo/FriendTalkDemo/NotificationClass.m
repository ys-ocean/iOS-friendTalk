//
//  NotificationClass.m
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/20.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import "NotificationClass.h"

@interface NotificationClass()
{
    BOOL isRemoveLikeViewShowNotifica;
}
@end

@implementation NotificationClass


+ (NotificationClass *)shareCore
{
    static NotificationClass *_shareCore =nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        _shareCore=[[NotificationClass alloc]init];
    });
    return _shareCore;
}

- (void)AddLikeViewShowNofica:(id)weSelf sel:(SEL)sel
{
    isRemoveLikeViewShowNotifica =YES;
    [[NSNotificationCenter defaultCenter]addObserver:weSelf selector:sel name:@"likeViewShow" object:nil];
}
- (void)PostLikeViewShowNofica
{
    if (isRemoveLikeViewShowNotifica)
    {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"likeViewShow" object:nil];
    }
}
- (void)RemoveLikeViewShowNofica:(id)weSelf
{
    isRemoveLikeViewShowNotifica =NO;
    [[NSNotificationCenter defaultCenter]removeObserver:@"likeViewShow"];
}
@end
