//
//  DLChartViewController.m
//  DLCharts
//
//  Created by sml2 on 2017/6/27.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import "DLChartViewController.h"
#import "DLChartValueFormatter.h"

@interface DLChartViewController ()

@property (nonatomic, assign) DLChartsItemType type;

@end

@implementation DLChartViewController

- (instancetype)initWithType:(DLChartsItemType )type {
    if (self = [super init]) {
        
        _type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    DLChartConfigureItem *item = [[DLChartConfigureItem alloc] init];
    item.title = @"chart";
    item.names = @[@"qqqqqqa",@"qqqqb",@"10",@"80",@"10",@"80"];
    item.values = @[@"10",@"80",@"10",@"80",@"10",@"80"];
    
    __weak typeof(item) weakItem = item;
//    item.xAxisValueFormatterBlock = ^(ChartXAxis *xAxis) {
//        DLChartValueFormatter *format = [[DLChartValueFormatter alloc] init];
//        format.names = weakItem.names;
//        xAxis.valueFormatter = format;
//    };
    
    if (_type == DLChartsItemTypePie) {
        DLPieChartView *pie = [[DLPieChartView alloc] init];
        pie.item = item;
        pie.frame = CGRectMake(0, 164, self.view.bounds.size.width,  self.view.bounds.size.width);
        [self.view addSubview:pie];
    } else if (_type == DLChartsItemTypeLine) {
        DLLineChartView *line = [[DLLineChartView alloc] init];
        line.lineColor = [UIColor blueColor];
        line.xAxisLabelPosition = DLLineChartViewXAxisLabelPositionBottom;
        line.legendEnable = NO;
        line.item = item;
        
        line.frame = CGRectMake(0, 164, self.view.bounds.size.width,  self.view.bounds.size.width);
        [self.view addSubview:line];
    } else if (_type == DLChartsItemTypeColumnVertical) {
        DLVerticalBarChartView *verticalChart = [[DLVerticalBarChartView alloc] init];
        verticalChart.rightYAxisEnalbe = NO;
        verticalChart.item = item;
        verticalChart.frame = CGRectMake(0, 164, self.view.bounds.size.width,  self.view.bounds.size.width);
        [self.view addSubview:verticalChart];
    } else if (_type == DLChartsItemTypeColumnHorizonal) {
        DLHorizontalBarChartView *pie = [[DLHorizontalBarChartView alloc] init];
        pie.legendEnable = NO;
        pie.rightYAxisEnalbe = NO;
        pie.xAxisValueFormatterBlock = ^(ChartXAxis *xAxis, NSUInteger spaceBetweenX) {
            DLChartValueFormatter *format = [[DLChartValueFormatter alloc] init];
            format.names = weakItem.names;
            format.spaceForX = spaceBetweenX;
            xAxis.valueFormatter = format;
        };
        pie.item = item;
        pie.frame = CGRectMake(0, 164, self.view.bounds.size.width,  self.view.bounds.size.width);
        [self.view addSubview:pie];
    } else if (_type == DLChartsItemTypeRadar) {
        DLRadarChartView *pie = [[DLRadarChartView alloc] init];
        pie.item = item;
        pie.frame = CGRectMake(0, 164, self.view.bounds.size.width,  self.view.bounds.size.width);
        [self.view addSubview:pie];
    }
}



@end
