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
    
    
    DLPieChartView *pie = [[DLPieChartView alloc] init];
    pie.item = nil;
    pie.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:pie];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
