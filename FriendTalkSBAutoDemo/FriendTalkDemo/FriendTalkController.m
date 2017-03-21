//
//  FriendTalkController.m
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/17.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import "FriendTalkController.h"
#import "TalkModel.h"
#import "TalkModelFrame.h"
#import "XHFPSView.h"
@interface FriendTalkController ()
@property (strong ,nonatomic)NSMutableArray *talkFrames;
@end

@implementation FriendTalkController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[XHFPSView shareCore]open];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[XHFPSView shareCore]close];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title =@"朋友圈";
    
    [self GetDatas];
}

- (void)GetDatas
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ModelData" ofType:@"plist"];
    NSMutableArray * arrayData =[NSMutableArray arrayWithContentsOfFile:filePath];
    [arrayData enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary * dict =(NSDictionary *)obj;
        TalkModel * model =[TalkModel mj_objectWithKeyValues:dict];
        TalkModelFrame * frame =[[TalkModelFrame alloc]init];
        frame.talk =model;
        [self.talkFrames addObject:frame];
        [self.talkFrames addObject:frame];
    }];
    self.tableView.talkFrames =self.talkFrames;
}

- (NSMutableArray *)talkFrames
{
    if (_talkFrames ==nil)
    {
        _talkFrames =[NSMutableArray new];
    }
    return _talkFrames;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
