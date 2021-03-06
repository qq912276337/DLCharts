//
//  DLBaseChartsItem.h
//  DLChartView
//
//  Created by sml2 on 2017/6/23.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger,DLChartsItemType) {
    DLChartsItemTypePie = 1,
    DLChartsItemTypeLine,
    DLChartsItemTypeColumn,
};

typedef void(^DLChartItemXAxisValueFormatterBlock)(id xAxis);

@interface DLBaseChartItem : NSObject

@property (nonatomic, assign) NSString *title;

@property (nonatomic, assign) DLChartsItemType type;

@property (nonatomic, strong) NSArray<NSString *> *names;

@property (nonatomic, strong) NSArray<NSString *> *values;
// X轴映射回调
@property (nonatomic, copy) DLChartItemXAxisValueFormatterBlock xAxisValueFormatterBlock;


@end
