# FDPieChart
A pie chart in iOS

# Introduction

FDPieChart is a single pie chart view, it achieves by UIBezierPath and supports the deal of clicking in the every pie area. It also supports transfer the ratio data and shows with the percent text.   

## ScreenShot

![pieChart](http://7xiamc.com1.z0.glb.clouddn.com/pieChart.png)

# Get started

1. Download the source file in the folder FDPieChart.
2. Add the source files to your project.
3. Import the FDPieChart.h file where you want to use it.

# Usage

## FDPieChart

```Objective-C
    FDPieChart *pieChart = [[FDPieChart alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    pieChart.backgroundColor = [UIColor whiteColor];
    pieChart.data = @[@{@"text" : @"大学生", @"rate" : @0.4, @"color" : [UIColor orangeColor]},
                    @{@"text" : @"高中生", @"rate" : @0.3, @"color" : [UIColor purpleColor]},
                    @{@"text" : @"初中生", @"rate" : @0.2, @"color" : [UIColor cyanColor]},
                    @{@"text" : @"小学生", @"rate" : @0.1, @"color" : [UIColor brownColor]}];
    [self.view addSubview:pieChart];
    pieChart.center = self.view.center;
```

#License
  MIT
