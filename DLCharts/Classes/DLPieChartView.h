//
//  DLPieChartsView.h
//  DLChartView
//
//  Created by sml2 on 2017/6/23.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DLChartConfigureItem,PieChartView;

@interface DLPieChartView : UIView

@property (nonatomic, strong) DLChartConfigureItem *item;

@property (nonatomic, strong,readonly) PieChartView *chartView;

/** 是否显示图例 默认显示 */
@property (nonatomic, assign) BOOL legendEnable;

@end
