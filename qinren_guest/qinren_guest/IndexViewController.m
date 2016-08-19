//
//  ViewController.m
//  qinren_guest
//
//  Created by qin_ren on 7/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "IndexViewController.h"
#import "SDCycleScrollView.h"
#import "New_Fisrt_ViewController.h"
#import "New_Second_ViewController.h"
#import "HealthShopIndexViewController.h"
#import "NSString+toHexString.h"
#import "NSData+dataToHexString.h"
#import "MyLehuo.h"
#import "ProgressHUD.h"
#import "JkpdViewController.h"
#import "NoonBreakViewController.h"
#import "TodayViewController.h"
#import "TravelViewController.h"

@interface IndexViewController ()<SDCycleScrollViewDelegate>

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:182.0/255 green:182.0/255 blue:182.0/255 alpha:1.0];
    
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
    
    //占位符图片
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];
    
    // 情颢二: 采用网络图片实现
    NSArray *imagesURLStrings;
    imagesURLStrings =@[@"http://www.qrgs360.com:8088/Picture/201604/141527453573qy2x_640x300.jpg",
                        @"http://www.qrgs360.com:8088/Picture/201604/131633434739qb0q_640x300.jpg",
                        @"http://www.qrgs360.com:8088//Picture/201608/111141584789q0qj.jpg"
                        ];
    
    // 网络加载图片的轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, 180) delegate:self placeholderImage:placeholderImage];
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    [demoContainerView addSubview:cycleScrollView];
    
    // 本地加载 --- 创建不带标题的图片轮播器
    
//    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, 180) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
//    cycleScrollView.delegate = self;
//    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
//    [demoContainerView addSubview:cycleScrollView];
    
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
    
    health_manager_left_view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    [mainview addSubview:health_manager_left_view];
    
    
    UILabel *health_manager_left_label;
    
    CGRect health_manager_left_label_frame = CGRectMake(health_manager_left_view.frame.size.width*0.33, 0, 100, health_manager_left_view.frame.size.height/3);
    
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
    
    [health_manager_left_tel_btn addTarget:self action:@selector(leftcallphone) forControlEvents:UIControlEventTouchUpInside];
    
    [health_manager_left_view addSubview:health_manager_left_tel_btn];
    
    //在线交流按钮
    
    UIImage *health_manager_left_chat_img;
    
    health_manager_left_chat_img = [UIImage imageNamed:@"Index_chat_icon"];
    
    UIButton *health_manager_left_chat_btn;
    
    health_manager_left_chat_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [health_manager_left_chat_btn setBackgroundImage:health_manager_left_chat_img forState:UIControlStateNormal];
    
    health_manager_left_chat_btn.frame = CGRectMake(health_manager_left_view.frame.size.width*0.65, health_manager_left_view.frame.size.height/2, health_manager_left_chat_img.size.width,
                                                    health_manager_left_chat_img.size.height);
    
    [health_manager_left_chat_btn setTitle:@"在线交流" forState:UIControlStateNormal];
    
    health_manager_left_chat_btn.titleLabel.font = [UIFont systemFontOfSize:8.0];
    
    [health_manager_left_chat_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [health_manager_left_chat_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    health_manager_left_chat_btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    health_manager_left_chat_btn.titleEdgeInsets = UIEdgeInsetsMake(health_manager_left_chat_img.size.height+20, -2.5, 0, -2.5);
    
    [health_manager_left_chat_btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    
    [health_manager_left_view addSubview:health_manager_left_chat_btn];

    
    //健康管理师版块

    UIView *health_manager_teacher_right_view;
    
    CGRect health_manager_teacher_right_frame = CGRectMake(w*0.503, 181, w*0.497, 180);
    
    health_manager_teacher_right_view = [[UIView alloc]initWithFrame:health_manager_teacher_right_frame];
    
    health_manager_teacher_right_view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    [mainview addSubview:health_manager_teacher_right_view];
    
    
    UILabel *health_manager_right_label;
    
    CGRect health_manager_right_label_frame = CGRectMake(health_manager_left_view.frame.size.width*0.26, 0, 100, health_manager_left_view.frame.size.height/3);
    
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
    
    [health_manager_right_tel_btn addTarget:self action:@selector(rightcallphone) forControlEvents:UIControlEventTouchUpInside];
    
    [health_manager_teacher_right_view addSubview:health_manager_right_tel_btn];

    //在线交流按钮
    
    UIImage *health_manager_right_chat_img;
    
    health_manager_right_chat_img = [UIImage imageNamed:@"Index_chat_icon"];
    
    UIButton *health_manager_right_chat_btn;
    
    health_manager_right_chat_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [health_manager_right_chat_btn setBackgroundImage:health_manager_right_chat_img forState:UIControlStateNormal];
    
    health_manager_right_chat_btn.frame = CGRectMake(health_manager_teacher_right_view.frame.size.width*0.65, health_manager_teacher_right_view.frame.size.height/2, health_manager_right_chat_img.size.
                                                     width,health_manager_right_chat_img.size.height);
    
    [health_manager_right_chat_btn setTitle:@"在线交流" forState:UIControlStateNormal];
    
    health_manager_right_chat_btn.titleLabel.font = [UIFont systemFontOfSize:8.0];
    
    [health_manager_right_chat_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [health_manager_right_chat_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    health_manager_right_chat_btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    health_manager_right_chat_btn.titleEdgeInsets = UIEdgeInsetsMake(health_manager_right_chat_img.size.height+20, -2.5, 0, -2.5);
    
    [health_manager_right_chat_btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    
    [health_manager_teacher_right_view addSubview:health_manager_right_chat_btn];

    
    
    //今日任务按钮
    
    UIButton *today_btn;
    
    today_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    today_btn.frame = CGRectMake(0, 363, w*0.497, 40);
    
    today_btn.backgroundColor = [UIColor whiteColor];
    
    UIImage *today_btn_image;
    
    today_btn_image = [UIImage imageNamed:@"Index_tody_session_icon"];
    
    [today_btn setImage:today_btn_image forState:UIControlStateNormal];
    
    today_btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, today_btn.frame.size.width * 0.2);
    
    [today_btn setTitle:@"今日任务" forState:UIControlStateNormal];
    
    today_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [today_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [today_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    today_btn.titleLabel.textAlignment = NSTextAlignmentRight;
    
    [today_btn addTarget:self action:@selector(today) forControlEvents:UIControlEventTouchUpInside];
    
    [mainview addSubview:today_btn];
    
    
    //健康频道按钮
    
    UIButton *service_btn;
    
    service_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    service_btn.frame = CGRectMake(w*0.503, 363, w*0.497, 40);
    
    service_btn.backgroundColor = [UIColor whiteColor];
    
    UIImage *service_btn_image;
    
    service_btn_image = [UIImage imageNamed:@"Index_service_reservation_icon"];
    
    [service_btn setImage:service_btn_image forState:UIControlStateNormal];
    
    service_btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, service_btn.frame.size.width * 0.2);
    
    [service_btn setTitle:@"健康频道" forState:UIControlStateNormal];
    
    service_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [service_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [service_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    service_btn.titleLabel.textAlignment = NSTextAlignmentRight;
    
    [service_btn addTarget:self action:@selector(jkpd) forControlEvents:UIControlEventTouchUpInside];
    
    [mainview addSubview:service_btn];
    
    
    //健康检测按钮
    
    UIButton *health_check_btn;
    
    health_check_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    health_check_btn.frame = CGRectMake(0, 405, w*0.497, 40);
    
    health_check_btn.backgroundColor = [UIColor whiteColor];
    
    UIImage *health_check_btn_image;
    
    health_check_btn_image = [UIImage imageNamed:@"Index_health_check_icon"];
    
    [health_check_btn setImage:health_check_btn_image forState:UIControlStateNormal];
    
    health_check_btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, health_check_btn.frame.size.width * 0.2);
    
    [health_check_btn setTitle:@"健康检测" forState:UIControlStateNormal];
    
    health_check_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [health_check_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [health_check_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    health_check_btn.titleLabel.textAlignment = NSTextAlignmentRight;
    
    [health_check_btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    
    [mainview addSubview:health_check_btn];
    
    
    //健康商城按钮
    
    UIButton *my_scheme_btn;
    
    my_scheme_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    my_scheme_btn.frame = CGRectMake(w*0.503, 405, w*0.497, 40);
    
    my_scheme_btn.backgroundColor = [UIColor whiteColor];
    
    UIImage *my_scheme_btn_image;
    
    my_scheme_btn_image = [UIImage imageNamed:@"Index_my_scheme_icon"];
    
    [my_scheme_btn setImage:my_scheme_btn_image forState:UIControlStateNormal];
    
    my_scheme_btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, my_scheme_btn.frame.size.width * 0.2);
    
    [my_scheme_btn setTitle:@"健康商城" forState:UIControlStateNormal];
    
    my_scheme_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [my_scheme_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [my_scheme_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    my_scheme_btn.titleLabel.textAlignment = NSTextAlignmentRight;
    
    [my_scheme_btn addTarget:self action:@selector(myshop) forControlEvents:UIControlEventTouchUpInside];
    
    [mainview addSubview:my_scheme_btn];
    
    
    //我的红包按钮
    
    UIButton *health_shop_btn;
    
    health_shop_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    health_shop_btn.frame = CGRectMake(0, 447, w*0.497, 40);
    
    health_shop_btn.backgroundColor = [UIColor whiteColor];
    
    UIImage *health_shop_btn_image;
    
    health_shop_btn_image = [UIImage imageNamed:@"Index_health_shop_icon"];
    
    [health_shop_btn setImage:health_shop_btn_image forState:UIControlStateNormal];
    
    health_shop_btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, health_shop_btn.frame.size.width * 0.2);
    
    [health_shop_btn setTitle:@"我的红包" forState:UIControlStateNormal];
    
    health_shop_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [health_shop_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [health_shop_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    health_shop_btn.titleLabel.textAlignment = NSTextAlignmentRight;
    
    [health_shop_btn addTarget:self action:@selector(mylehuo) forControlEvents:UIControlEventTouchUpInside];
    
    [mainview addSubview:health_shop_btn];
    
    
    //候鸟旅游按钮
    
    UIButton *group_shopping_btn;
    
    group_shopping_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    group_shopping_btn.frame = CGRectMake(w*0.503, 447, w*0.497, 40);
    
    group_shopping_btn.backgroundColor = [UIColor whiteColor];
    
    UIImage *group_shopping_btn_image;
    
    group_shopping_btn_image = [UIImage imageNamed:@"Index_ community_group_icon"];
    
    [group_shopping_btn setImage:group_shopping_btn_image forState:UIControlStateNormal];
    
    group_shopping_btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, group_shopping_btn.frame.size.width * 0.2);
    
    [group_shopping_btn setTitle:@"候鸟旅游" forState:UIControlStateNormal];
    
    group_shopping_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [group_shopping_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [group_shopping_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    group_shopping_btn.titleLabel.textAlignment = NSTextAlignmentRight;
    
    [group_shopping_btn addTarget:self action:@selector(travel) forControlEvents:UIControlEventTouchUpInside];
    
    [mainview addSubview:group_shopping_btn];
    
    
    //我的红包按钮
    
    UIButton *my_ntegral_btn;
    
    my_ntegral_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    my_ntegral_btn.frame = CGRectMake(0, 489, w*0.497, 40);
    
    my_ntegral_btn.backgroundColor = [UIColor whiteColor];
    
    UIImage *my_ntegral_btn_image;
    
    my_ntegral_btn_image = [UIImage imageNamed:@"Index_my_integral_icon"];
    
    [my_ntegral_btn setImage:my_ntegral_btn_image forState:UIControlStateNormal];
    
    my_ntegral_btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, my_ntegral_btn.frame.size.width * 0.2);
    
    [my_ntegral_btn setTitle:@"我的红包" forState:UIControlStateNormal];
    
    my_ntegral_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [my_ntegral_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [my_ntegral_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    my_ntegral_btn.titleLabel.textAlignment = NSTextAlignmentRight;
    
    [my_ntegral_btn addTarget:self action:@selector(mylehuo) forControlEvents:UIControlEventTouchUpInside];
    
    //[mainview addSubview:my_ntegral_btn];
    
    
    //健康频道按钮
    
    UIButton *my_join_btn;
    
    my_join_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    my_join_btn.frame = CGRectMake(w*0.503, 489, w*0.497, 40);
    
    my_join_btn.backgroundColor = [UIColor whiteColor];
    
    UIImage *my_join_btn_image;
    
    my_join_btn_image = [UIImage imageNamed:@"Index_my_join_icon"];
    
    [my_join_btn setImage:my_join_btn_image forState:UIControlStateNormal];
    
    my_join_btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, my_join_btn.frame.size.width * 0.2);
    
    [my_join_btn setTitle:@"健康频道" forState:UIControlStateNormal];
    
    my_join_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [my_join_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [my_join_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    my_join_btn.titleLabel.textAlignment = NSTextAlignmentRight;
    
    [my_join_btn addTarget:self action:@selector(jkpd) forControlEvents:UIControlEventTouchUpInside];
    
    //[mainview addSubview:my_join_btn];
    
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    //NSLog(@"---点击了第%ld张图片", (long)index);
    
    if ((long)index == 0) {
        self.hidesBottomBarWhenPushed=YES;
        
        UIViewController *new01_vc = [[New_Fisrt_ViewController alloc]init];
        
        [self.navigationController pushViewController:new01_vc animated:YES];
        
        self.hidesBottomBarWhenPushed=NO;

    }else if ((long)index == 1){
        
        self.hidesBottomBarWhenPushed=YES;
        
        UIViewController *new02_vc = [[New_Second_ViewController alloc]init];
        
        [self.navigationController pushViewController:new02_vc animated:YES];
        
        self.hidesBottomBarWhenPushed=NO;

    }else if ((long)index == 2){
    
        self.hidesBottomBarWhenPushed=YES;
        
        UIViewController *new03_vc = [[NoonBreakViewController alloc]init];
        
        [self.navigationController pushViewController:new03_vc animated:YES];
        
        self.hidesBottomBarWhenPushed=NO;
    
    
    }
    
    
}

-(void)myshop
{
    self.hidesBottomBarWhenPushed=YES;
    
    HealthShopIndexViewController *shop_index_vc = [[HealthShopIndexViewController alloc]init];
    
    [self.navigationController pushViewController:shop_index_vc animated:YES];
    
    self.hidesBottomBarWhenPushed=NO;

}

-(void)mylehuo
{
    //读取用户uid
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *myuid = [defaults objectForKey:@"uid"];
    
           if (myuid.length == 0) {
            
            [ProgressHUD showError: @"请登陆!"];
            
               
           }else{

    
             self.hidesBottomBarWhenPushed=YES;
    
             MyLehuo *mylehuo_vc = [[MyLehuo alloc]init];
    
             [self.navigationController pushViewController:mylehuo_vc animated:YES];
    
             self.hidesBottomBarWhenPushed=NO;
           
           }
}

-(void)test
{

    [ProgressHUD showError: @"对不起您没有权限！"];
}

-(void)leftcallphone
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *emissary_phone = [defaults objectForKey:@"emissary_phone"];
    
    if (emissary_phone.length == 0) {
        
        [ProgressHUD showError: @"对不起您没有权限!"];
    
    }else{
    
    
    NSMutableString* str=[[NSMutableString alloc] initWithFormat:@"%@",emissary_phone];
     // NSLog(@"str======%@",str);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        
    }
    
}

-(void)rightcallphone
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *emissary_phone = [defaults objectForKey:@"housekeeper_phone"];
    
    if (emissary_phone.length == 0) {
        
        [ProgressHUD showError: @"对不起您没有权限!"];
        
    }else{
        
        
        NSMutableString* str=[[NSMutableString alloc] initWithFormat:@"%@",emissary_phone];
        // NSLog(@"str======%@",str);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        
    }

}

-(void)jkpd
{

    self.hidesBottomBarWhenPushed=YES;
    
     JkpdViewController *jkpd_vc = [[JkpdViewController alloc]init];
    
    [self.navigationController pushViewController:jkpd_vc animated:YES];
    
    self.hidesBottomBarWhenPushed=NO;

}

-(void)today
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *myuid = [defaults objectForKey:@"uid"];
    
    if (myuid.length == 0) {
        
        [ProgressHUD showError: @"对不起您没有权限!"];
        
    }else{

    self.hidesBottomBarWhenPushed=YES;
    
    TodayViewController *todayvc = [[TodayViewController alloc]init];
    
    [self.navigationController pushViewController:todayvc animated:YES];
    
    self.hidesBottomBarWhenPushed=NO;
        
    }

}

-(void)travel
{
    self.hidesBottomBarWhenPushed=YES;
    
    TravelViewController *travel_vc = [[TravelViewController alloc]init];
    
    [self.navigationController pushViewController:travel_vc animated:YES];
    
    self.hidesBottomBarWhenPushed=NO;

}
@end
