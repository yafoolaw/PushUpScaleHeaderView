//
//  HJOHeaderView.m
//  TextCapital
//
//  Created by FrankLiu on 15/9/21.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import "HeaderView.h"

#define  Width                             [UIScreen mainScreen].bounds.size.width

@interface HeaderView ()
{
    float     _m_scale;
    float     _m_offset;
    NSString *_m_titleStr;
}

@property (nonatomic, strong) UILabel  *m_descriptionLabel;

@end

@implementation HeaderView
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [self initWithFrame:frame scale:0.5 offset:200 title:@"这里需要一个标题"];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame scale:(float)scale offset:(float)offset title:(NSString *)title {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _m_scale    = scale;
        _m_offset   = offset;
        _m_titleStr = title;
        
        // 非常重要,由于push up scale view 尺寸变大了,在导航栏POP时,会有很长的残影
        // 这也是为什么要把push up scale view 再次放在一个view上,而不直接继承的原因
        self.clipsToBounds = YES;
        
        [self buildSubViews];
        
    }
    
    return self;
}

- (void)buildSubViews {
    
    // 添加上推缩放试图
    self.m_pushUpScaleView = [[PushUpScaleView alloc]initWithFrame:self.frame scale:_m_scale offset:_m_offset];
    [self addSubview:_m_pushUpScaleView];
    
    _m_pushUpScaleView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9];
    
    [self buildPushUpView];
}

- (void)buildPushUpView {

    // 标题
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, Width/_m_scale, 22)];
    [_m_pushUpScaleView addSubview:titleLabel];
    
    titleLabel.text          = _m_titleStr;
    titleLabel.textColor     = [UIColor grayColor];
    titleLabel.font          = [UIFont systemFontOfSize:16];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    // 描述
    self.m_descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20+22+17, Width/_m_scale, 40)];
    [_m_pushUpScaleView addSubview:_m_descriptionLabel];
    
    _m_descriptionLabel.text          = @"描述";
    _m_descriptionLabel.textColor     = [UIColor redColor];
    _m_descriptionLabel.font          = [UIFont systemFontOfSize:45];
    _m_descriptionLabel.textAlignment = NSTextAlignmentCenter;
    
    // 分割线
    UIView *segmentLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 20+22+17+40+15-0.5, Width/_m_scale, 0.5)];
    [_m_pushUpScaleView addSubview:segmentLineView];
    segmentLineView.backgroundColor = [UIColor grayColor];
}

- (void)updateDescription:(NSString*)description {
    
    _m_descriptionLabel.text = description;
}

@end

