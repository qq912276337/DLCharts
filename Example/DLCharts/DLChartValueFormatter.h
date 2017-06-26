//
//  DLChartValueFormatter.h
//  DLCharts
//
//  Created by sml2 on 2017/6/26.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Charts/Charts-Swift.h>

@interface DLChartValueFormatter : NSObject<IChartAxisValueFormatter>

@property (nonatomic, strong) NSArray<NSString *> *names;

@end
