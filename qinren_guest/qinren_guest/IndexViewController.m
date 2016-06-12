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
    
    self.view.backgroundColor = [UIColor grayColor];
    
    //加载uiscrollview控件
    
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 180);
    demoContainerView.showsVerticalScrollIndicator = FALSE;
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
    
    //     －－－水平滚动－－－
    
    cycleScrollView.scrollDirection =UICollectionViewScrollDirectionHorizontal;
    
    //         --- 轮播时间间隔，默认1.0秒，可自定义
    
    //cycleScrollView.autoScrollTimeInterval = 4.0;
    
    //健康管家版块
    
    UIView *health_manager_left_view;
    
    CGRect health_manager_left_frame = CGRectMake(0, 245, w*0.497, 180);
    
    health_manager_left_view = [[UIView alloc]initWithFrame:health_manager_left_frame];
    
    health_manager_left_view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:health_manager_left_view];

    
    //健康管理师版块

    UIView *health_manager_teacher_right_view;
    
    CGRect health_manager_teacher_right_frame = CGRectMake(w*0.503, 245, w*0.497, 180);
    
    health_manager_teacher_right_view = [[UIView alloc]initWithFrame:health_manager_teacher_right_frame];
    
    health_manager_teacher_right_view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:health_manager_teacher_right_view];
    
    
    //今日任务按钮
    
    UIButton *today_btn;
    
    today_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    today_btn.frame = CGRectMake(0, 427, w*0.497, 40);
    
    today_btn.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:today_btn];
    
    
    //服务预约按钮
    
    UIButton *service_btn;
    
    service_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    service_btn.frame = CGRectMake(w*0.503, 427, w*0.497, 40);
    
    service_btn.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:service_btn];
    
    
    //健康检测按钮
    
    UIButton *health_check_btn;
    
    health_check_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    health_check_btn.frame = CGRectMake(0, 469, w*0.497, 40);
    
    health_check_btn.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:health_check_btn];
    
    
    //我的方案按钮
    
    UIButton *my_scheme_btn;
    
    my_scheme_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    my_scheme_btn.frame = CGRectMake(w*0.503, 469, w*0.497, 40);
    
    my_scheme_btn.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:my_scheme_btn];
    
    
    //健康商城按钮
    
    UIButton *health_shop_btn;
    
    health_shop_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    health_shop_btn.frame = CGRectMake(0, 511, w*0.497, 40);
    
    health_shop_btn.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:health_shop_btn];
    
    
    //社区团购按钮
    
    UIButton *group_shopping_btn;
    
    group_shopping_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    group_shopping_btn.frame = CGRectMake(w*0.503, 511, w*0.497, 40);
    
    group_shopping_btn.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:group_shopping_btn];
    
    
    //我的积分按钮
    
    UIButton *my_ntegral_btn;
    
    my_ntegral_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    my_ntegral_btn.frame = CGRectMake(0, 553, w*0.497, 40);
    
    my_ntegral_btn.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:my_ntegral_btn];
    
    
    //我要加盟按钮
    
    UIButton *my_join_btn;
    
    my_join_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    my_join_btn.frame = CGRectMake(w*0.503, 553, w*0.497, 40);
    
    my_join_btn.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:my_join_btn];


    
    
    
    
    
    
    
    
    
    
    
}

@end
