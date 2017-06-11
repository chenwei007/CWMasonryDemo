//
//  Case8ViewController.m
//  QeelinGold-iOS
//
//  Created by MacBook on 2017/6/11.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "Case8ViewController.h"
#import "RFSegmentView.h"
#define QLWeakSelf __weak typeof(self) weakSelf = self;
@interface Case8ViewController ()<UIScrollViewDelegate>
@property (nonatomic ,strong) UIButton *btn;
@property (nonatomic ,strong) UIButton *btn2;
@property (nonatomic ,strong) RFSegmentView *segmentView;
@property (nonatomic ,strong) UIScrollView *mainContent1ScrollView;
@property (nonatomic ,strong) UIScrollView *mainContent2ScrollView;
@end

@implementation Case8ViewController


/**
 备注，当scrollview需要有滚动视图时，当创建一个uiview当作scrollview的滚动视图，uiview需要设置两部：第一步，设置四周与scrollview约束，第二部，需要设置宽和高，来指定滚动的区域
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置这么多边距只是为了让读者能更好的理解给scroollview添加一个view用作滚动视图的含义
    [self setupDemo1];
    
    //能左右滑动，也能上下滑动
//    [self setupDemo2];
    
    
    UIButton *btn  =[UIButton buttonWithType:UIButtonTypeCustom];
    self.btn = btn;
    [btn setTitle:@"显示demo1" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self.view);
        make.width.equalTo(@100);
        make.height.equalTo(@50);
    }];
    
    UIButton *btn2  =[UIButton buttonWithType:UIButtonTypeCustom];
    self.btn2 = btn2;
    [btn2 setTitle:@"显示demo2" forState:UIControlStateNormal];
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
- (void)setupDemo1{
    UIScrollView *mainContent1ScrollView = [[UIScrollView alloc]init];
    self.mainContent1ScrollView = mainContent1ScrollView;
    mainContent1ScrollView.backgroundColor = [UIColor blackColor];
    mainContent1ScrollView.showsHorizontalScrollIndicator = YES;
    mainContent1ScrollView.showsVerticalScrollIndicator = YES;
    mainContent1ScrollView.bounces = NO;
    mainContent1ScrollView.pagingEnabled = YES;
    mainContent1ScrollView.delegate = self;
    [self.view addSubview:mainContent1ScrollView];
    [mainContent1ScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(100, 10, 10, 50));
    }];
    
    UIView* contentView = UIView.new;
    contentView.backgroundColor = [UIColor blueColor];
    [self.mainContent1ScrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.mainContent1ScrollView).insets(UIEdgeInsetsMake(30, 0, 20, 0));
        make.width.equalTo(self.mainContent1ScrollView.mas_width).multipliedBy(2.0f);
        make.height.equalTo(@300);
    }];
    
    
    
    UIScrollView *leftScrollView = [[UIScrollView alloc]init];
    leftScrollView.backgroundColor = [UIColor yellowColor];
    leftScrollView.showsHorizontalScrollIndicator = NO;
    leftScrollView.showsVerticalScrollIndicator = NO;
    leftScrollView.bounces = NO;
    leftScrollView.delegate = self;
    [contentView addSubview:leftScrollView];
    [leftScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(contentView);
        make.width.equalTo(contentView.mas_width).multipliedBy(0.5f);
        make.height.equalTo(@100);
    }];
    
    UIScrollView *rightScrollView = [[UIScrollView alloc]init];
    rightScrollView.backgroundColor = [UIColor orangeColor];
    rightScrollView.showsHorizontalScrollIndicator = YES;
    rightScrollView.showsVerticalScrollIndicator = YES;
    rightScrollView.bounces = NO;
    rightScrollView.delegate = self;
    [contentView addSubview:rightScrollView];
    [rightScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftScrollView.mas_right);
        make.top.right.equalTo(contentView);
        make.width.equalTo(contentView.mas_width).multipliedBy(0.5f);
        make.height.equalTo(@200);
    }];
    
    UIView *leftView = [[UIView alloc]init];
    leftView.backgroundColor = [UIColor redColor];
    [leftScrollView addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(leftScrollView).insets(UIEdgeInsetsMake(20, 0, 20, 0));
        make.width.equalTo(leftScrollView.mas_width);
        make.height.equalTo(@(1000));
    }];
    
    UIView *rightView = [[UIView alloc]init];
    rightView.backgroundColor = [UIColor purpleColor];
    [rightScrollView addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(rightScrollView).insets(UIEdgeInsetsMake(20, 0, 20, 0));
        make.width.equalTo(rightScrollView.mas_width);
        make.height.equalTo(@(2000));
    }];
 
}
- (void)setupDemo2{
    QLWeakSelf;
    NSArray *segmentedArray = [NSArray arrayWithObjects:@"理财交易",@"TD交易",nil];
    RFSegmentView *segmentView = [[RFSegmentView alloc]initWithFrame:CGRectMake(0, 0, 250, 30) items:segmentedArray];
    segmentView.tintColor = [UIColor orangeColor];
    self.segmentView = segmentView;
    [self.navigationItem setTitleView:segmentView];
    segmentView.handlder = ^ (RFSegmentView * __nullable view, NSInteger selectedIndex) {
        NSLog(@"view:%@ selectedIndex: %ld",view,(long)selectedIndex);
        [weakSelf segmentClick:selectedIndex];
    };
    
    UIScrollView *mainContent2ScrollView = [[UIScrollView alloc]init];
    self.mainContent2ScrollView = mainContent2ScrollView;
    mainContent2ScrollView.backgroundColor = [UIColor blackColor];
    mainContent2ScrollView.showsHorizontalScrollIndicator = YES;
    mainContent2ScrollView.showsVerticalScrollIndicator = YES;
    mainContent2ScrollView.bounces = NO;
    mainContent2ScrollView.pagingEnabled = YES;
    mainContent2ScrollView.delegate = self;
    [self.view addSubview:mainContent2ScrollView];
    [mainContent2ScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIView* contentView = UIView.new;
    contentView.backgroundColor = [UIColor blueColor];
    [self.mainContent2ScrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.mainContent2ScrollView);
        make.width.equalTo(self.mainContent2ScrollView.mas_width).multipliedBy(2.0f);
        make.height.equalTo(self.mainContent2ScrollView.mas_height);
    }];
    
    
    
    UIScrollView *leftScrollView = [[UIScrollView alloc]init];
    leftScrollView.backgroundColor = [UIColor yellowColor];
    leftScrollView.showsHorizontalScrollIndicator = NO;
    leftScrollView.showsVerticalScrollIndicator = NO;
    leftScrollView.bounces = NO;
    leftScrollView.delegate = self;
    [contentView addSubview:leftScrollView];
    [leftScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(contentView);
        make.width.equalTo(contentView.mas_width).multipliedBy(0.5f);
        make.height.equalTo(contentView.mas_height);
    }];
    
    UIScrollView *rightScrollView = [[UIScrollView alloc]init];
    rightScrollView.backgroundColor = [UIColor orangeColor];
    rightScrollView.showsHorizontalScrollIndicator = YES;
    rightScrollView.showsVerticalScrollIndicator = YES;
    rightScrollView.bounces = NO;
    rightScrollView.delegate = self;
    [contentView addSubview:rightScrollView];
    [rightScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftScrollView.mas_right);
        make.top.right.equalTo(contentView);
        make.width.equalTo(contentView.mas_width).multipliedBy(0.5f);
        make.height.equalTo(contentView.mas_height);
    }];
    
    UIView *leftView = [[UIView alloc]init];
    leftView.backgroundColor = [UIColor redColor];
    [leftScrollView addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(leftScrollView);
        make.width.equalTo(leftScrollView.mas_width);
        make.height.equalTo(@(1000));
    }];
    UILabel *leftLabel = [[UILabel alloc]init];
    leftLabel.text = @"左边的滚动区域快到底了";
    [leftView addSubview:leftLabel];
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(leftView.mas_centerX);
        make.bottom.equalTo(leftView.mas_bottom).offset(-100);
        
    }];
    
    UIView *rightView = [[UIView alloc]init];
    rightView.backgroundColor = [UIColor purpleColor];
    [rightScrollView addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(rightScrollView);
        make.width.equalTo(rightScrollView.mas_width);
        make.height.equalTo(@(2000));
    }];
    UILabel *rightLabel = [[UILabel alloc]init];
    rightLabel.text = @"右边的滚动区域正在中间呢";
    [rightView addSubview:rightLabel];
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(rightView.mas_centerX);
        make.centerY.equalTo(rightView.mas_centerY);
        
    }];
}
- (void)btn1Click{
    [self.segmentView removeFromSuperview];
    [self.mainContent2ScrollView removeFromSuperview];
    [self setupDemo1];
    [self.view addSubview:self.btn];
    [self.view addSubview:self.btn2];
}
- (void)btn2Click{
    [self.mainContent1ScrollView removeFromSuperview];
    [self setupDemo2];
    [self.view addSubview:self.btn];
    [self.view addSubview:self.btn2];
    
}

- (void)segmentClick:(NSInteger)segmentSelected{
    if (segmentSelected == 0) {
        CGPoint offset = CGPointMake(0, self.mainContent2ScrollView.contentOffset.y);
        [self.mainContent2ScrollView setContentOffset:offset animated:YES];
    }else if (segmentSelected == 1){
        CGPoint offset = CGPointMake(self.mainContent2ScrollView.frame.size.width, self.mainContent2ScrollView.contentOffset.y);
        [self.mainContent2ScrollView setContentOffset:offset animated:YES];
    }
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
