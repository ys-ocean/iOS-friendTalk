//
//  TalkTableView.m
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/17.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//
//清除表格视图的多余下横线
#define CLEAR_TABLEVIEW_LINE(TABLEVIEW_NAME) UIView *clearView = [[UIView alloc] init]; \
clearView.backgroundColor = [UIColor clearColor];\
[TABLEVIEW_NAME setTableFooterView:clearView];
#import "TalkTableView.h"
#import "NotificationClass.h"
@implementation TalkTableView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    CLEAR_TABLEVIEW_LINE(self);
    //设置分割线
    [self ShowSeparator];
    
    self.delegate =self;
    self.dataSource =self;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [[NotificationClass shareCore]PostLikeViewShowNofica];
}

- (void)setTalkFrames:(NSMutableArray *)talkFrames
{
    _talkFrames =talkFrames;
    [self reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.talkFrames count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TalkModelFrame * frame =self.talkFrames[indexPath.row];
    return frame.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TalkTableCell *cell =[tableView dequeueReusableCellWithIdentifier:@"TalkTableCell"];
    if (cell ==nil) {
        cell =[[TalkTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TalkTableCell"];
    }
    cell.talkFrame =self.talkFrames[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor whiteColor]];
}

//定制分割线
- (void)ShowSeparator
{
    
    self.separatorColor =[UIColor colorWithRed:233.0/255.0 green:233.0/255.0 blue:233.0/255.0 alpha:1];
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
