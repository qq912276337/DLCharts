//
//  DLLineChartView.h
//  DLChartView
//
//  Created by sml2 on 2017/6/23.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DLBaseChartItem,LineChartView;

typedef NS_ENUM (NSInteger,DLLineChartViewXAxisLabelPosition) {
    DLLineChartViewXAxisLabelPositionTop = 0,
    DLLineChartViewXAxisLabelPositionBottom = 1,
    DLLineChartViewXAxisLabelPositionBothSided = 2,
    DLLineChartViewXAxisLabelPositionTopInside = 3,
    DLLineChartViewXAxisLabelPositionBottomInside = 4,
};

@interface DLLineChartView : UIView

@property (nonatomic, strong) DLBaseChartItem *item;

@property (nonatomic, strong,readonly) LineChartView *chartView;

/** X轴位置 默认在底部*/
@property (nonatomic, assign) DLLineChartViewXAxisLabelPosition xAxisLabelPosition;


@end
