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
#import "Case8ViewController.h"
#import "Case9ViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) NSMutableArray *mArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.mTableView];
    [self.mTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

    self.mArr = [NSMutableArray array];
    NSArray *strArr = @[
                               @"控件高度不确定，动态隐藏和显示",
                               @"控件高度确定，动态隐藏和显示",
                               @"cell高度自适应，有一个注意点，当分割线小于1时，请对此做特殊处理",
                               @"scrolliew里面的控件自适应",
                               @"masorny的一些特定的方法理解",
                               @"控制控件移动时不出设定的边界",
                               @"等高或者等宽，有规律的控件的设置",
                               @"scrolliew里面的控件自适应,scrollview需要上下滚动，也需要左右滚动",
                               @"scrolliew里面的控件自适应，如何理解给scrollview添加一个滚动视图",
                               ];
    for (int i = 0; i < strArr.count; i ++) {
        NSString *str = strArr[i];
//        str = [NSString stringWithFormat:@"Case%dViewController--%@",i + 1,str];
        [self.mArr addObject:str];
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentify=@"mineFirstCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentify];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Case%ldViewController",indexPath.row + 1];
    cell.detailTextLabel.text = self.mArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = self.mArr[indexPath.row];
    if (indexPath.row == 0) {
        Case1ViewController *vc = [[Case1ViewController alloc]init];
        vc.title = str;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        Case2ViewController *vc = [[Case2ViewController alloc]init];
        vc.title = str;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        Case3ViewController *vc = [[Case3ViewController alloc]init];
        vc.title = str;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        Case4ViewController *vc = [[Case4ViewController alloc]init];
        vc.title = str;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        Case5ViewController *vc = [[Case5ViewController alloc]init];
        vc.title = str;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 5){
        Case6ViewController *vc = [[Case6ViewController alloc]init];
        vc.title = str;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 6){
        Case7ViewController *vc = [[Case7ViewController alloc]init];
        vc.title = str;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 7){
        Case8ViewController *vc = [[Case8ViewController alloc]init];
        vc.title = str;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 8){
        Case9ViewController *vc = [[Case9ViewController alloc]init];
        vc.title = str;
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
