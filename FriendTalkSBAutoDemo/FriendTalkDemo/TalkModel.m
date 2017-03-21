//
//  TalkModel.m
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/17.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import "TalkModel.h"
@implementation TalkModel

+ (NSDictionary *)objectClassInArray
{
    return @{@"images":@"XHVideoImageModel",@"likes":@"XHUser",@"comments":@"XHCommentModel"};
}

- (NSAttributedString *)textAttributedText
{
    if ([self.user.text length]<1)
    {
        return nil;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.user.text];
    attributedString.font = TextFont;
    attributedString.color = TextColor;
    attributedString.lineSpacing = LineSpace;
    return attributedString;
}

- (NSAttributedString *)likesAttributedText
{
    if ([self.likes count]<1)
    {
        return nil;
    }
    // 爱心图片
    NSMutableAttributedString * allAttributed =[NSMutableAttributedString new];
    [allAttributed appendString:@" "];
    
    UIImage *heartImage =[UIImage imageNamed:@"heart"];
    NSData *heartImageData =UIImagePNGRepresentation(heartImage);
    YYImage *image = [YYImage imageWithData:heartImageData scale:1.0];//修改表情大小
    image.preloadAllAnimatedImageFrames = YES;
    YYAnimatedImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:image];
    NSMutableAttributedString *attachTextImage = [NSMutableAttributedString attachmentStringWithContent:imageView contentMode:UIViewContentModeCenter attachmentSize:imageView.size alignToFont:LikesFont alignment:YYTextVerticalAlignmentCenter];
    [allAttributed appendAttributedString:attachTextImage];
    
    [self.likes enumerateObjectsUsingBlock:^(XHUser * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *name;
        if (idx ==0)
        {
            name =[NSString stringWithFormat:@" %@",obj.nickName];
        }
        else
        {
            name =[NSString stringWithFormat:@"%@",obj.nickName];
        }
        NSMutableAttributedString *attributedName = [[NSMutableAttributedString alloc]initWithString:name];
        attributedName.font = LikesFont;
        attributedName.color = LikesColor;
        attributedName.lineSpacing = LineSpace;
        [allAttributed appendAttributedString:attributedName];
        
        if (idx!=[_likes count]-1)
        {
            NSMutableAttributedString *comma = [[NSMutableAttributedString alloc]initWithString:@"，"];
            comma.font = LikesFont;
            comma.color = [UIColor blackColor];
            comma.lineSpacing = LineSpace;
            [allAttributed appendAttributedString:comma];
        }
    }];
    
    return allAttributed;
}
@end



