//
//  DLRadarChartView.m
//  Pods
//
//  Created by sml2 on 2017/6/26.
//
//

#import "DLRadarChartView.h"
#import "DLBaseChartItem.h"
#import <Charts/Charts-Swift.h>

@interface DLRadarChartView ()<IChartAxisValueFormatter>

@property (nonatomic, strong) RadarChartView *chartView;

@end
@implementation DLRadarChartView

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
    _chartView = [[RadarChartView alloc] init];
    _chartView.chartDescription.enabled = NO;
    _chartView.webLineWidth = 1.0;
    _chartView.innerWebLineWidth = 1.0;
    _chartView.webColor = UIColor.lightGrayColor;
    _chartView.innerWebColor = UIColor.lightGrayColor;
    _chartView.webAlpha = 1.0;
    [self addSubview:_chartView];
    
    ChartXAxis *xAxis = _chartView.xAxis;
    xAxis.labelFont = [UIFont systemFontOfSize:12];
    xAxis.xOffset = 0.0;
    xAxis.yOffset = 0.0;
    xAxis.valueFormatter = self;
    xAxis.labelTextColor = UIColor.darkGrayColor;
    
    ChartYAxis *yAxis = _chartView.yAxis;
    yAxis.labelFont = [UIFont systemFontOfSize:12];
    yAxis.labelCount = 5;
    yAxis.axisMinimum = 0.0;
    yAxis.axisMaximum = 80.0;
    yAxis.drawLabelsEnabled = NO;
    
    ChartLegend *l = _chartView.legend;
    l.horizontalAlignment = ChartLegendHorizontalAlignmentCenter;
    l.verticalAlignment = ChartLegendVerticalAlignmentTop;
    l.orientation = ChartLegendOrientationHorizontal;
    l.drawInside = NO;
    l.font = [UIFont systemFontOfSize:12];
    l.xEntrySpace = 7.0;
    l.yEntrySpace = 5.0;
    l.textColor = UIColor.darkGrayColor;
    
    [_chartView animateWithXAxisDuration:1.4 yAxisDuration:1.4 easingOption:ChartEasingOptionEaseOutBack];
}

- (void)setItem:(DLBaseChartItem *)item {
    _item = item;
    
    [self setupViewDataWithItem:_item];
}

- (void)setupViewDataWithItem:(DLBaseChartItem *)item {
    NSMutableArray *entries2 = [NSMutableArray arrayWithCapacity:item.values.count];
    
    for (int i = 0; i < item.values.count; i++)
    {
        [entries2 addObject:[[RadarChartDataEntry alloc] initWithValue:([item.values[i] floatValue])]];
    }
    
    RadarChartDataSet *set2 = [[RadarChartDataSet alloc] initWithValues:entries2 label:item.title];
    [set2 setColor:[UIColor colorWithRed:121/255.0 green:162/255.0 blue:175/255.0 alpha:1.0]];
    set2.fillColor = [UIColor colorWithRed:121/255.0 green:162/255.0 blue:175/255.0 alpha:1.0];
    set2.drawFilledEnabled = YES;
    set2.fillAlpha = 0.7;
    set2.lineWidth = 2.0;
    set2.drawHighlightCircleEnabled = YES;
    [set2 setDrawHighlightIndicators:NO];
    
    RadarChartData *data = [[RadarChartData alloc] initWithDataSets:@[set2]];
    [data setValueFont:[UIFont systemFontOfSize:12]];
    [data setDrawValues:YES];
    data.valueTextColor = UIColor.darkGrayColor;
    
    _chartView.data = data;
}

- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis {
    return _item.names[(int )(value)];
}

@end