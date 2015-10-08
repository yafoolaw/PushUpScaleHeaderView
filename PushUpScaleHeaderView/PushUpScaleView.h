//
//  PullDownView.h
//  TextCapital
//
//  Created by FrankLiu on 15/9/16.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OnceLinearEquation.h"
#import "UIView+AnimationProperty.h"

@interface PushUpScaleView : UIView

/**
 *  用于监听的scrollView
 */
@property (nonatomic, weak)      UIScrollView        *m_scrollView;

/**
 *  缩放比例, 只读
 */
@property (nonatomic, readonly)  float                m_scale;

/**
 *  偏移量, 只读
 */
@property (nonatomic, readonly)  float                m_offset;

/**
 *  一次线性方程
 */
@property (nonatomic, strong)    OnceLinearEquation   *m_equation;

- (void)addScrollViewObserver;
- (void)removeScrollViewObserver;

/**
 *  初始化
 *
 *  @param frame  frame
 *  @param scale  缩放比例
 *  @param offset 在多大偏移量内缩放
 *
 *  @return 返回实例
 */
- (instancetype)initWithFrame:(CGRect)frame scale:(float)scale offset:(float)offset;

@end
