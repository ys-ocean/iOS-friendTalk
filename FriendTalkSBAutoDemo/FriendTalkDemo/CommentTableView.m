//
//  CommentTableView.m
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/17.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//
#define CLEAR_TABLEVIEW_LINE(TABLEVIEW_NAME) UIView *clearView = [[UIView alloc] init]; \
clearView.backgroundColor = [UIColor clearColor];\
[TABLEVIEW_NAME setTableFooterView:clearView];

#import "CommentTableView.h"
#import "CommentTableCell.h"
#import "TalkCommentModelFrame.h"
#import "TalkModelFrame.h"
@implementation CommentTableView
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    CLEAR_TABLEVIEW_LINE(self);
    
    [self ShowSeparator];
    
    self.delegate =self;
    self.dataSource =self;
    // 约束自动算高度
    //    self.estimatedRowHeight =88;
    //    self.rowHeight =UITableViewAutomaticDimension;
    self.backgroundColor =[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
}

- (void)setLikeHeaderHeight:(CGFloat)likeHeaderHeight
{
    _likeHeaderHeight =likeHeaderHeight;
    if (_likeHeaderHeight >1)
    {
        self.headerView.frame =CGRectMake(0, 0, SCREEN_WIDTH -XHHeaderImageLeftSpaceForSuperView -XHHeaderImageWW -XHNickNameLeftSpaceForHeaderImage -XHTableViewRightSpaceForLikeBtn, _likeHeaderHeight);
        self.header.frame =self.headerView.frame;
        
        [self.headerView addSubview:self.header];
        self.tableHeaderView =self.headerView;
    }
    else
    {
        [_headerView removeFromSuperview];
        self.tableHeaderView =[UIView new];
    }
}

- (void)setLikesAttributedText:(NSAttributedString *)likesAttributedText
{
    _likesAttributedText =likesAttributedText;
    self.header.attributedText =_likesAttributedText;
}

- (void)setCommentFrames:(NSMutableArray *)commentFrames
{
    _commentFrames =commentFrames;
    [self reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.commentFrames count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TalkCommentModelFrame * frame =self.commentFrames[indexPath.row];
    return frame.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentTableCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CommentTableCell"];
    if (cell ==nil) {
        cell =[[CommentTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommentTableCell"];
    }
    cell.commentFrame =self.commentFrames[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (UIView *)headerView
{
    if (_headerView ==nil)
    {
        _headerView =[UIView new];
        _headerView.backgroundColor =[UIColor clearColor];
        UILabel *label =[[UILabel alloc]init];
        label.frame =CGRectMake(0, _likeHeaderHeight-0.3, _headerView.frame.size.width, 0.3);
        label.backgroundColor =SeparatorColor;
        [_headerView addSubview:label];
    }
    return _headerView;
}

- (YYLabel *)header
{
    if (_header ==nil)
    {
        _header =[YYLabel new];
        _header.numberOfLines =0;
        _header.font =CommentFont;
        _header.textAlignment = NSTextAlignmentLeft;
        _header.textColor = TextColor;
        _header.backgroundColor =[UIColor clearColor];
    }
    return _header;
}

- (void)ShowSeparator
{
    
    self.separatorColor =SeparatorColor;
    self.separatorStyle =UITableViewCellSeparatorStyleSingleLine;
    
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
}
@end
