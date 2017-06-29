//
//  DLChartBaseView.h
//  Pods
//
//  Created by sml2 on 2017/6/29.
//
//

#import <UIKit/UIKit.h>
@class ChartXAxis,DLChartConfigureItem;

typedef void(^DLChartItemXAxisValueFormatterBlock)(ChartXAxis *xAxis,NSUInteger spaceBetweenX);

@interface DLChartBaseView : UIView

@property (nonatomic, strong) UIColor *xValueColor;

@property (nonatomic, strong) UIFont *xValueFont;

@property (nonatomic, strong) UIColor *yValueColor;

@property (nonatomic, strong) UIFont *yValueFont;
/**
 * X轴值映射回调
 * param xAxis ChartXAxis
 * param spaceBetweenX x间距
 */
@property (nonatomic, copy) DLChartItemXAxisValueFormatterBlock xAxisValueFormatterBlock;

@end
