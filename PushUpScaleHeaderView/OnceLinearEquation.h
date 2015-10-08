//
//  OnceLinearEquation.h
//  KLineView
//
//  Created by YouXianMing on 15/7/23.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MathEquation.h"

@interface OnceLinearEquation : NSObject

/*---- 计算一元一次方程 ----
 
 y = kX + b
 
 ------------------------*/
@property (nonatomic) CGFloat  k;
@property (nonatomic) CGFloat  b;

/**
 *  根据A点B点计算一元一次方程
 *
 *  @param pointA
 *  @param pointB
 */
- (void)equationWithPointA:(MATHPoint)pointA PointB:(MATHPoint)pointB;

/**
 *  根据Y的值获取X的值
 *
 *  @param yValue Y值
 *
 *  @return X值
 */
- (CGFloat)xValueWhenYEqual:(CGFloat)yValue;

/**
 *  根据X的值获取Y的值
 *
 *  @param xValue X值
 *
 *  @return Y值
 */
- (CGFloat)yValueWhenXEqual:(CGFloat)xValue;

#pragma mark - 初始化方法
/**
 *  根据A点B点计算一元一次方程
 *
 *  @param pointA
 *  @param pointB
 *
 *  @return 计算好的对象
 */
+ (instancetype)onceLinearEquationWithPointA:(MATHPoint)pointA PointB:(MATHPoint)pointB;

@end
