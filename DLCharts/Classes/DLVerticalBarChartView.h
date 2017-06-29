//
//  DLVerticalBarChartView.h
//  DLChartView
//
//  Created by sml2 on 2017/6/23.
//  Copyright © 2017年 qq912276337. All rights reserved.
//


#import "DLChartBaseView.h"
@class BarChartView;

@interface DLVerticalBarChartView : DLChartBaseView

@property (nonatomic, strong) DLChartConfigureItem *item;

@property (nonatomic, strong,readonly) BarChartView *chartView;
/** 是否显示y右轴 默认显示 */
@property (nonatomic, assign) BOOL rightYAxisEnalbe;
/** 是否显示图例 默认显示 */
@property (nonatomic, assign) BOOL legendEnable;

@end
