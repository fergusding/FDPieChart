//
//  FDSectorGraph.m
//  FDSectorGraphDemo
//
//  Created by fergusding on 15/7/6.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import "FDPieChart.h"

static CGFloat angle = - M_PI_2;

@implementation FDPieChart {
    NSMutableArray *paths;
}

- (void)drawRect:(CGRect)rect {
    if (!paths) {
        paths = [NSMutableArray array];
    }
    
    for (id d in _data) {
        CGFloat rate = [d[@"rate"] floatValue];
        UIColor *color = d[@"color"];
        [self addSectorWithRate:rate fillColor:color];
    }
}

- (void)addSectorWithRate:(CGFloat)rate fillColor:(UIColor *)color {
    CGPoint point = CGPointMake(CGRectGetWidth(self.frame) * 0.5, CGRectGetHeight(self.frame) * 0.5);

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point];
    [path addArcWithCenter:point radius:point.x startAngle:angle endAngle:angle + rate * M_PI * 2 clockwise:1];
    [color setFill];
    [path fill];
    [[UIColor whiteColor] setStroke];
    [path stroke];
    
    [self addPercentText:rate InPath:path];
    
    // 修改startAngle
    angle += rate * M_PI * 2;
    [paths addObject:path];
}

// 使用CGAPI画扇形图的方法, 不支持扇形点击事件
- (void)addSectorWithRate:(CGFloat)rate fillColor:(UIColor *)color inContext:(CGContextRef)context {
    CGPoint point = CGPointMake(CGRectGetWidth(self.frame) * 0.5, CGRectGetHeight(self.frame) * 0.5);
    
    // 保存当前会话，入栈
    CGContextSaveGState(context);
    CGContextBeginPath(context);
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    // 画扇形区域必须移动到原点
    CGContextMoveToPoint(context, point.x, point.y);
    CGContextAddArc(context, point.x, point.y, CGRectGetWidth(self.frame) * 0.5, angle, angle + rate * M_PI * 2, 0);
    CGContextFillPath(context);
    
    // 恢复到之前的状态，出栈
    CGContextRestoreGState(context);
    angle += rate * M_PI * 2;
}

// 添加百分比文本信息到对应的扇区
- (void)addPercentText:(CGFloat)rate InPath:(UIBezierPath *)path {
    // objective-c 中转化%需要使用"%%"
    NSString *text = [NSString stringWithFormat:@"%g%%", rate * 100];
    CGPoint point = CGPointMake(path.bounds.origin.x + path.bounds.size.width * 0.5, path.bounds.origin.y + path.bounds.size.height * 0.5);
    [text drawAtPoint:point withAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:15]}];
}

// 处理扇形区域的点击事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    for (UIBezierPath *path in paths) {
        CGPathRef pathRef = path.CGPath;
        bool b = CGPathContainsPoint(pathRef, NULL, point, 0);
        if (b) {
            NSLog(@"%@", _data[[paths indexOfObject:path]][@"text"]);
            break;
        }
    }
}

@end
