//
//  ChatInfoTableViewCell.h
//  UI_Lessson_Demo
//
//  Created by KTyrant on 2020/7/16.
//  Copyright © 2020 Byte. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatInfoTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *msgCountLabel;

-(void)setMsgCount:(int) count;
@end

NS_ASSUME_NONNULL_END
