//
//  DLLineChartView.m
//  DLChartView
//
//  Created by sml2 on 2017/6/23.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import "DLLineChartView.h"
#import "DLChartConfigureItem.h"
#import <Charts/Charts-Swift.h>

@interface DLLineChartView ()

@property (nonatomic, strong) LineChartView *chartView;

@end
@implementation DLLineChartView

- (instancetype)init{
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
    _chartView = [[LineChartView alloc] init];
    [self addSubview:_chartView];
    _chartView.chartDescription.enabled = NO;
    _chartView.dragEnabled = YES;
    [_chartView setScaleEnabled:YES];
    _chartView.pinchZoomEnabled = YES;
    _chartView.drawGridBackgroundEnabled = NO;
    _chartView.xAxis.gridLineDashLengths = @[@10.0, @10.0];
    _chartView.xAxis.gridLineDashPhase = 0.f;
    
    ChartYAxis *leftAxis = _chartView.leftAxis;
    leftAxis.gridLineDashLengths = @[@5.f, @5.f];
    leftAxis.drawZeroLineEnabled = NO;
    leftAxis.drawLimitLinesBehindDataEnabled = YES;
    leftAxis.axisMinimum = 0.0;
    
    ChartXAxis *xAxis = _chartView.xAxis;
    xAxis.granularityEnabled = YES;//设置重复的值不显示
    xAxis.labelPosition= XAxisLabelPositionBottom;//设置x轴数据在底部
    xAxis.gridColor = [UIColor clearColor];
    xAxis.labelTextColor = [UIColor blackColor];//文字颜色
    xAxis.axisLineColor = [UIColor grayColor];
    xAxis.granularity = self.spaceBetweenX;
    
    _chartView.rightAxis.enabled = NO;
    _chartView.legend.form = ChartLegendFormLine;
    [_chartView animateWithXAxisDuration:2];
}

//- (UIImage *)bundleImageWithName:(NSString *)imageName {
//    NSString *bundleClassPath = [[NSBundle bundleForClass:[self class]] bundlePath];
//    NSString *bundleName = [[bundleClassPath lastPathComponent] stringByDeletingPathExtension];
//    NSString *bundleDirectory = [bundleName stringByAppendingString:@".bundle"];
//    
//    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:imageName ofType:@"" inDirectory:bundleDirectory];
//    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
//    return image;
//}

#pragma mark - Setter and Getter

- (void)setLegendEnable:(BOOL)legendEnable {
    _legendEnable = legendEnable;
    
    _chartView.legend.enabled = legendEnable;
}


- (void)setXAxisLabelPosition:(DLLineChartViewXAxisLabelPosition)xAxisLabelPosition {
    _xAxisLabelPosition = xAxisLabelPosition;
    
    _chartView.xAxis.labelPosition = (int )_xAxisLabelPosition;
}

- (void)setItem:(DLChartConfigureItem *)item {
    _item = item;
    
    [self setupLineChartViewDataWithItem:self.item];
}

- (void)setupLineChartViewDataWithItem:(DLChartConfigureItem *)item
{
    NSAssert(item.names.count == item.values.count, @"names.count != values.count");
    if (item.values.count <= 0) return ;
    
    if (self.xAxisValueFormatterBlock) {
        self.xAxisValueFormatterBlock(_chartView.xAxis,1);
    }
    if (self.yAxisValueFormatterBlock) {
        self.yAxisValueFormatterBlock(_chartView.leftAxis);
    }
    
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:item.names.count];
    for (int i = 0; i < item.names.count; i++)
    {
        [values addObject:[[ChartDataEntry alloc] initWithX:i y:[item.values[i] floatValue]]];
    }
    
    LineChartDataSet *set1 = nil;
    if (_chartView.data.dataSetCount > 0)
    {
        set1 = (LineChartDataSet *)_chartView.data.dataSets[0];
        set1.values = values;
        [_chartView.data notifyDataChanged];
        [_chartView notifyDataSetChanged];
    }
    else
    {
        set1 = [[LineChartDataSet alloc] initWithValues:values label:item.title];
        set1.lineWidth = 1.0;
        set1.circleRadius = 3.0;
        set1.drawCircleHoleEnabled = NO;
        set1.valueFont = (self.yValueFont ? self.yValueFont : [UIFont systemFontOfSize:12.f]);
        //        set1.lineDashLengths = @[@5.f, @2.5f];
        //        set1.highlightLineDashLengths = @[@5.f, @2.5f];
        //        [set1 setColor:UIColor.blackColor];
        //        [set1 setCircleColor:UIColor.blackColor];
        //        set1.formLineDashLengths = @[@5.f, @2.5f];
        //        set1.formLineWidth = 1.0;
        //        set1.formSize = 15.0;
        
        //        NSArray *gradientColors = @[
        //                                    (id)[ChartColorTemplates colorFromString:@"#00ff0000"].CGColor,
        //                                    (id)[ChartColorTemplates colorFromString:@"#ffff0000"].CGColor
        //                                    ];
        //        CGGradientRef gradient = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
        //
        //        set1.fillAlpha = 1.f;
        //        set1.fill = [ChartFill fillWithLinearGradient:gradient angle:90.f];
        //        set1.drawFilledEnabled = YES;
        
        //        CGGradientRelease(gradient);
        
        if (_lineColor) {
            [set1 setColor:_lineColor];
            [set1 setCircleColor:_lineColor];
        }
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        [data setValueFont:(self.yValueFont ? self.yValueFont : [UIFont systemFontOfSize:12])];
        [data setValueTextColor:(self.yValueColor ? self.yValueColor : [UIColor blackColor])];
        _chartView.data = data;
    }
}

@end
