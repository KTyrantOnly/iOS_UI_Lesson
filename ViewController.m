//
//  ViewController.m
//  UI_Lessson_Demo
//
//  Created by KTyrant on 2020/7/16.
//  Copyright © 2020 Byte. All rights reserved.
//

#import "ViewController.h"
#import "ChatInfoTableViewCell.h"

#define CELLID @"cell"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrChatInfo;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"ByteDance";
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:CELLID];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[ChatInfoTableViewCell class] forCellReuseIdentifier:@"msgcell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;//分割线
    [self.view addSubview:self.tableView];
    
    NSString * path = [NSString stringWithFormat:@"/Users/byte/Documents/iOS_Lesson/UI_Lessson_Demo/UI_Lessson_Demo/sessions.json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    self.arrChatInfo = [NSArray arrayWithArray:result];
}

#pragma mark - tableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
 
//设置每个分组下tableview的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrChatInfo.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

//设置每行对应的cell（展示的内容）
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"msgcell" forIndexPath:indexPath];
    
    NSURL *url = [NSURL URLWithString: [self.arrChatInfo[indexPath.row] objectForKey:@"picture"]];// 获取的图片地址
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]]; // 根据地址取出图片
    cell.iconImageView.image = image; // 将图片放到UIImageView上
    
    cell.nameLabel.text = [self.arrChatInfo[indexPath.row] objectForKey:@"name"];
    
    NSNumber *count = [self.arrChatInfo[indexPath.row] objectForKey:@"unreadCount"];
    
    if ([count respondsToSelector:@selector(intValue)])  {
        [cell setMsgCount:count.intValue];
        cell.msgCountLabel.text = count.stringValue;
    }
    
    cell.messageLabel.text =  [self.arrChatInfo[indexPath.row] objectForKey:@"message"];
    
    NSString *strTime = [self.arrChatInfo[indexPath.row] objectForKey:@"time"];
    NSArray *aArray = [strTime componentsSeparatedByString:@" "];
    NSArray *aArray1 = [aArray[1] componentsSeparatedByString:@":"];
    
    NSString *shortTime = [NSString stringWithFormat:@"%@:%@", aArray1[0], aArray1[1]];
    cell.timeLabel.text = shortTime;
    return cell;
}

@end
