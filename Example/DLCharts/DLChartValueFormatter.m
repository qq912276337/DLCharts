//
//  DLChartValueFormatter.m
//  DLCharts
//
//  Created by sml2 on 2017/6/26.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import "DLChartValueFormatter.h"

@implementation DLChartValueFormatter

- (NSString * _Nonnull)stringForValue:(double)value axis:(ChartAxisBase * _Nullable)axis {
    return (_names[(int )value]);
}

@end
