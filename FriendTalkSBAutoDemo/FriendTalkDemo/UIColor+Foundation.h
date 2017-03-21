//
//  UIColor+Foundation.h
//  HtmlCallCodeDemo
//
//  Created by huhaifeng on 2017/3/16.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Foundation)

/**
 获取服务器动态颜色字符串改变颜色

 @param stringToConvert @"0xff3c00"
 @return 一个颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;
@end
