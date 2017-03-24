//
//  ViewController.m
//  MYCusIndex
//
//  Created by mayu on 2017/3/3.
//  Copyright © 2017年 MY. All rights reserved.
//

#import "ViewController.h"
#import "MYCusIndexTableView.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource,MYCusIndexTableViewDelegate>

@property (nonatomic, copy) NSArray *dataList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initUI];
    _dataList =  @[@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J"],@[@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J"],@[@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J"],@[@"D",@"E",@"F",@"G",@"H",@"I",@"J"],@[@"E",@"F",@"G",@"H",@"I",@"J"],@[@"F",@"G",@"H",@"I",@"J"],@[@"G",@"H",@"I",@"J"],@[@"H",@"I",@"J"],@[@"I",@"J",@"I",@"J",@"I",@"J",@"I",@"J",@"I",@"J",@"I",@"J"],@[@"J",@"k",@"J",@"k",@"J",@"k",@"J",@"k",@"J",@"k",@"J",@"k"]];
    
}

- (void)initUI {
    MYCusIndexTableView *tableView = [[MYCusIndexTableView alloc] initWithFrame:self.view.frame];
    tableView.cusIndexTableViewDelegate = self;
    [self.view addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataList.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataList[section] count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
        
    }
    cell.textLabel.text = _dataList[indexPath.section][indexPath.row];
    return cell;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    view.backgroundColor = [UIColor lightGrayColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, self.view.frame.size.width-30, 44)];
    label.text = _dataList[0][section];
    [view addSubview:label];
    return view;
}

- (NSArray *)getTableViewIndexList {
    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"19",];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
