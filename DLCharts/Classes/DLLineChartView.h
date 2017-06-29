//
//  DLLineChartView.h
//  DLChartView
//
//  Created by sml2 on 2017/6/23.
//  Copyright © 2017年 qq912276337. All rights reserved.
//


#import "DLChartBaseView.h"
@class LineChartView;

typedef NS_ENUM (NSInteger,DLLineChartViewXAxisLabelPosition) {
    DLLineChartViewXAxisLabelPositionTop = 0,
    DLLineChartViewXAxisLabelPositionBottom = 1,
    DLLineChartViewXAxisLabelPositionBothSided = 2,
    DLLineChartViewXAxisLabelPositionTopInside = 3,
    DLLineChartViewXAxisLabelPositionBottomInside = 4,
};

@interface DLLineChartView : DLChartBaseView

@property (nonatomic, strong,readonly) LineChartView *chartView;

@property (nonatomic, strong) DLChartConfigureItem *item;

/** X轴位置 默认在底部*/
@property (nonatomic, assign) DLLineChartViewXAxisLabelPosition xAxisLabelPosition;
/** 折线颜色 */
@property (nonatomic, strong) UIColor *lineColor;
/** 是否显示图例 默认显示 */
@property (nonatomic, assign) BOOL legendEnable;

@end
