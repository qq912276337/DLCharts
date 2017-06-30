//
//  DLChartYValueFormatter.m
//  DLCharts
//
//  Created by sml2 on 2017/6/30.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import "DLChartYValueFormatter.h"

@interface DLChartYValueFormatter ()

@property (nonatomic, strong) NSArray<NSString *> *names;

@end
@implementation DLChartYValueFormatter


- (instancetype)initWithNames:(NSArray<NSString *> *)names {
    if (self = [super init]) {
        _names = names;
    }
    return self;
}

- (NSString * _Nonnull)stringForValue:(double)value axis:(ChartAxisBase * _Nullable)axis {
    return ([NSString stringWithFormat:@"%@W",@(value)]);
}

@end
