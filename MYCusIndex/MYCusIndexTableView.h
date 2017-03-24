//
//  MYCusIndexTableView.h
//  MYCusIndex
//
//  Created by mayu on 2017/3/3.
//  Copyright © 2017年 MY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MYCusIndexTableViewDelegate <UITableViewDataSource,UITableViewDelegate>

- (nullable NSArray *)getTableViewIndexList;

@end

@interface MYCusIndexTableView : UIView

@property (nonatomic, strong, nullable) id<MYCusIndexTableViewDelegate> cusIndexTableViewDelegate;

@end
