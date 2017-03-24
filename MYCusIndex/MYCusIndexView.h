//
//  MYCusIndexView.h
//  MYCusIndex
//
//  Created by mayu on 2017/3/3.
//  Copyright © 2017年 MY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MYCusIndexViewDelegate <NSObject>

- (NSArray *)getTableViewIndexList;
- (void)selectedIndex:(NSInteger)index sectionTitle:(NSString *)title;
- (void)tableViewIndexTouchEnd;

@end

@interface MYCusIndexView : UIView

@property (nonatomic, weak) id<MYCusIndexViewDelegate> cusIndexViewDelegate;
@property (nonatomic) UIColor *textColor;
@property (nonatomic) UIFont  *textFont;

@end
