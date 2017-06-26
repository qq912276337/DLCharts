//
//  DLViewController.m
//  DLCharts
//
//  Created by qq912276337 on 06/23/2017.
//  Copyright (c) 2017 qq912276337. All rights reserved.
//

#import "DLViewController.h"
#import <DLCharts/DLChartsHeader.h>

@interface DLViewController ()

@end

@implementation DLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    DLBaseChartItem *pieItem = [[DLBaseChartItem alloc] init];
    pieItem.title = @"pie";
    pieItem.names = @[@"88",@"88"];
    pieItem.values = @[@"88",@"88"];
    pieItem.type = DLChartsItemTypeColumn;
    
//    DLPieChartView *pie = [[DLPieChartView alloc] init];
//    pie.item = pieItem;
//    pie.frame = CGRectMake(100, 100, 200, 200);
//    [self.view addSubview:pie];

    DLVerticalBarChartView *verticalChart = [[DLVerticalBarChartView alloc] init];
    verticalChart.verticalBarChartView.rightAxis.enabled = NO;
    verticalChart.item = pieItem;
//    verticalChart.item = pieItem;
    verticalChart.frame = CGRectMake(100,400, 200, 200);
    [self.view addSubview:verticalChart];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
