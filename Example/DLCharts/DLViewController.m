//
//  DLViewController.m
//  DLCharts
//
//  Created by qq912276337 on 06/23/2017.
//  Copyright (c) 2017 qq912276337. All rights reserved.
//

#import "DLViewController.h"
#import <DLCharts/DLChartsHeader.h>
#import "DLChartViewController.h"
#import "DLChartValueFormatter.h"

static NSString *const kCellID = @"DLViewController";


@interface DLViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *items;


@end

@implementation DLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;


//    DLBaseChartItem *item = [[DLBaseChartItem alloc] init];
//    item.title = @"pie";
//    item.names = @[@"66",@"80",@"10",@"66",@"48"];
//    item.values = item.names;
//    item.type = DLChartsItemTypeColumn;
    
//    __weak typeof(item) weakItem = item;
//    item.xAxisValueFormatterBlock = ^(ChartXAxis *xAxis) {
//        DLChartValueFormatter *format = [[DLChartValueFormatter alloc] init];
//        format.names = weakItem.names;
//        xAxis.valueFormatter = format;
//
//    };
    
    
//    DLPieChartView *pie = [[DLPieChartView alloc] init];
//    pie.item = pieItem;
//    pie.frame = CGRectMake(100, 100, 200, 200);
//    [self.view addSubview:pie];

//    DLVerticalBarChartView *verticalChart = [[DLVerticalBarChartView alloc] init];
//    verticalChart.verticalBarChartView.rightAxis.enabled = NO;
//    verticalChart.item = pieItem;
////    verticalChart.item = pieItem;
//    verticalChart.frame = CGRectMake(100,400, 200, 200);
//    [self.view addSubview:verticalChart];
    
//    DLHorizontalBarChartView *hori = [DLHorizontalBarChartView new];
//    hori.item = item;
//    hori.frame = CGRectMake(100,400, 200, 200);
//    [self.view addSubview:hori];
//    
//    DLVerticalBarChartView *ver = [DLVerticalBarChartView new];
//    ver.item = item;
//    ver.frame = CGRectMake(100,100, 200, 200);
//    [self.view addSubview:ver];
    
//    DLRadarChartView *radar = [[DLRadarChartView alloc] init];
//    radar.item = item;
//    radar.frame = self.view.bounds;
//    [self.view addSubview:radar];
}

#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    NSDictionary *item = self.items[indexPath.row];
    NSString *name = [[item allKeys] firstObject];
    cell.textLabel.text = name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *item = self.items[indexPath.row];
    DLChartsItemType type = [[[item allValues] firstObject] integerValue];
    DLChartViewController *vc = [[DLChartViewController alloc] initWithType:type];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Setter and Getter

- (NSArray *)items {
    if (!_items) {
        _items = @[@{@"饼图":@(DLChartsItemTypePie)},@{@"线性":@(DLChartsItemTypeLine)},@{@"柱状":@(DLChartsItemTypeColumnVertical)},@{@"水平柱状":@(DLChartsItemTypeColumnHorizonal)},@{@"雷达":@(DLChartsItemTypeRadar)}];
    }
    return _items;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellID];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
