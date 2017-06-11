//
//  Case7ViewController.m
//  QeelinGold-iOS
//
//  Created by MacBook on 2017/6/11.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "Case7ViewController.h"

@interface Case7ViewController ()

@end

@implementation Case7ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //等高等宽
//    [self setupUI];
    
    //等宽不登高（父控件的高度由字控件决定，相对于父控件剧中）
    [self setupUI2];
}
- (void) setupUI
{
    UIView * bgView = UIView.new;
    bgView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:bgView];
    CGFloat padding = 10.0f;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(padding, padding, padding, padding));
    }];
    
    UIView * redView = UIView.new;
    redView.backgroundColor = [UIColor redColor];
    [bgView addSubview:redView];
    
    UIView * blackView = UIView.new;
    blackView.backgroundColor = [UIColor blackColor];
    [bgView addSubview:blackView];

    UIView * greenView = UIView.new;
    greenView.backgroundColor = [UIColor greenColor];
    [bgView addSubview:greenView];

    
    UIView * yellowView = UIView.new;
    [bgView addSubview:yellowView];
    yellowView.backgroundColor = [UIColor yellowColor];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(padding);
        make.centerY.equalTo(bgView);
        
        /**
         *  长宽相等 注意，这里不能用 make.height.equalTo(make.width);
         */
        make.height.equalTo(redView.mas_width); /// 约束长度等于宽度
        make.width.equalTo(blackView.mas_width);
    }];
    
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.left.equalTo(redView.mas_right).offset(padding);
        make.height.equalTo(blackView.mas_width);
        make.width.equalTo(greenView.mas_width);
    }];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.left.equalTo(blackView.mas_right).offset(padding);
        make.right.equalTo(yellowView.mas_left).offset(-padding);
        make.height.equalTo(greenView.mas_width);
        make.width.equalTo(yellowView.mas_width);
    }];


    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.right.equalTo(bgView).offset(-padding);
        make.height.equalTo(yellowView.mas_width);
        make.width.equalTo(redView.mas_width);
    }];
}
- (void) setupUI2{
    UIView * bgView = UIView.new;
    bgView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:bgView];
    CGFloat padding = 10.0f;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
        make.centerX.equalTo(self.view.mas_centerX);
        make.right.equalTo(self.view).offset(-100);
    }];
    
    UIView * redView = UIView.new;
    redView.backgroundColor = [UIColor redColor];
    [bgView addSubview:redView];
    
    UIView * blackView = UIView.new;
    blackView.backgroundColor = [UIColor blackColor];
    [bgView addSubview:blackView];
    
    UIView * greenView = UIView.new;
    greenView.backgroundColor = [UIColor greenColor];
    [bgView addSubview:greenView];
    
    
    UIView * yellowView = UIView.new;
    [bgView addSubview:yellowView];
    yellowView.backgroundColor = [UIColor yellowColor];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(padding);
        make.centerY.equalTo(bgView);
        make.bottom.lessThanOrEqualTo(bgView);
        /**
         *  长宽相等 注意，这里不能用 make.height.equalTo(make.width);
         */
        make.height.equalTo(@(100)); /// 约束长度等于宽度
        make.width.equalTo(blackView.mas_width);
    }];
    
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.left.equalTo(redView.mas_right).offset(padding);
        make.height.equalTo(@(200));
        make.width.equalTo(greenView.mas_width);
        make.bottom.lessThanOrEqualTo(bgView);
    }];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.left.equalTo(blackView.mas_right).offset(padding);
        make.right.equalTo(yellowView.mas_left).offset(-padding);
        make.height.equalTo(@(50));
        make.width.equalTo(yellowView.mas_width);
        make.bottom.lessThanOrEqualTo(bgView);
    }];
    
    
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.right.equalTo(bgView).offset(-padding);
        make.height.equalTo(@(20));
        make.width.equalTo(redView.mas_width);
        make.bottom.lessThanOrEqualTo(bgView);
    }];
}

@end
