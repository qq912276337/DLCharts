//
//  DLVerticalBarChartView.h
//  DLChartView
//
//  Created by sml2 on 2017/6/23.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BarChartView,DLBaseChartItem;

@interface DLVerticalBarChartView : UIView

@property (nonatomic, strong) DLBaseChartItem *item;

@property (nonatomic, strong,readonly) BarChartView *verticalBarChartView;

@end
