//
//  DLRadarChartView.h
//  Pods
//
//  Created by sml2 on 2017/6/26.
//
//


#import "DLChartBaseView.h"
@class RadarChartView;

@interface DLRadarChartView : DLChartBaseView

@property (nonatomic, strong) DLChartConfigureItem *item;

@property (nonatomic, strong,readonly) RadarChartView *chartView;

@property (nonatomic, strong) UIColor *areaLineColor;

@property (nonatomic, strong) UIColor *areaFillColor;

@property (nonatomic, strong) UIColor *netColor;

@end
