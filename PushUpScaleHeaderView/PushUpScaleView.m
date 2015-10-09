//
//  PullDownView.m
//  TextCapital
//
//  Created by FrankLiu on 15/9/16.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import "PushUpScaleView.h"

#define  Width  [UIScreen mainScreen].bounds.size.width

@interface PushUpScaleView ()

/**
 *  缩放比例
 */
@property (nonatomic) float m_scale;

/**
 *  偏移量
 */
@property (nonatomic) float m_offset;

@end

@implementation PushUpScaleView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [self initWithFrame:frame scale:0.5 offset:200];
    
    return self;
    
}

- (instancetype)initWithFrame:(CGRect)frame scale:(float)scale offset:(float)offset {
    
    float width  = frame.size.width;
    float height = frame.size.height;
    
    /*
     根据缩放比例,调整 x 和 width
     由于调整锚点 (0.5,0.5) 为 (0.5,0) ,所以 y 为 -height/2 ,以实现根据此view最上面的线缩放悬停
     */
    self = [super initWithFrame:CGRectMake(-(width/scale-width)/2, -height/2, width/scale, height)];
    
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        self.m_scale  = scale;
        self.m_offset = offset;
        
        // 缩放方程
        self.m_equation = [OnceLinearEquation onceLinearEquationWithPointA:MATHPointMake(1, 0)
                                                                    PointB:MATHPointMake(scale, offset)];
        
        // 调整锚点
        self.layer.anchorPoint = CGPointMake(0.5, 0);
        
    }
    
    return self;
}

- (void)addScrollViewObserver {
    
    if (self.m_scrollView) {
        
        [self.m_scrollView addObserver:self
                            forKeyPath:@"contentOffset"
                               options:NSKeyValueObservingOptionNew
                               context:nil];
    }
}

- (void)removeScrollViewObserver {
    
    if (self.m_scrollView) {
        
        [self.m_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    CGPoint point = [change[@"new"] CGPointValue];
    
    
    CGFloat y = point.y;
    CGFloat x = [_m_equation xValueWhenYEqual:y];
    
    
    if (y >= _m_offset) {
        
        self.scale = _m_scale;
        
    } else if (y >= 0 && y < _m_offset){
        
        self.scale = x;
        
    } else {
        
        self.scale = 1;
    }
    
}

@end
