//
//  DLVerticalBarChartView.m
//  DLChartView
//
//  Created by sml2 on 2017/6/23.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import "DLVerticalBarChartView.h"
#import "DLBaseChartItem.h"
#import <Charts/Charts-Swift.h>

@interface DLVerticalBarChartView ()<ChartViewDelegate>

@property (nonatomic, strong) BarChartView *verticalBarChartView;

@end
@implementation DLVerticalBarChartView

- (instancetype)initWithItem:(DLBaseChartItem *)item {
    if (self = [super init]) {
        _item = item;
        [self setupView];
    }
    return self;
}

- (void)setupView {
    _verticalBarChartView = [[BarChartView alloc] init];
    [self addSubview:_verticalBarChartView];
    
    _verticalBarChartView.chartDescription.enabled = NO;
    _verticalBarChartView.drawGridBackgroundEnabled = NO;
    _verticalBarChartView.dragEnabled = YES;
    [_verticalBarChartView setScaleEnabled:YES];
    _verticalBarChartView.pinchZoomEnabled = NO;
    _verticalBarChartView.rightAxis.enabled = NO;
    _verticalBarChartView.delegate = self;
    _verticalBarChartView.drawBarShadowEnabled = NO;
    _verticalBarChartView.drawValueAboveBarEnabled = YES;
    
    ChartXAxis *xAxis = _verticalBarChartView.xAxis;
    xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.labelFont = [UIFont systemFontOfSize:10.f];
    xAxis.drawGridLinesEnabled = NO;
    xAxis.granularity = 1.0; // only intervals of 1 day
    xAxis.labelCount = 7;
    if (_item.xAxisValueFormatterBlock) {
        _item.xAxisValueFormatterBlock(xAxis);
    }
    
    NSNumberFormatter *leftAxisFormatter = [[NSNumberFormatter alloc] init];
    leftAxisFormatter.minimumFractionDigits = 0;
    leftAxisFormatter.maximumFractionDigits = 1;
    
    ChartYAxis *leftAxis = _verticalBarChartView.leftAxis;
    leftAxis.labelFont = [UIFont systemFontOfSize:10.f];
    leftAxis.labelCount = 8;
    leftAxis.valueFormatter = [[ChartDefaultAxisValueFormatter alloc] initWithFormatter:leftAxisFormatter];
    leftAxis.labelPosition = YAxisLabelPositionOutsideChart;
    leftAxis.spaceTop = 0.15;
    
    [self setupVerticalBarChartViewDataWithItem:_item];
}

- (void)setItem:(DLBaseChartItem *)item {
    _item = item;
    
    [self setupVerticalBarChartViewDataWithItem:_item];
}

- (void)setupVerticalBarChartViewDataWithItem:(DLBaseChartItem *)item {
    
    NSAssert(item.names.count == item.values.count, @"names.count != values.count");
    if (item.values.count <= 0) return ;
    
    NSMutableArray *yVals = [NSMutableArray arrayWithCapacity:item.names.count];
    
    for (int i = 0; i < item.names.count; i++)
    {
        [yVals addObject:[[BarChartDataEntry alloc] initWithX:i y:[item.values[i] floatValue]]];
    }
    
    BarChartDataSet *set1 = nil;
    if (_verticalBarChartView.data.dataSetCount > 0)
    {
        set1 = (BarChartDataSet *)_verticalBarChartView.data.dataSets[0];
        set1.values = yVals;
        [_verticalBarChartView.data notifyDataChanged];
        [_verticalBarChartView notifyDataSetChanged];
    }
    else
    {
        set1 = [[BarChartDataSet alloc] initWithValues:yVals label:item.title];
        //        [set1 setColors:ChartColorTemplates.material];
        set1.drawValuesEnabled = YES;// 是否数值显示在柱形图
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        
        BarChartData *data = [[BarChartData alloc] initWithDataSets:dataSets];
        [data setValueFont:[UIFont systemFontOfSize:12]];
        
        data.barWidth = 0.9f;
        
        _verticalBarChartView.data = data;
    }
}

@end
