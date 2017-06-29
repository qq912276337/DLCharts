//
//  DLRadarChartView.h
//  Pods
//
//  Created by sml2 on 2017/6/26.
//
//

#import <UIKit/UIKit.h>
@class DLBaseChartItem,RadarChartView;

@interface DLRadarChartView : UIView

@property (nonatomic, strong) DLBaseChartItem *item;

@property (nonatomic, strong,readonly) RadarChartView *chartView;

@property (nonatomic, strong) UIColor *areaLineColor;

@property (nonatomic, strong) UIColor *areaFillColor;

@property (nonatomic, strong) UIColor *netColor;

@end
