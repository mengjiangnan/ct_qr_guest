//
//  ViewController.m
//  qinren_guest
//
//  Created by qin_ren on 7/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "IndexViewController.h"
#import "SDCycleScrollView.h"

@interface IndexViewController ()<SDCycleScrollViewDelegate>

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 1200);
    [self.view addSubview:demoContainerView];
    
    //self.title = @"轮播Demo";
    
    // 情景一：采用本地图片实现
    NSArray *imageNames;
    imageNames= @[@"h1.jpg",@"h2.jpg",@"h3.jpg",@"h4.jpg",];
    
    CGFloat w;
    w = self.view.bounds.size.width;
    
    // 本地加载 --- 创建不带标题的图片轮播器
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, 180) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [demoContainerView addSubview:cycleScrollView];
    
    //     －－－垂直滚动－－－
    
    //cycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //         --- 轮播时间间隔，默认1.0秒，可自定义
    
    //cycleScrollView.autoScrollTimeInterval = 4.0;

    
    
}

@end
