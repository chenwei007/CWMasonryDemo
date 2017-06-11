//
//  Case2ViewController.m
//  QeelinGold-iOS
//
//  Created by MacBook on 2017/6/10.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "Case2ViewController.h"

@interface Case2ViewController ()
@property (nonatomic ,strong) UIView *oneBackView;
@property (nonatomic ,strong) UIView *twoBackView;

@end

@implementation Case2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self setUpUi];
    
    UIButton *btn  =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"隐藏" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self.view);
        make.width.equalTo(@100);
        make.height.equalTo(@50);
    }];
    
    UIButton *btn2  =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"显示" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor redColor];
    [btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btn.mas_right).offset(50);
        make.bottom.equalTo(self.view);
        make.width.equalTo(@100);
        make.height.equalTo(@50);
    }];
    
}
- (void)btn1Click{
    [self updateView:YES];
}
- (void)btn2Click{
    [self updateView:NO];
}
- (void)updateView:(BOOL)isHidden{
    if (isHidden) {
        [self.oneBackView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0);
        }];

    }else{
        [self.oneBackView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@100);
        }];
    }
    [UIView animateWithDuration:0.1 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (void)setUpUi{
    UIView *oneBackView = [[UIView alloc]init];
    oneBackView.backgroundColor = [UIColor redColor];
    self.oneBackView = oneBackView;
    [self.view addSubview:oneBackView];
    [oneBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(64);
        make.height.equalTo(@100);
    }];
    
    UIView *twoBackView = [[UIView alloc]init];
    twoBackView.backgroundColor = [UIColor whiteColor];
    self.twoBackView = twoBackView;
    [self.view addSubview:twoBackView];
    [twoBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(oneBackView.mas_bottom);
        make.height.equalTo(@100);
    }];
    
    
}

@end
