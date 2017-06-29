//
//  DLHorizontalBarChartView.h
//  Pods
//
//  Created by sml2 on 2017/6/26.
//
//

#import <UIKit/UIKit.h>
@class DLChartConfigureItem,HorizontalBarChartView;

@interface DLHorizontalBarChartView : UIView

@property (nonatomic, strong) DLChartConfigureItem *item;

@property (nonatomic, strong,readonly) HorizontalBarChartView *chartView;
/** 是否显示图例 默认显示 */
@property (nonatomic, assign) BOOL legendEnable;
/** 是否显示y右轴 默认显示 */
@property (nonatomic, assign) BOOL rightYAxisEnalbe;

@end
