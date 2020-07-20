//
//  ChatInfoTableViewCell.m
//  UI_Lessson_Demo
//
//  Created by KTyrant on 2020/7/16.
//  Copyright © 2020 Byte. All rights reserved.
//

#import "ChatInfoTableViewCell.h"

@interface ChatInfoTableViewCell()


@end

@implementation ChatInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 70, 70)];
        self.iconImageView.clipsToBounds = YES;
        self.iconImageView.layer.cornerRadius = 5;
        [self.contentView addSubview:self.iconImageView];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 20, 150, 20)];
        self.nameLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:18];
        [self.contentView addSubview:self.nameLabel];
        
        self.messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 60, 300, 20)];
        self.messageLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.messageLabel];
        
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(350, 20, 100, 20)];
        self.timeLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.timeLabel];
    }
    
    
    return self;
}

-(void)setMsgCount:(int) count
{
    self.msgCountLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 12, 18, 18)];
    self.msgCountLabel.font = [UIFont boldSystemFontOfSize:13];
    self.msgCountLabel.textColor = [UIColor whiteColor];
    self.msgCountLabel.textAlignment = NSTextAlignmentCenter;
    self.msgCountLabel.layer.cornerRadius = self.msgCountLabel.bounds.size.width / 2;
    self.msgCountLabel.layer.masksToBounds = YES;
    self.msgCountLabel.backgroundColor = [UIColor redColor];
    if(count > 0){
        [self.contentView addSubview:self.msgCountLabel];
    }
}
@end
