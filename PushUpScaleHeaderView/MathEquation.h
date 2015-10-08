//
//  MathEquation.h
//  KLineView
//
//  Created by YouXianMing on 15/7/23.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  定义数学坐标点 x, y
 */
struct MATHPoint {
    
    CGFloat x;
    CGFloat y;
};
typedef struct MATHPoint MATHPoint;

/**
 *  生成数学坐标点 x, y
 *
 *  @param x
 *  @param y
 *
 *  @return 生成的坐标点
 */
static inline MATHPoint MATHPointMake(CGFloat x, CGFloat y) {
    MATHPoint p; p.x = x; p.y = y; return p;
}
