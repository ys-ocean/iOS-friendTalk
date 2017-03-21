//
//  XHFPSView.h
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/21.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHFPSView : UIView

/**单例初始化  */
+ (XHFPSView *)shareCore;

- (void)open;

- (void)close;

@end
