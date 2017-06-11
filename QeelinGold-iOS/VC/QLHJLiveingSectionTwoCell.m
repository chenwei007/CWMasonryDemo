//
//  QLHJLiveingSectionTwoCell.m
//  QeelinGold-iOS
//
//  Created by MacBook on 2017/6/5.
//  Copyright © 2017年 ChenWei. All rights reserved.
//

#import "QLHJLiveingSectionTwoCell.h"

@implementation QLHJLiveingSectionTwoCell

+ (QLHJLiveingSectionTwoCell *)cellWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"QLHJLiveingSectionTwoCell";
    QLHJLiveingSectionTwoCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QLHJLiveingSectionTwoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUi];
    }
    return self;
    
}
- (void)setUi{
    CGFloat leftRightMargin = 15;
    CGFloat topMargin = 15;

    UIImageView *iamgeV = [[UIImageView alloc]init];
    iamgeV.clipsToBounds=YES;
    iamgeV.layer.cornerRadius=6;
    [iamgeV.layer setMasksToBounds:YES];
    iamgeV.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:iamgeV];
    [iamgeV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(leftRightMargin);
        make.top.equalTo(self.contentView).offset(topMargin);
        make.height.equalTo(@(70));
        make.width.equalTo(@(70));
    }];

    UILabel *nameDetailLabel = [[UILabel alloc]init];
    nameDetailLabel.numberOfLines = 0;
    nameDetailLabel.textColor = [UIColor grayColor];
    nameDetailLabel.font = [UIFont systemFontOfSize:14];
    nameDetailLabel.text = @"预测市场走势，不靠谱，发现规律，跟随规律,发现规律，跟随规律,发现规律，跟随规律";
    [self.contentView addSubview:nameDetailLabel];
    nameDetailLabel.preferredMaxLayoutWidth = SCREEN_WIDTH - 2 * leftRightMargin;
    [nameDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iamgeV.mas_right).offset(topMargin);
        make.right.equalTo(self.contentView).offset(-topMargin);
        make.top.equalTo(iamgeV);
    }];
    [nameDetailLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.textAlignment = NSTextAlignmentLeft;
    timeLabel.textColor = [UIColor grayColor];
    timeLabel.font = [UIFont systemFontOfSize:12];
    timeLabel.text = @"直播时间：9：00-23:00";
    [self.contentView addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(nameDetailLabel);
        make.bottom.equalTo(iamgeV.mas_bottom);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.height.equalTo(@1);
        make.top.equalTo(iamgeV.mas_bottom).offset(topMargin);
        make.bottom.equalTo(self.contentView);
    }];
     //这里强调一下，当设置一条高度为0.5的分割线时，masorny算得不准，解决方案是把分割线封装为一个view。里面给一条高度为0.5的线，这个view的高度设置为1
}
@end
