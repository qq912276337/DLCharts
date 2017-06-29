//
//  DLHorizontalBarChartView.h
//  Pods
//
//  Created by sml2 on 2017/6/26.
//
//

#import <UIKit/UIKit.h>
@class DLBaseChartItem,HorizontalBarChartView;

@interface DLHorizontalBarChartView : UIView

@property (nonatomic, strong) DLBaseChartItem *item;

@property (nonatomic, strong,readonly) HorizontalBarChartView *chartView;
/** 是否显示图例 默认显示 */
@property (nonatomic, assign) BOOL legendEnable;
/** 是否显示y右轴 默认显示 */
@property (nonatomic, assign) BOOL rightYAxisEnalbe;

@end
