//
//  Case9ViewController.m
//  QeelinGold-iOS
//
//  Created by MacBook on 2017/6/11.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "Case9ViewController.h"

@interface Case9ViewController ()
@property (nonatomic ,strong) UIScrollView *mainContentScrollView;
@end

@implementation Case9ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *mainContentScrollView = [[UIScrollView alloc]init];
    self.mainContentScrollView = mainContentScrollView;
    mainContentScrollView.backgroundColor = [UIColor redColor   ];
    mainContentScrollView.showsHorizontalScrollIndicator = YES;
    mainContentScrollView.showsVerticalScrollIndicator = YES;
    mainContentScrollView.bounces = NO;
    [self.view addSubview:mainContentScrollView];
    [mainContentScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 10, 10, 50));
    }];
    
    //通过设置边距可以深刻的理解如何把contentview当作scrollview的滚动视图的
    UIView* contentView = UIView.new;
    contentView.backgroundColor = [UIColor blueColor];
    [self.mainContentScrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.mainContentScrollView).insets(UIEdgeInsetsMake(20, 30, 40, 50));
        make.width.equalTo(@(1000));
        make.height.equalTo(@1000);
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
