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
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //添加全屏子控件scrollview
    
    UIScrollView *mainview;
    
    mainview = [[UIScrollView alloc] initWithFrame:self.view.frame];
    
    CGFloat mainview_height = 180 + 181 +(40 * 4)+(2*5);
    
    mainview.contentSize = CGSizeMake(self.view.frame.size.width, mainview_height);
    
    //mainview.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+49);
    
    [self.view addSubview:mainview];
    
    //加载uiscrollview控件
    
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 180);
    [mainview addSubview:demoContainerView];
    
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
    
    //cycleScrollView.scrollDirection =UICollectionViewScrollDirectionHorizontal;
    
    //         --- 轮播时间间隔，默认1.0秒，可自定义
    
    //cycleScrollView.autoScrollTimeInterval = 4.0;
    
    //健康管家版块
    
    UIView *health_manager_left_view;
        
    CGRect health_manager_left_view_frame = CGRectMake(0, 181, w*0.497, 180);
    
    health_manager_left_view = [[UIView alloc]initWithFrame:health_manager_left_view_frame];
    
    health_manager_left_view.backgroundColor = [UIColor whiteColor];
    
    [mainview addSubview:health_manager_left_view];
    
    
    UILabel *health_manager_left_label;
    
    CGRect health_manager_left_label_frame = CGRectMake(health_manager_left_view.frame.size.width*0.3, 0, 100, health_manager_left_view.frame.size.height/3);
    
    health_manager_left_label = [[UILabel alloc]initWithFrame:health_manager_left_label_frame];
    
    health_manager_left_label.text = @"健康管家";
    
    [health_manager_left_view addSubview:health_manager_left_label];
    
    //打电话按钮
    
    UIImage *health_manager_left_tel_img;
    
    health_manager_left_tel_img = [UIImage imageNamed:@"Index_call_icon"];
    
    UIButton *health_manager_left_tel_btn;
    
    health_manager_left_tel_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [health_manager_left_tel_btn setBackgroundImage:health_manager_left_tel_img forState:UIControlStateNormal];
    
    health_manager_left_tel_btn.frame = CGRectMake(health_manager_left_view.frame.size.width*0.2, health_manager_left_view.frame.size.height/2, health_manager_left_tel_img.size.width,
                                                   health_manager_left_tel_img.size.height);
    
    [health_manager_left_tel_btn setTitle:@"打电话" forState:UIControlStateNormal];
    
    health_manager_left_tel_btn.titleLabel.font = [UIFont systemFontOfSize:8.0];
    
    [health_manager_left_tel_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [health_manager_left_tel_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    health_manager_left_tel_btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    health_manager_left_tel_btn.titleEdgeInsets = UIEdgeInsetsMake(health_manager_left_tel_img.size.height+20, 0, 0, 0);
    
    [health_manager_left_view addSubview:health_manager_left_tel_btn];
    
    //在线交流按钮
    
    UIImage *health_manager_left_chat_img;
    
    health_manager_left_chat_img = [UIImage imageNamed:@"Index_chat_icon"];
    
    UIButton *health_manager_left_chat_btn;
    
    health_manager_left_chat_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [health_manager_left_chat_btn setBackgroundImage:health_manager_left_chat_img forState:UIControlStateNormal];
    
    health_manager_left_chat_btn.frame = CGRectMake(health_manager_left_view.frame.size.width*0.6, health_manager_left_view.frame.size.height/2, health_manager_left_chat_img.size.width,
                                                    health_manager_left_chat_img.size.height);
    
    [health_manager_left_chat_btn setTitle:@"在线交流" forState:UIControlStateNormal];
    
    health_manager_left_chat_btn.titleLabel.font = [UIFont systemFontOfSize:8.0];
    
    [health_manager_left_chat_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [health_manager_left_chat_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    health_manager_left_chat_btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    health_manager_left_chat_btn.titleEdgeInsets = UIEdgeInsetsMake(health_manager_left_chat_img.size.height+20, -2.5, 0, -2.5);
    
    [health_manager_left_view addSubview:health_manager_left_chat_btn];

    
    //健康管理师版块

    UIView *health_manager_teacher_right_view;
    
    CGRect health_manager_teacher_right_frame = CGRectMake(w*0.503, 181, w*0.497, 180);
    
    health_manager_teacher_right_view = [[UIView alloc]initWithFrame:health_manager_teacher_right_frame];
    
    health_manager_teacher_right_view.backgroundColor = [UIColor whiteColor];
    
    [mainview addSubview:health_manager_teacher_right_view];
    
    
    UILabel *health_manager_right_label;
    
    CGRect health_manager_right_label_frame = CGRectMake(health_manager_left_view.frame.size.width/4, 0, 100, health_manager_left_view.frame.size.height/3);
    
    health_manager_right_label = [[UILabel alloc]initWithFrame:health_manager_right_label_frame];
    
    health_manager_right_label.text = @"健康管理师";
    
    [health_manager_teacher_right_view addSubview:health_manager_right_label];
    
    //打电话按钮
    
    UIImage *health_manager_right_tel_img;
    
    health_manager_right_tel_img = [UIImage imageNamed:@"Index_call_icon"];
    
    UIButton *health_manager_right_tel_btn;
    
    health_manager_right_tel_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [health_manager_right_tel_btn setBackgroundImage:health_manager_right_tel_img forState:UIControlStateNormal];
    
    health_manager_right_tel_btn.frame = CGRectMake(health_manager_teacher_right_view.frame.size.width/5, health_manager_teacher_right_view.frame.size.height/2, health_manager_right_tel_img.size.width,
                                                   health_manager_right_tel_img.size.height);
    
    [health_manager_right_tel_btn setTitle:@"打电话" forState:UIControlStateNormal];
    
    health_manager_right_tel_btn.titleLabel.font = [UIFont systemFontOfSize:8.0];
    
    [health_manager_right_tel_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [health_manager_right_tel_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    health_manager_right_tel_btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    health_manager_right_tel_btn.titleEdgeInsets = UIEdgeInsetsMake(health_manager_right_tel_img.size.height+20, 0, 0, 0);
    
    [health_manager_teacher_right_view addSubview:health_manager_right_tel_btn];

    //在线交流按钮
    
    UIImage *health_manager_right_chat_img;
    
    health_manager_right_chat_img = [UIImage imageNamed:@"Index_chat_icon"];
    
    UIButton *health_manager_right_chat_btn;
    
    health_manager_right_chat_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [health_manager_right_chat_btn setBackgroundImage:health_manager_right_chat_img forState:UIControlStateNormal];
    
    health_manager_right_chat_btn.frame = CGRectMake(health_manager_teacher_right_view.frame.size.width*0.6, health_manager_teacher_right_view.frame.size.height/2, health_manager_right_chat_img.size.
                                                     width,health_manager_right_chat_img.size.height);
    
    [health_manager_right_chat_btn setTitle:@"在线交流" forState:UIControlStateNormal];
    
    health_manager_right_chat_btn.titleLabel.font = [UIFont systemFontOfSize:8.0];
    
    [health_manager_right_chat_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [health_manager_right_chat_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    health_manager_right_chat_btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    health_manager_right_chat_btn.titleEdgeInsets = UIEdgeInsetsMake(health_manager_right_chat_img.size.height+20, -2.5, 0, -2.5);
    
    [health_manager_teacher_right_view addSubview:health_manager_right_chat_btn];

    
    
    //今日任务按钮
    
    UIButton *today_btn;
    
    today_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    today_btn.frame = CGRectMake(0, 363, w*0.497, 40);
    
    today_btn.backgroundColor = [UIColor whiteColor];
    
    [mainview addSubview:today_btn];
    
    
    //服务预约按钮
    
    UIButton *service_btn;
    
    service_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    service_btn.frame = CGRectMake(w*0.503, 363, w*0.497, 40);
    
    service_btn.backgroundColor = [UIColor whiteColor];
    
    [mainview addSubview:service_btn];
    
    
    //健康检测按钮
    
    UIButton *health_check_btn;
    
    health_check_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    health_check_btn.frame = CGRectMake(0, 405, w*0.497, 40);
    
    health_check_btn.backgroundColor = [UIColor whiteColor];
    
    [mainview addSubview:health_check_btn];
    
    
    //我的方案按钮
    
    UIButton *my_scheme_btn;
    
    my_scheme_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    my_scheme_btn.frame = CGRectMake(w*0.503, 405, w*0.497, 40);
    
    my_scheme_btn.backgroundColor = [UIColor whiteColor];
    
    [mainview addSubview:my_scheme_btn];
    
    
    //健康商城按钮
    
    UIButton *health_shop_btn;
    
    health_shop_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    health_shop_btn.frame = CGRectMake(0, 447, w*0.497, 40);
    
    health_shop_btn.backgroundColor = [UIColor whiteColor];
    
    [mainview addSubview:health_shop_btn];
    
    
    //社区团购按钮
    
    UIButton *group_shopping_btn;
    
    group_shopping_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    group_shopping_btn.frame = CGRectMake(w*0.503, 447, w*0.497, 40);
    
    group_shopping_btn.backgroundColor = [UIColor whiteColor];
    
    [mainview addSubview:group_shopping_btn];
    
    
    //我的积分按钮
    
    UIButton *my_ntegral_btn;
    
    my_ntegral_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    my_ntegral_btn.frame = CGRectMake(0, 489, w*0.497, 40);
    
    my_ntegral_btn.backgroundColor = [UIColor whiteColor];
    
    [mainview addSubview:my_ntegral_btn];
    
    
    //我要加盟按钮
    
    UIButton *my_join_btn;
    
    my_join_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    my_join_btn.frame = CGRectMake(w*0.503, 489, w*0.497, 40);
    
    my_join_btn.backgroundColor = [UIColor whiteColor];
    
    [mainview addSubview:my_join_btn];


    
    
    
    
    
    
    
    
    
    
    
}

@end
