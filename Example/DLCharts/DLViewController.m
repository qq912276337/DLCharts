//
//  DLViewController.m
//  DLCharts
//
//  Created by qq912276337 on 06/23/2017.
//  Copyright (c) 2017 qq912276337. All rights reserved.
//

#import "DLViewController.h"
#import <DLCharts/DLChartsHeader.h>
#import "DLChartValueFormatter.h"

@interface DLViewController ()

@end

@implementation DLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    DLBaseChartItem *item = [[DLBaseChartItem alloc] init];
    item.title = @"pie";
    item.names = @[@"66",@"8",@"1"];
    item.values = @[@"2",@"88",@"11"];
    item.type = DLChartsItemTypeColumn;
    
//    __weak typeof(item) weakItem = item;
//    item.xAxisValueFormatterBlock = ^(ChartXAxis *xAxis) {
//        DLChartValueFormatter *format = [[DLChartValueFormatter alloc] init];
//        format.names = weakItem.names;
//        xAxis.valueFormatter = format;
//
//    };
    
    
//    DLPieChartView *pie = [[DLPieChartView alloc] init];
//    pie.item = pieItem;
//    pie.frame = CGRectMake(100, 100, 200, 200);
//    [self.view addSubview:pie];

//    DLVerticalBarChartView *verticalChart = [[DLVerticalBarChartView alloc] init];
//    verticalChart.verticalBarChartView.rightAxis.enabled = NO;
//    verticalChart.item = pieItem;
////    verticalChart.item = pieItem;
//    verticalChart.frame = CGRectMake(100,400, 200, 200);
//    [self.view addSubview:verticalChart];
    
    DLHorizontalBarChartView *hori = [DLHorizontalBarChartView new];
    hori.item = item;
    hori.frame = CGRectMake(100,400, 200, 200);
    [self.view addSubview:hori];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
