//
//  DLPieChartsView.h
//  DLChartView
//
//  Created by sml2 on 2017/6/23.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DLBaseChartItem,PieChartView;

@interface DLPieChartView : UIView

@property (nonatomic, strong) DLBaseChartItem *item;

@property (nonatomic, strong,readonly) PieChartView *pieChartView;

@end
