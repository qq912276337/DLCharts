//
//  DLLineChartView.h
//  DLChartView
//
//  Created by sml2 on 2017/6/23.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DLBaseChartItem,LineChartView;

@interface DLLineChartView : UIView

@property (nonatomic, strong) DLBaseChartItem *item;

@property (nonatomic, strong,readonly) LineChartView *lineChartView;

@end
