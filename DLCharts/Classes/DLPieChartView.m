//
//  DLPieChartsView.m
//  DLChartView
//
//  Created by sml2 on 2017/6/23.
//  Copyright © 2017年 qq912276337. All rights reserved.
//

#import "DLPieChartView.h"
#import <Charts/Charts-Swift.h>
#import "DLChartConfigureItem.h"

@interface DLPieChartView ()

@property (nonatomic, strong) PieChartView *chartView;

@end
@implementation DLPieChartView

- (instancetype)init {
    if (self = [super init]) {
        [self setupView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _chartView.frame = self.bounds;
}

- (void)setupView {
    //创建饼状图
    _chartView = [[PieChartView alloc] init];
    [self addSubview:_chartView];
    
    //基本样式
    [_chartView setExtraOffsetsWithLeft:30 top:0 right:30 bottom:0];//饼状图距离边缘的间隙
    _chartView.usePercentValuesEnabled = YES;//是否根据所提供的数据, 将显示数据转换为百分比格式
    _chartView.dragDecelerationEnabled = YES;//拖拽饼状图后是否有惯性效果
    _chartView.drawSliceTextEnabled = YES;//是否显示区块文本
    //空心饼状图样式
    _chartView.drawHoleEnabled = YES;//饼状图是否是空心
    _chartView.holeRadiusPercent = 0.5;//空心半径占比
    _chartView.holeColor = [UIColor clearColor];//空心颜色
    _chartView.transparentCircleRadiusPercent = 0.52;//半透明空心半径占比
    _chartView.transparentCircleColor = [UIColor colorWithRed:210/255.0 green:145/255.0 blue:165/255.0 alpha:0.3];//半透明空心的颜色
    _chartView.drawCenterTextEnabled = NO;//是否显示中间文字

    _chartView.descriptionFont = [UIFont systemFontOfSize:10];
    _chartView.descriptionTextColor = [UIColor blackColor];
    _chartView.descriptionTextAlign = NSTextAlignmentCenter;
    
    //饼状图图例
    _chartView.legend.maxSizePercent = 5;//图例在饼状图中的大小占比, 这会影响图例的宽高
    _chartView.legend.formToTextSpace = 5;//文本间隔
    _chartView.legend.font = [UIFont systemFontOfSize:14];//字体大小
    _chartView.legend.textColor = [UIColor grayColor];//字体颜色
    _chartView.legend.position = ChartLegendPositionBelowChartCenter;//图例在饼状图中的位置
    _chartView.legend.form = ChartLegendFormCircle;//图示样式: 方形、线条、圆形
    _chartView.legend.formSize = 16;//图示大小
    _chartView.legend.yOffset = 8;//图示大小
    //设置动画效果
    [_chartView animateWithXAxisDuration:1.0f easingOption:ChartEasingOptionEaseOutExpo];
}

- (void)setLegendEnable:(BOOL)legendEnable {
    _legendEnable = legendEnable;
    
    _chartView.legend.enabled = legendEnable;
}

- (void)setItem:(DLChartConfigureItem *)item {
    _item = item;
    
    [self setupPieChartViewDataWithItem:item];
}

- (void )setupPieChartViewDataWithItem:(DLChartConfigureItem *)item{
    NSAssert(item.names.count == item.values.count, @"names.count != values.count");
    if (item.values.count <= 0) return;
    
    //饼状图描述
    _chartView.descriptionText = self.item.title;
    
    //每个区块的数据
    NSMutableArray *yVals = [NSMutableArray arrayWithCapacity:item.values.count];
    for (int i = 0; i < item.names.count; i++) {
        
        PieChartDataEntry *entry = [[PieChartDataEntry alloc] initWithValue:[item.values[i] floatValue] label:item.names[i]];
        [yVals addObject:entry];
    }
    //dataSet
    PieChartDataSet *dataSet = [[PieChartDataSet alloc] initWithValues:yVals label:@""];
    dataSet.drawValuesEnabled = YES;//是否绘制显示数据
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    [colors addObjectsFromArray:ChartColorTemplates.vordiplom];
    [colors addObjectsFromArray:ChartColorTemplates.joyful];
    [colors addObjectsFromArray:ChartColorTemplates.colorful];
    [colors addObjectsFromArray:ChartColorTemplates.liberty];
    [colors addObjectsFromArray:ChartColorTemplates.pastel];
    [colors addObject:[UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f]];
    dataSet.colors = colors;//区块颜色
    dataSet.sliceSpace = 1;//相邻区块之间的间距
    dataSet.selectionShift = 8;//选中区块时, 放大的半径
    dataSet.xValuePosition = PieChartValuePositionInsideSlice;//名称位置
    dataSet.yValuePosition = PieChartValuePositionOutsideSlice;//数据位置
    //数据与区块之间的用于指示的折线样式
    dataSet.valueLinePart1OffsetPercentage = 0.85;//折线中第一段起始位置相对于区块的偏移量, 数值越大, 折线距离区块越远
    dataSet.valueLinePart1Length = 0.5;//折线中第一段长度占比
    dataSet.valueLinePart2Length = 0.4;//折线中第二段长度最大占比
    dataSet.valueLineWidth = 1;//折线的粗细
    dataSet.valueLineColor = (self.yValueColor ? self.yValueColor : [UIColor brownColor]);//折线颜色
    
    //data
    PieChartData *data = [[PieChartData alloc] initWithDataSet:dataSet];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterPercentStyle;
    formatter.maximumFractionDigits = 0;//小数位数
    formatter.multiplier = @1.f;
    [data setValueFormatter:[[ChartDefaultValueFormatter alloc] initWithFormatter:formatter]];//设置显示数据格式
    [data setValueFont:(self.yValueFont ? self.yValueFont : [UIFont systemFontOfSize:12])];
    [data setValueTextColor:(self.yValueColor ? self.yValueColor : [UIColor brownColor])];
    _chartView.data = data;
}



@end
