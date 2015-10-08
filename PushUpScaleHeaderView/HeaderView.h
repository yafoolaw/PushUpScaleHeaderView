//
//  HJOHeaderView.h
//  TextCapital
//
//  Created by FrankLiu on 15/9/21.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PushUpScaleView.h"

@interface HeaderView : UIView

@property (nonatomic, strong)   PushUpScaleView  *m_pushUpScaleView;

/**
 *  初始化
 *
 *  @param frame  frame
 *  @param scale  缩放比例
 *  @param offset 在多大偏移量内缩放
 *  @param title  标题
 *
 *  @return 返回实例
 */
- (instancetype)initWithFrame:(CGRect)frame scale:(float)scale offset:(float)offset title:(NSString*)title;

/**
 *  更新描述
 *
 *  @param description 新的描述
 */
- (void)updateDescription:(NSString*)description;

@end
