//
//  OnceLinearEquation.m
//  KLineView
//
//  Created by YouXianMing on 15/7/23.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "OnceLinearEquation.h"

@implementation OnceLinearEquation

+ (instancetype)onceLinearEquationWithPointA:(MATHPoint)pointA PointB:(MATHPoint)pointB {

    OnceLinearEquation *equation = [[[self class] alloc] init];
    
    CGFloat x1 = pointA.x; CGFloat y1 = pointA.y;
    CGFloat x2 = pointB.x; CGFloat y2 = pointB.y;
    
    equation.k = calculateSlope(x1, y1, x2, y2);
    equation.b = calculateConstant(x1, y1, x2, y2);
    
    return equation;
}

- (void)equationWithPointA:(MATHPoint)pointA PointB:(MATHPoint)pointB {

    CGFloat x1 = pointA.x; CGFloat y1 = pointA.y;
    CGFloat x2 = pointB.x; CGFloat y2 = pointB.y;
    
    self.k = calculateSlope(x1, y1, x2, y2);
    self.b = calculateConstant(x1, y1, x2, y2);
}

- (CGFloat)xValueWhenYEqual:(CGFloat)yValue {

    return (yValue - _b) / _k;
}

- (CGFloat)yValueWhenXEqual:(CGFloat)xValue {

    return _k * xValue + _b;
}

#pragma mark - 计算斜率 k
CGFloat calculateSlope(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2)
{
    return (y2 - y1) / (x2 - x1);
}

#pragma mark - 计算常数 b
CGFloat calculateConstant(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2)
{
    return (y1*(x2 - x1) - x1*(y2 - y1)) / (x2 - x1);
}

@end
