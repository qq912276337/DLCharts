//
//  DLChartYValueFormatter.h
//  DLCharts
//
//  Created by sml2 on 2017/6/30.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Charts/Charts-Swift.h>

@interface DLChartYValueFormatter : NSObject<IChartAxisValueFormatter>

- (instancetype)initWithNames:(NSArray<NSString *> *)names;

@end
