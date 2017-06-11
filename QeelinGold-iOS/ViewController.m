//
//  ViewController.m
//  QeelinGold-iOS
//
//  Created by MacBook on 2017/4/5.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "ViewController.h"
#import "btn1ViewController.h"
#import "btn2ViewController.h"
#import "UIButton+Action.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "Case1ViewController.h"
#import "Case2ViewController.h"
#import "Case3ViewController.h"
#import "Case4ViewController.h"
#import "Case5ViewController.h"
#import "Case6ViewController.h"
#import "Case7ViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.mTableView];
    [self.mTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentify=@"mineFirstCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Case%ldViewController",indexPath.row + 1];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        Case1ViewController *vc = [[Case1ViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        Case2ViewController *vc = [[Case2ViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        Case3ViewController *vc = [[Case3ViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        Case4ViewController *vc = [[Case4ViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        Case5ViewController *vc = [[Case5ViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 5){
        Case6ViewController *vc = [[Case6ViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 6){
        Case7ViewController *vc = [[Case7ViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];

    }
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
