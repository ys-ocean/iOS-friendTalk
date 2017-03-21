//
//  XHFPSView.m
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/21.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import "XHFPSView.h"

@interface XHFPSView()
{
    NSTimeInterval lastTime;
    NSUInteger count;
}
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) UILabel *label;
@end

@implementation XHFPSView

+ (XHFPSView *)shareCore
{
    static XHFPSView *_shareCore =nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        _shareCore=[[XHFPSView alloc]initWithFrame:CGRectMake(0, 100, 60, 20)];
        [_shareCore initUI];
    });
    return _shareCore;
}

- (void)handleDisplayLink:(CADisplayLink *)displayLink
{
    if (lastTime == 0) {
        lastTime = self.displayLink.timestamp;
        return;
    }
    count++;
    NSTimeInterval timeout = self.displayLink.timestamp - lastTime;
    if (timeout < 1) return;
    lastTime = self.displayLink.timestamp;
    float fps = count / timeout;
    count = 0;
    self.label.text = [NSString stringWithFormat:@"%.fFPS",fps];
}

- (void)open
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink:)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)close
{
    [self.displayLink invalidate];
    self.displayLink = nil;
    [self removeFromSuperview];
}

- (void)initUI
{
    self.backgroundColor =[UIColor clearColor];
    
    [self addSubview:self.label];
}


- (UILabel *)label
{
    if (_label ==nil)
    {
        _label =[[UILabel alloc]initWithFrame:self.bounds];
        _label.font =[UIFont systemFontOfSize:12];
        _label.textColor =[UIColor yellowColor];
        _label.textAlignment =NSTextAlignmentCenter;
        _label.backgroundColor =[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    }
    return _label;
}
@end
