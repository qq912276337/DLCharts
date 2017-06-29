//
//  DLHorizontalBarChartView.h
//  Pods
//
//  Created by sml2 on 2017/6/26.
//
//

#import "DLChartBaseView.h"
@class HorizontalBarChartView;

@interface DLHorizontalBarChartView : DLChartBaseView

@property (nonatomic, strong) DLChartConfigureItem *item;

@property (nonatomic, strong,readonly) HorizontalBarChartView *chartView;

@property (nonatomic, assign) NSUInteger spaceBetweenX;
/** 是否显示y右轴 默认显示 */
@property (nonatomic, assign) BOOL rightYAxisEnalbe;
/** 是否显示图例 默认显示 */
@property (nonatomic, assign) BOOL legendEnable;

@end
