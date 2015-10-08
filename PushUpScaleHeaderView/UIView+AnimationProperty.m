//
//  UIView+AnimationProperty.m
//  UIViewAncher
//
//  Created by YouXianMing on 15/9/15.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "UIView+AnimationProperty.h"
#import <objc/runtime.h>

@implementation UIView (AnimationProperty)

NSString * const _recognizerScale = @"_recognizerScale";
- (void)setScale:(CGFloat)scale {
    
    objc_setAssociatedObject(self, (__bridge const void *)(_recognizerScale), @(scale), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.transform = CGAffineTransformMakeScale(scale, scale);
}
- (CGFloat)scale {
    
    NSNumber *scaleValue = objc_getAssociatedObject(self, (__bridge const void *)(_recognizerScale));
    return scaleValue.floatValue;
}

@end
