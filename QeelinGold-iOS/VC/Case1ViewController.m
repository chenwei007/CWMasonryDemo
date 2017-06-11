//
//  Case1ViewController.m
//  QeelinGold-iOS
//
//  Created by MacBook on 2017/6/10.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "Case1ViewController.h"

@interface Case1ViewController ()
@property (nonatomic ,strong) UIView *oneBackView;
@property (nonatomic ,strong) UIView *twoBackView;

@property (nonatomic ,strong) MASConstraint *topConstraint;
@end

@implementation Case1ViewController

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
    [self.topConstraint uninstall];
    if (isHidden) {
        self.oneBackView.hidden = YES;
        [self.twoBackView mas_updateConstraints:^(MASConstraintMaker *make) {
            self.topConstraint = make.top.equalTo(self.view).offset(64);
        }];
    }else{
        self.oneBackView.hidden = NO;
        [self.twoBackView mas_updateConstraints:^(MASConstraintMaker *make) {
            self.topConstraint = make.top.equalTo(self.oneBackView.mas_bottom);
        }];
    }
    [UIView animateWithDuration:0.1 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (void)setUpUi{
    UIView *oneBackView = [[UIView alloc]init];
    oneBackView.backgroundColor = [UIColor whiteColor];
    self.oneBackView = oneBackView;
    [self.view addSubview:oneBackView];
    [oneBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(64);
    }];
    [self setUpOneSubviews];
    
    UIView *twoBackView = [[UIView alloc]init];
    twoBackView.backgroundColor = [UIColor whiteColor];
    self.twoBackView = twoBackView;
    [self.view addSubview:twoBackView];
    [twoBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        self.topConstraint = make.top.equalTo(oneBackView.mas_bottom);
    }];
    [self setUpTwoSubviews];

}
- (void)setUpOneSubviews{
    CGFloat leftMargin = 15;
    CGFloat topMargin = 15;
    UIImageView *imageV = [[UIImageView alloc]init];
    imageV.backgroundColor = [UIColor redColor];
    [self.oneBackView addSubview:imageV];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(40));
        make.height.equalTo(@(40));
        make.left.equalTo(self.oneBackView).offset(leftMargin);
        make.top.equalTo(self.oneBackView).offset(topMargin);
    }];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.text = @"随时而动";
    [self.oneBackView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageV.mas_right).offset(leftMargin);
        make.top.equalTo(imageV);
    }];
    
    
    UILabel *nameDetailLabel = [[UILabel alloc]init];
    nameDetailLabel.numberOfLines = 2;
    nameDetailLabel.textColor = [UIColor grayColor];
    nameDetailLabel.font = [UIFont systemFontOfSize:12];
    nameDetailLabel.text = @"预测市场走势，不靠谱，发现规律，跟随规律,发现规律，跟随规律,发现规律，跟随规律";
    [self.oneBackView addSubview:nameDetailLabel];
    [nameDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
        make.right.equalTo(self.oneBackView).offset(-leftMargin);
        make.top.equalTo(nameLabel.mas_bottom).offset(topMargin);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self.oneBackView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.oneBackView);
        make.height.equalTo(@(1));
        make.top.equalTo(nameDetailLabel.mas_bottom).offset(10);
    }];
    
    [self.oneBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lineView.mas_bottom);
    }];
}
- (void)setUpTwoSubviews{
    CGFloat leftMargin = 15;
    
    UILabel *productNameLabel = [[UILabel alloc]init];
    productNameLabel.textColor = [UIColor blackColor];
    productNameLabel.font = [UIFont systemFontOfSize:14];
    productNameLabel.text = @"黄金延期";
    [self.twoBackView addSubview:productNameLabel];
    [productNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.twoBackView).offset(leftMargin);
        make.centerY.equalTo(self.twoBackView.mas_centerY);
    }];
    
    [self.twoBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(35));
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
