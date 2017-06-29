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
    DLChartsItemTypeColumnVertical,
    DLChartsItemTypeColumnHorizonal,
    DLChartsItemTypeRadar
};

typedef void(^DLChartItemXAxisValueFormatterBlock)(id xAxis);

@interface DLChartConfigureItem : NSObject

@property (nonatomic, assign) NSString *title;

@property (nonatomic, assign) DLChartsItemType type;

@property (nonatomic, strong) NSArray<NSString *> *names;

@property (nonatomic, strong) NSArray<NSString *> *values;

@property (nonatomic, strong) UIColor *valueColor;

@property (nonatomic, strong) UIFont *valueFont;
// X轴映射回调
@property (nonatomic, copy) DLChartItemXAxisValueFormatterBlock xAxisValueFormatterBlock;


@end
