//
//  Case5ViewController.m
//  QeelinGold-iOS
//
//  Created by MacBook on 2017/6/10.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "Case5ViewController.h"
#import "Case6ItemView.h"

@interface Case5ViewController ()

@end

@implementation Case5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setDemo1];
    [self setDemo2];
    [self setDemo3];

}
- (void)setDemo1{
    UIView *labelBackView = [[UIView alloc]init];
    labelBackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:labelBackView];
    [labelBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(70);
    }];
    
    UILabel *nameLabel = UILabel.new;
    nameLabel.numberOfLines = 1;
    nameLabel.textColor = [UIColor purpleColor];
    nameLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    nameLabel.text = @"chenwei";
    [labelBackView addSubview:nameLabel];
    
    UILabel *shortLabel = UILabel.new;
    shortLabel.numberOfLines = 1;
    shortLabel.textColor = [UIColor purpleColor];
    shortLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    shortLabel.text = @"2017.01.31";
    [labelBackView addSubview:shortLabel];
    
    UILabel *longLabel = UILabel.new;
    //    self.longLabel.numberOfLines = 0;
    longLabel.textColor = [UIColor redColor];
    longLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    longLabel.text = @"ipsum dolor sit amet spare ribs fatback kielbasa salami, tri-tip jowl pastrami flank short loin rump sirloin. Tenderloin frankfurter chicken biltong rump chuck filet mignon pork t-bone flank ham hock.";
    [labelBackView addSubview:longLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(labelBackView).offset(10);
    }];
    [longLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel.mas_right).offset(10);
        make.top.equalTo(nameLabel);
        make.right.equalTo(shortLabel.mas_left).offset(-10);
    }];
    
    [shortLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel);
        make.right.equalTo(labelBackView).offset(-10);
    }];
    //    [self.longLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    //    [self.shortLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [shortLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [longLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    
    [labelBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(longLabel.mas_bottom).offset(10);
    }];
}
- (void)setDemo2{
    UIView *oneBackView = [[UIView alloc]init];
    oneBackView.backgroundColor = [UIColor redColor];
    [self.view addSubview:oneBackView];
    [oneBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(150);
        make.height.equalTo(@(110));
    }];
    
    UIView *oneView = [[UIView alloc]init];
    oneView.backgroundColor = [UIColor blackColor];
    [oneBackView addSubview:oneView];
    [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(oneBackView);
        make.height.equalTo(@(100));
        make.width.equalTo(oneBackView.mas_width).multipliedBy(0.5);
    }];
    
    UIView *twoView = [[UIView alloc]init];
    twoView.backgroundColor = [UIColor redColor];
    [oneBackView addSubview:twoView];
    [twoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(oneBackView);
        make.height.equalTo(@(100));
        make.width.equalTo(oneBackView.mas_width).multipliedBy(0.5);
    }];

}
- (void)setDemo3{
    // 初始化图片资源
    NSArray *images = @[[UIImage imageNamed:@"dog_small"], [UIImage imageNamed:@"dog_middle"], [UIImage imageNamed:@"dog_big"]];
    
    // 创建3个item
    UIView *item1 = [Case6ItemView newItemWithImage:images[0] text:@"Auto layout is a system"];
    UIView *item2 = [Case6ItemView newItemWithImage:images[1] text:@"Auto Layout is a system that lets you lay out"];
    UIView *item3 = [Case6ItemView newItemWithImage:images[2] text:@"Auto Layout is a system that lets you lay out your app’s user interface"];
    [self.view addSubview:item1];
    [self.view addSubview:item2];
    [self.view addSubview:item3];
    
    [item1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).with.offset(8);
        make.top.mas_equalTo(self.view.mas_top).with.offset(300);
    }];
    
    // 跟第一个item的baseline对其
    [item2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(item1.mas_right).with.offset(10);
        make.baseline.mas_equalTo(item1.mas_baseline);
    }];
    
    // 跟第一个item的baseline对其
    [item3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(item2.mas_right).with.offset(10);
        make.baseline.mas_equalTo(item1.mas_baseline);
    }]; 
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
