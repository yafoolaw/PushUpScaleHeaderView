//
//  ViewController.m
//  PushUpScaleHeaderView
//
//  Created by FrankLiu on 15/9/30.
//  Copyright © 2015年 FrankLiu. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *m_scrollView;
@property (nonatomic, strong) HeaderView   *m_headerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.m_scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_m_scrollView];
    
    _m_scrollView.contentSize                  = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2);
    _m_scrollView.backgroundColor              = [UIColor brownColor];
    _m_scrollView.showsVerticalScrollIndicator = NO;
    
    self.m_headerView = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20+20+17+40+15)
                                                   scale:0.6
                                                  offset:200
                                                   title:@"刘大帅"];
    [self.view addSubview:_m_headerView];
    _m_headerView.m_pushUpScaleView.m_scrollView = _m_scrollView;
    [_m_headerView.m_pushUpScaleView addScrollViewObserver];
    
    [self performSelector:@selector(netWork) withObject:nil afterDelay:1];
}

- (void)netWork {

    [_m_headerView updateDescription:@"到此一游"];
}

- (void)dealloc
{
    [self.m_headerView.m_pushUpScaleView removeScrollViewObserver];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
