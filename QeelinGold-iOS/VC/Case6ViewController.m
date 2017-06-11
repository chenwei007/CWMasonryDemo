//
//  Case6ViewController.m
//  QeelinGold-iOS
//
//  Created by MacBook on 2017/6/10.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "Case6ViewController.h"

@interface Case6ViewController ()
@property (nonatomic ,strong) UIView *backView;
@property (nonatomic, strong) MASConstraint *leftConstraint;
@property (nonatomic, strong) MASConstraint *topConstraint;

@end

@implementation Case6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor whiteColor];
    [self setDemo1];
//    [self setDemo2];
}
- (void)setDemo1{
    UIView *backView = [[UIView alloc]init];
    self.backView = backView;
    backView.layer.masksToBounds = YES;
    backView.layer.borderWidth = 1.0f;
    backView.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(100, 10, 200, 10));
    }];
    
    UILabel *tipLabel = UILabel.new;
    tipLabel.layer.masksToBounds = YES;
    tipLabel.layer.borderWidth = 1.0f;
    tipLabel.layer.borderColor = [UIColor blackColor].CGColor;
    tipLabel.numberOfLines = 0;
    tipLabel.textColor = [UIColor purpleColor];
    tipLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    tipLabel.text = @"拖动我啊";
    [backView addSubview:tipLabel];
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(backView);
        make.left.greaterThanOrEqualTo(backView);
        make.right.lessThanOrEqualTo(backView);
        make.bottom.lessThanOrEqualTo(backView);
        make.width.height.equalTo(@50);
        _leftConstraint = make.centerX.equalTo(backView.mas_left).with.offset(100).priorityHigh(); // 优先级要比边界条件低
        _topConstraint = make.centerY.equalTo(backView.mas_top).with.offset(200).priorityHigh(); // 优先级要比边界条件低
    }];
    
    UILabel *twoLabel = UILabel.new;
    twoLabel.layer.masksToBounds = YES;
    twoLabel.layer.borderWidth = 1.0f;
    twoLabel.layer.borderColor = [UIColor blackColor].CGColor;
    twoLabel.numberOfLines = 0;
    twoLabel.textColor = [UIColor purpleColor];
    twoLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    twoLabel.text = @"我就跟着你哦";
    [backView addSubview:twoLabel];
    [twoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tipLabel.mas_left).offset(20);
        make.bottom.equalTo(tipLabel.mas_top).offset(-2);

        make.width.height.equalTo(@50);
        make.top.greaterThanOrEqualTo(backView);
        make.right.lessThanOrEqualTo(backView);
    
    }];


    
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panWithGesture:)];
    [backView addGestureRecognizer:pan];
 
}
- (void)setDemo2{
    UIView *backView = [[UIView alloc]init];
    self.backView = backView;
    backView.layer.masksToBounds = YES;
    backView.layer.borderWidth = 1.0f;
    backView.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(100, 10, 200, 10));
    }];
    
    UILabel *tipLabel = UILabel.new;
    tipLabel.layer.masksToBounds = YES;
    tipLabel.layer.borderWidth = 1.0f;
    tipLabel.layer.borderColor = [UIColor blackColor].CGColor;
    tipLabel.numberOfLines = 0;
    tipLabel.textColor = [UIColor purpleColor];
    tipLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    tipLabel.text = @"拖动我啊";
    [backView addSubview:tipLabel];
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(backView);
        make.left.greaterThanOrEqualTo(backView);
        make.right.lessThanOrEqualTo(backView);
        make.bottom.lessThanOrEqualTo(backView);
        make.width.height.equalTo(@50);
        _leftConstraint = make.left.equalTo(backView).offset(1).priorityHigh();
        _topConstraint = make.top.equalTo(backView).offset(1).priorityHigh();
    }];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panWithGesture:)];
    [backView addGestureRecognizer:pan];

}
- (void)panWithGesture:(UIPanGestureRecognizer *)pan {
    CGPoint touchPoint = [pan locationInView:self.backView];
    NSLog(@"%f----%f",touchPoint.x,touchPoint.y);
    _leftConstraint.offset = touchPoint.x;
    _topConstraint.offset = touchPoint.y;
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
