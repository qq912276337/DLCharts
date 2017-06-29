//
//  DLHorizontalBarChartView.m
//  Pods
//
//  Created by sml2 on 2017/6/26.
//
//

#import "DLHorizontalBarChartView.h"
#import <Charts/Charts-Swift.h>
#import "DLBaseChartItem.h"

@interface DLHorizontalBarChartView ()

@property (nonatomic, strong) HorizontalBarChartView *chartView;

@end
@implementation DLHorizontalBarChartView

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
    _chartView = [[HorizontalBarChartView alloc] init];
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
    xAxis.drawAxisLineEnabled = YES;
    xAxis.drawGridLinesEnabled = NO;
    xAxis.labelCount = _item.names.count;
    
    ChartYAxis *leftAxis = _chartView.leftAxis;
    leftAxis.labelFont = [UIFont systemFontOfSize:10.f];
    leftAxis.drawAxisLineEnabled = YES;
    leftAxis.drawGridLinesEnabled = YES;
//    leftAxis.axisMinimum = 0.0; // this replaces startAtZero = YES
    
    ChartYAxis *rightAxis = _chartView.rightAxis;
    rightAxis.enabled = NO;
    rightAxis.labelFont = [UIFont systemFontOfSize:10.f];
    rightAxis.drawAxisLineEnabled = YES;
    rightAxis.drawGridLinesEnabled = NO;
//    rightAxis.axisMinimum = 0.0; // this replaces startAtZero = YES
    
    ChartLegend *l = _chartView.legend;
    l.horizontalAlignment = ChartLegendHorizontalAlignmentLeft;
    l.verticalAlignment = ChartLegendVerticalAlignmentBottom;
    l.orientation = ChartLegendOrientationHorizontal;
    l.drawInside = NO;
    l.form = ChartLegendFormSquare;
    l.formSize = 8.0;
    l.font = [UIFont systemFontOfSize:11];
    l.xEntrySpace = 4.0;
    
    _chartView.descriptionText = @"";
    _chartView.drawBarShadowEnabled = NO;
    _chartView.drawValueAboveBarEnabled = YES;
    
    _chartView.maxVisibleCount = 60;
    _chartView.pinchZoomEnabled = YES;
    _chartView.drawGridBackgroundEnabled = NO;
    _chartView.doubleTapToZoomEnabled = YES;
    _chartView.legend.enabled = NO;
    
    _chartView.fitBars = YES;
    [_chartView animateWithYAxisDuration:2];
}

#pragma mark - Setter or Getter

- (void)setRightYAxisEnalbe:(BOOL)rightYAxisEnalbe {
    _rightYAxisEnalbe = rightYAxisEnalbe;
    
    _chartView.rightAxis.enabled = _rightYAxisEnalbe;
}

- (void)setLegendEnable:(BOOL)legendEnable {
    _legendEnable = legendEnable;
    
    _chartView.legend.enabled = _legendEnable;
}


- (void)setItem:(DLBaseChartItem *)item {
    _item = item;
    
    [self setupChartviewDatawithItem:_item];
}

- (void)setupChartviewDatawithItem:(DLBaseChartItem *)item {
    NSAssert(item.names.count == item.values.count, @"names.count != values.count");
    if (item.values.count <= 0) return ;
    
    if (_item.xAxisValueFormatterBlock) {
        _item.xAxisValueFormatterBlock(_chartView.xAxis);
    }
    
    NSMutableArray *yVals = [NSMutableArray arrayWithCapacity:item.values.count];
    CGFloat minY = 0.0; // 解决柱状y值不显示
    for (int i = 0; i < item.values.count; i++)
    {
        double y = [item.values[i] floatValue];
        [yVals addObject:[[BarChartDataEntry alloc] initWithX:i y:y]];
        if (y < minY) {
            minY = y;
        }
    }
    _chartView.leftAxis.axisMinimum = minY;
    _chartView.rightAxis.axisMinimum = minY;
    
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
        set1.drawValuesEnabled = YES;
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        
        BarChartData *data = [[BarChartData alloc] initWithDataSets:dataSets];
        [data setValueFont:(_item.valueFont ? _item.valueFont : [UIFont systemFontOfSize:12])];
        [data setValueTextColor:(_item.valueColor ? _item.valueColor : [UIColor blackColor])];
        data.barWidth = 0.9f;
        
        _chartView.data = data;
    }

}

@end
