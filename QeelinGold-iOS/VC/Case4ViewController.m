//
//  Case4ViewController.m
//  QeelinGold-iOS
//
//  Created by MacBook on 2017/6/10.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "Case4ViewController.h"
#import "QLHJLiveingSectionTwoCell.h"
@interface Case4ViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic ,strong) UIScrollView *mainContentScrollView;
@end

@implementation Case4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpUi];
}
- (void)setUpUi{
    UIScrollView *mainContentScrollView = [[UIScrollView alloc]init];
    self.mainContentScrollView = mainContentScrollView;
    mainContentScrollView.backgroundColor = [UIColor grayColor];
    mainContentScrollView.showsHorizontalScrollIndicator = YES;
    mainContentScrollView.showsVerticalScrollIndicator = YES;
    mainContentScrollView.bounces = YES;
    mainContentScrollView.delegate = self;
    [self.view addSubview:mainContentScrollView];
    
    [mainContentScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIView* contentView = UIView.new;
    contentView.backgroundColor = [UIColor blueColor];
    [self.mainContentScrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.mainContentScrollView);
        make.width.equalTo(self.mainContentScrollView);
    }];
    
    // 第一种scrollview上放很多view，高度动态
    UIView *lastView;
    for (int i = 0; i < 10; i ++) {
        UIView *oneView = [[UIView alloc]init];
        oneView.backgroundColor = [UIColor redColor];
        [contentView addSubview:oneView];
        [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(contentView);
            make.top.equalTo(lastView ? lastView.mas_bottom : @0).offset(20);
            make.height.equalTo(@100);
        }];
        lastView = oneView;
    }
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
    
    
    
    //第二种scrollview上放的有view 也有tableview，高度动态 未解决，如果有哪位可以解决这个请告知我
//    UIView *oneView = [[UIView alloc]init];
//    oneView.backgroundColor = [UIColor redColor];
//    [contentView addSubview:oneView];
//    [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(contentView);
//        make.top.equalTo(contentView).offset(20);
//        make.height.equalTo(@100);
//    }];
//    
//    [contentView addSubview:self.mTableView];
//    [self.mTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(oneView.mas_bottom).offset(50);
//        make.left.right.equalTo(contentView);
//        make.height.equalTo(@(500));
//    }];
//    
//    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.mTableView.mas_bottom);
//    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QLHJLiveingSectionTwoCell *cell = [QLHJLiveingSectionTwoCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (UITableView *)mTableView{
    if (!_mTableView) {
        _mTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        _mTableView.dataSource = self;
        _mTableView.delegate = self;
        _mTableView.backgroundColor = [UIColor whiteColor];
        _mTableView.rowHeight = UITableViewAutomaticDimension;
        _mTableView.estimatedRowHeight = 80;
    }
    return _mTableView;
}

@end
