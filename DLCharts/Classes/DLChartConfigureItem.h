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

@interface DLChartConfigureItem : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) DLChartsItemType type;

@property (nonatomic, strong) NSArray<NSString *> *names;

@property (nonatomic, strong) NSArray<NSString *> *values;


@end
