//
//  NotificationClass.h
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/20.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotificationClass : NSObject

/**单例初始化  */
+ (NotificationClass *)shareCore;

- (void)AddLikeViewShowNofica:(id)weSelf sel:(SEL)sel;
- (void)PostLikeViewShowNofica;
- (void)RemoveLikeViewShowNofica:(id)weSelf;
@end
