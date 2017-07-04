//
//  DLChartBaseView.h
//  Pods
//
//  Created by sml2 on 2017/6/29.
//
//

#import <UIKit/UIKit.h>
@class ChartXAxis,ChartYAxis,DLChartConfigureItem;

typedef void(^DLChartItemXAxisValueFormatterBlock)(ChartXAxis *xAxis,NSUInteger spaceBetweenX);

typedef void(^DLChartItemYAxisValueFormatterBlock)(ChartYAxis *yAxis1,ChartYAxis *yAxis2);

@interface DLChartBaseView : UIView

@property (nonatomic, strong) UIColor *xValueColor;

@property (nonatomic, strong) UIFont *xValueFont;

@property (nonatomic, strong) UIColor *yValueColor;

@property (nonatomic, strong) UIFont *yValueFont;

@property (nonatomic, assign) NSUInteger spaceBetweenX;

@property (nonatomic, assign) NSUInteger spaceBetweenY;

/**
 * X轴值映射回调
 * param xAxis ChartXAxis
 * param spaceBetweenX x间距
 */
@property (nonatomic, copy) DLChartItemXAxisValueFormatterBlock xAxisValueFormatterBlock;

/**
 * Y轴值映射回调
 * param yAxis ChartYAxis
 * param spaceBetweenY y间距
 */
@property (nonatomic, copy) DLChartItemYAxisValueFormatterBlock yAxisValueFormatterBlock;

@end
