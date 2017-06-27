//
//  DLChartViewController.m
//  DLCharts
//
//  Created by sml2 on 2017/6/27.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import "DLChartViewController.h"

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
    
    
    DLBaseChartItem *item = [[DLBaseChartItem alloc] init];
    item.title = @"chart";
    item.names = @[@"66",@"80",@"10",@"66",@"48"];
    item.values = item.names;
    
    if (_type == DLChartsItemTypePie) {
        DLPieChartView *pie = [[DLPieChartView alloc] init];
        pie.item = item;
        pie.frame = CGRectMake(0, 164, self.view.bounds.size.width,  self.view.bounds.size.width);
        [self.view addSubview:pie];
    } else if (_type == DLChartsItemTypeLine) {
        DLLineChartView *pie = [[DLLineChartView alloc] init];
        pie.item = item;
        pie.frame = CGRectMake(0, 164, self.view.bounds.size.width,  self.view.bounds.size.width);
        [self.view addSubview:pie];
    } else if (_type == DLChartsItemTypeColumnVertical) {
        DLVerticalBarChartView *verticalChart = [[DLVerticalBarChartView alloc] init];
        verticalChart.chartView.rightAxis.enabled = NO;
        verticalChart.item = item;
        verticalChart.frame = CGRectMake(0, 164, self.view.bounds.size.width,  self.view.bounds.size.width);
        [self.view addSubview:verticalChart];
    } else if (_type == DLChartsItemTypeColumnHorizonal) {
        DLHorizontalBarChartView *pie = [[DLHorizontalBarChartView alloc] init];
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
