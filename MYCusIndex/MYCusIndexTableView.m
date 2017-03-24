//
//  MYCusIndexTableView.m
//  MYCusIndex
//
//  Created by mayu on 2017/3/3.
//  Copyright © 2017年 MY. All rights reserved.
//

#import "MYCusIndexTableView.h"
#import "MYCusIndexView.h"

@interface MYCusIndexTableView () <MYCusIndexViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) UILabel *indexLabel;

@end

@implementation MYCusIndexTableView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:frame];
        tableView.showsVerticalScrollIndicator = NO;
        [self addSubview:tableView];
        _tableView = tableView;
        [self initSubViewsWittFrame:frame];
        
    }
    return self;
}

- (void)initSubViewsWittFrame:(CGRect)frame {
    [self initIndexViewWithFrame:frame];
    _indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    _indexLabel.center = self.center;
    _indexLabel.layer.masksToBounds = YES;
    _indexLabel.layer.cornerRadius = 4;
    _indexLabel.backgroundColor = [UIColor lightGrayColor];
    _indexLabel.textAlignment = NSTextAlignmentCenter;
    _indexLabel.textColor = [UIColor whiteColor];
    _indexLabel.font = [UIFont systemFontOfSize:30];
    _indexLabel.alpha = 0.0;
    [self addSubview:_indexLabel];
    _indexLabel.hidden = YES;

}

- (void)setCusIndexTableViewDelegate:(id<MYCusIndexTableViewDelegate>)cusIndexTableViewDelegate {
    _cusIndexTableViewDelegate = cusIndexTableViewDelegate;
    _tableView.delegate = _cusIndexTableViewDelegate;
    _tableView.dataSource = _cusIndexTableViewDelegate;
}

- (void)initIndexViewWithFrame:(CGRect)frame {
    CGFloat topSpace = 100;
    CGFloat height = frame.size.height - 200;
    MYCusIndexView *indexView = [[MYCusIndexView alloc]initWithFrame:CGRectMake(frame.size.width-30, topSpace, 30, height)];
    indexView.cusIndexViewDelegate = self;
    indexView.textFont = [UIFont systemFontOfSize:12];
    indexView.textColor = [UIColor grayColor];
    indexView.backgroundColor = [UIColor greenColor];
    [self addSubview:indexView];
}

- (NSArray *)getTableViewIndexList {
    NSArray *tableViewIndexList = nil;
    if ([_cusIndexTableViewDelegate respondsToSelector:@selector(getTableViewIndexList)]) {
        tableViewIndexList = [_cusIndexTableViewDelegate getTableViewIndexList];
    } else {
        tableViewIndexList = nil;
    }
    return tableViewIndexList;
}

- (void)selectedIndex:(NSInteger)index sectionTitle:(NSString *)title {
    [self indexLabelShowWith:title];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

- (void)tableViewIndexTouchEnd {
    [UIView animateWithDuration:0.5 animations:^{
        _indexLabel.alpha = 0.0;
    } completion:^(BOOL finished) {
        _indexLabel.hidden = YES;
    }];

}

- (void)indexLabelShowWith:(NSString*)title{
    _indexLabel.hidden = NO;
    _indexLabel.text = title;
    _indexLabel.alpha = 1.0;
    
}

@end
