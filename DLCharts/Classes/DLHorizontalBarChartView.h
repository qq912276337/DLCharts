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

@end
