//
//  TalkTableView.h
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/17.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalkHeaderView.h"
#import "TalkTableCell.h"
#import "TalkModelFrame.h"
@interface TalkTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

@property (strong ,nonatomic)NSMutableArray *talkFrames;

@property (weak ,nonatomic)IBOutlet TalkHeaderView *headerView;

@end
