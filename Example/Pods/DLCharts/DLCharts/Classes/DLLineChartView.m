//
//  DLLineChartView.m
//  DLChartView
//
//  Created by sml2 on 2017/6/23.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import "DLLineChartView.h"
#import "DLBaseChartItem.h"
#import <Charts/Charts-Swift.h>

@interface DLLineChartView ()<ChartViewDelegate>

@property (nonatomic, strong) DLBaseChartItem *item;

@property (nonatomic, strong) LineChartView *lineChartView;

@end
@implementation DLLineChartView

- (instancetype)init{
    if (self = [super init]) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    _lineChartView = [[LineChartView alloc] init];
    [self addSubview:_lineChartView];
    
    _lineChartView.delegate = self;
    
    _lineChartView.chartDescription.enabled = NO;
    _lineChartView.dragEnabled = YES;
    [_lineChartView setScaleEnabled:YES];
    _lineChartView.pinchZoomEnabled = YES;
    _lineChartView.drawGridBackgroundEnabled = NO;
    _lineChartView.xAxis.gridLineDashLengths = @[@10.0, @10.0];
    _lineChartView.xAxis.gridLineDashPhase = 0.f;
    
    ChartYAxis *leftAxis = _lineChartView.leftAxis;
    leftAxis.gridLineDashLengths = @[@5.f, @5.f];
    leftAxis.drawZeroLineEnabled = NO;
    leftAxis.drawLimitLinesBehindDataEnabled = YES;
    leftAxis.axisMinimum = 0.0;
    
    ChartXAxis *xAxis = _lineChartView.xAxis;
    xAxis.granularityEnabled = YES;//设置重复的值不显示
    xAxis.labelPosition= XAxisLabelPositionBottom;//设置x轴数据在底部
    xAxis.gridColor = [UIColor clearColor];
    xAxis.labelTextColor = [UIColor blackColor];//文字颜色
    xAxis.axisLineColor = [UIColor grayColor];
    
    _lineChartView.rightAxis.enabled = NO;
    _lineChartView.legend.form = ChartLegendFormLine;
    [_lineChartView animateWithXAxisDuration:2.5];
}

- (void)setItem:(DLBaseChartItem *)item {
    _item = item;
    
    [self setupLineChartViewDataWithItem:_item];
}

- (void)setupLineChartViewDataWithItem:(DLBaseChartItem *)item
{
    NSAssert(item.names.count == item.values.count, @"names.count != values.count");
    if (item.values.count <= 0) return ;
    
    if (_item.xAxisValueFormatterBlock) {
        _item.xAxisValueFormatterBlock(_lineChartView.xAxis);
    }
    
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:item.names.count];
    for (int i = 0; i < item.names.count; i++)
    {
        [values addObject:[[ChartDataEntry alloc] initWithX:i y:[item.values[i] floatValue]]];
    }
    
    LineChartDataSet *set1 = nil;
    if (_lineChartView.data.dataSetCount > 0)
    {
        set1 = (LineChartDataSet *)_lineChartView.data.dataSets[0];
        set1.values = values;
        [_lineChartView.data notifyDataChanged];
        [_lineChartView notifyDataSetChanged];
    }
    else
    {
        set1 = [[LineChartDataSet alloc] initWithValues:values label:item.title];
        set1.lineDashLengths = @[@5.f, @2.5f];
        set1.highlightLineDashLengths = @[@5.f, @2.5f];
        [set1 setColor:UIColor.blackColor];
        [set1 setCircleColor:UIColor.blackColor];
        set1.lineWidth = 1.0;
        set1.circleRadius = 3.0;
        set1.drawCircleHoleEnabled = NO;
        set1.valueFont = [UIFont systemFontOfSize:9.f];
        set1.formLineDashLengths = @[@5.f, @2.5f];
        set1.formLineWidth = 1.0;
        set1.formSize = 15.0;
        
        NSArray *gradientColors = @[
                                    (id)[ChartColorTemplates colorFromString:@"#00ff0000"].CGColor,
                                    (id)[ChartColorTemplates colorFromString:@"#ffff0000"].CGColor
                                    ];
        CGGradientRef gradient = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
        
        set1.fillAlpha = 1.f;
        set1.fill = [ChartFill fillWithLinearGradient:gradient angle:90.f];
        set1.drawFilledEnabled = YES;
        
        CGGradientRelease(gradient);
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        
        _lineChartView.data = data;
    }
}

@end
