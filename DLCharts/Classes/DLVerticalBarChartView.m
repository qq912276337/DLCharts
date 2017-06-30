//
//  DLVerticalBarChartView.m
//  DLChartView
//
//  Created by sml2 on 2017/6/23.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import "DLVerticalBarChartView.h"
#import "DLChartConfigureItem.h"
#import <Charts/Charts-Swift.h>

@interface DLVerticalBarChartView ()

@property (nonatomic, strong) BarChartView *chartView;

@end
@implementation DLVerticalBarChartView

- (instancetype)init {
    if (self = [super init]) {
        [self setupView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _chartView.frame = self.bounds;
}

- (void)setupView {
    _chartView = [[BarChartView alloc] init];
    [self addSubview:_chartView];
    
    _chartView.chartDescription.enabled = NO;
    _chartView.drawGridBackgroundEnabled = NO;
    _chartView.dragEnabled = YES;
    [_chartView setScaleEnabled:YES];
    _chartView.pinchZoomEnabled = NO;
    _chartView.drawBarShadowEnabled = NO;
    _chartView.drawValueAboveBarEnabled = YES;
    
    ChartXAxis *xAxis = _chartView.xAxis;
    xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.labelFont = [UIFont systemFontOfSize:10.f];
    xAxis.drawGridLinesEnabled = NO;//不绘制网格线
    xAxis.granularity = 1.0; // only intervals of 1 day
    xAxis.labelCount = 7;
    xAxis.granularity = self.spaceBetweenX;
    
    NSNumberFormatter *leftAxisFormatter = [[NSNumberFormatter alloc] init];
    leftAxisFormatter.minimumFractionDigits = 0;
    leftAxisFormatter.maximumFractionDigits = 1;
    
    ChartYAxis *leftAxis = _chartView.leftAxis;
    leftAxis.labelFont = [UIFont systemFontOfSize:10.f];
    leftAxis.labelCount = 8;
    leftAxis.valueFormatter = [[ChartDefaultAxisValueFormatter alloc] initWithFormatter:leftAxisFormatter];
    leftAxis.labelPosition = YAxisLabelPositionOutsideChart;
    leftAxis.spaceTop = 0.15;
    
//    ChartYAxis *rightAxis = _chartView.rightAxis;
//    rightAxis.enabled = YES;// 右边轴默认是不显示 需要设置为YES
//    rightAxis.labelFont = [UIFont systemFontOfSize:10.f];
//    rightAxis.labelCount = 8;
//    rightAxis.valueFormatter = leftAxis.valueFormatter;
//    rightAxis.spaceTop = 0.15;
    
    [_chartView animateWithYAxisDuration:2];
}

#pragma mark - Setter or Getter

- (void)setRightYAxisEnalbe:(BOOL)rightYAxisEnalbe {
    _rightYAxisEnalbe = rightYAxisEnalbe;
    
    _chartView.rightAxis.enabled = _rightYAxisEnalbe;
}

- (void)setLegendEnable:(BOOL)legendEnable {
    _legendEnable = legendEnable;
    
    _chartView.legend.enabled = legendEnable;
}

- (void)setItem:(DLChartConfigureItem *)item {
    _item = item;
    
    [self setupVerticalBarChartViewDataWithItem:item];
}

- (void)setupVerticalBarChartViewDataWithItem:(DLChartConfigureItem *)item {
    
    NSAssert(item.names.count == item.values.count, @"names.count != values.count");
    if (item.values.count <= 0) return ;
    
    if (self.xAxisValueFormatterBlock) {
        self.xAxisValueFormatterBlock(_chartView.xAxis,1);
    }
    if (self.yAxisValueFormatterBlock) {
        self.yAxisValueFormatterBlock(_chartView.leftAxis);
    }
    
    NSMutableArray *yVals = [NSMutableArray arrayWithCapacity:item.names.count];
    
    for (int i = 0; i < item.names.count; i++)
    {
        [yVals addObject:[[BarChartDataEntry alloc] initWithX:i y:[item.values[i] floatValue]]];
    }
    
    BarChartDataSet *set1 = nil;
    if (_chartView.data.dataSetCount > 0)
    {
        set1 = (BarChartDataSet *)_chartView.data.dataSets[0];
        set1.values = yVals;
        [_chartView.data notifyDataChanged];
        [_chartView notifyDataSetChanged];
    }
    else
    {
        set1 = [[BarChartDataSet alloc] initWithValues:yVals label:item.title];
        //        [set1 setColors:ChartColorTemplates.material];
        set1.drawValuesEnabled = YES;// 是否数值显示在柱形图
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        
        BarChartData *data = [[BarChartData alloc] initWithDataSets:dataSets];
        data.barWidth = 0.9f;
        [data setValueFont:(self.yValueFont ? self.yValueFont : [UIFont systemFontOfSize:12])];
        [data setValueTextColor:(self.yValueColor ? self.yValueColor : [UIColor darkGrayColor])];
        _chartView.data = data;
    }
}



@end
