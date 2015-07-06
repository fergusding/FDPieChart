//
//  ViewController.m
//  FDPieChartDemo
//
//  Created by fergusding on 15/7/6.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import "ViewController.h"
#import "FDPieChart.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FDPieChart *pieChart = [[FDPieChart alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    pieChart.backgroundColor = [UIColor whiteColor];
    pieChart.data = @[@{@"text" : @"大学生", @"rate" : @0.4, @"color" : [UIColor orangeColor]},
                    @{@"text" : @"高中生", @"rate" : @0.3, @"color" : [UIColor purpleColor]},
                    @{@"text" : @"初中生", @"rate" : @0.2, @"color" : [UIColor cyanColor]},
                    @{@"text" : @"小学生", @"rate" : @0.1, @"color" : [UIColor brownColor]}];
    [self.view addSubview:pieChart];
    pieChart.center = self.view.center;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
