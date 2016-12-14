//
//  ViewController.m
//  JSPathDemo
//
//  Created by rocky on 16/12/14.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // js中改为10
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
   // 在JS代码中实现
   // cell.textLabel.text = [NSString stringWithFormat:@"我是第%ld",indexPath.row];
   // cell.detailTextLabel.text = @"abcdefg";
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *dataArray = @[@"1",@"2",@"3"];
    NSString *str = dataArray[indexPath.row]; // 数组溢出crash

    NSLog(@"点击了 %@",str);
    
    // JS修改了bug并添加了跳转功能
}


/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *dataArray = @[@"1",@"2",@"3"];
    if (indexPath.row > dataArray.count-1) {
        return;
    }
    NSString *str = dataArray[indexPath.row];
}
*/

- (void)pushVC{
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    detailVC.navigationItem.title = @"detail";
    [self.navigationController pushViewController:detailVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
