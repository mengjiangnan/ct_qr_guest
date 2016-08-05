//
//  MyViewController.m
//  qinren_guest
//
//  Created by qin_ren on 21/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "MyViewController.h"

#import "PersonInformationViewController.h"

#import "LoginViewController.h"


@interface MyViewController ()

@property (nonatomic,strong) UIButton *hbtn;

@property (nonatomic,strong) UIBarButtonItem *oldbtn;

@end

@implementation MyViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"我的信息";
    
    //添加全屏子控件scrollview
    
    UIScrollView *mainview;
    
    CGFloat mainview_x = 0;
    
    CGFloat mainview_y = -49;
    
    CGFloat mainview_width = self.view.frame.size.width;
    
    CGFloat mainview_height = self.view.frame.size.height;
    
    CGRect  mainview_rect = CGRectMake(mainview_x, mainview_y, mainview_width, mainview_height);
    
    mainview = [[UIScrollView alloc] initWithFrame:mainview_rect];
    
    mainview.contentSize = CGSizeMake(self.view.frame.size.width, 20*36);
    
    [self.view addSubview:mainview];

    
    //设置整个项目的item状态
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置item普通状态
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain
                                                                             target:self action:@selector(set_btn)];
    
    self.oldbtn = self.navigationItem.rightBarButtonItem;
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    //圆形按钮
    
    CGFloat myhead_btn_x = self.view.frame.size.width *0.5 -60;
    
    CGFloat myhead_btn_y = 84;
    
    UIButton *myhead_btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    myhead_btn.frame = CGRectMake(myhead_btn_x, myhead_btn_y, 120, 120);
    
    //[myhead_btn setTitle:@"启动" forState:UIControlStateNormal];
    
    myhead_btn.layer.borderWidth = 1;
    
    myhead_btn.layer.borderColor = [UIColor greenColor].CGColor;
    
    myhead_btn.layer.cornerRadius = 60;
    
    myhead_btn.layer.masksToBounds = YES;
    
    [myhead_btn addTarget:self action:@selector(mylogin) forControlEvents:UIControlEventTouchUpInside];
    
    [mainview addSubview:myhead_btn];
    
    self.hbtn = myhead_btn;
    
    //我的收藏按钮
    
    UIButton *mycollect_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    mycollect_btn = [[UIButton alloc]initWithFrame:CGRectMake(0, myhead_btn_y + myhead_btn.frame.size.height + 20, self.view.frame.size.width*0.497, 60)];
    
    [mycollect_btn setImage:[UIImage imageNamed:@"Index_my_integral_icon"] forState:UIControlStateNormal];
    
    [mycollect_btn setBackgroundColor:[UIColor whiteColor]];
    
    [mycollect_btn setTitle:@"我的收藏" forState:UIControlStateNormal];
    
    mycollect_btn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    
    [mycollect_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [mycollect_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    mycollect_btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [mainview addSubview:mycollect_btn];

    //我的积分按钮
    
    UIButton *myintegral_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    myintegral_btn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.503, myhead_btn_y + myhead_btn.frame.size.height + 20, self.view.frame.size.width*0.497, 60)];
    
    [myintegral_btn setImage:[UIImage imageNamed:@"Index_my_integral_icon"] forState:UIControlStateNormal];
    
    [myintegral_btn setBackgroundColor:[UIColor whiteColor]];
    
    [myintegral_btn setTitle:@"我的积分" forState:UIControlStateNormal];
    
    myintegral_btn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    
    [myintegral_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [myintegral_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    myintegral_btn.titleLabel.textAlignment = NSTextAlignmentCenter;

    [mainview addSubview:myintegral_btn];
    
    //全部订单标签
    
    UILabel *all_order_label = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width *0.1, 84 + myhead_btn.frame.size.height + 20 + myintegral_btn.frame.size.height +10, 0, 0)];
    
    all_order_label.text = @"全部订单";
    
    all_order_label.numberOfLines = 0;
    
    [all_order_label sizeToFit];

    [mainview addSubview:all_order_label];
    
    //待付款按钮
    
    UIButton *wait_pay_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    wait_pay_btn = [[UIButton alloc]initWithFrame:CGRectMake(0,84 + myhead_btn.frame.size.height + 20 + myintegral_btn.frame.size.height + 10 + all_order_label.frame.size.height + 20, self.view.frame.size.width * 0.24, 80)];
    
    [wait_pay_btn setImage:[UIImage imageNamed:@"my_wait_pay_icon"] forState:UIControlStateNormal];
    
    [wait_pay_btn setImage:[UIImage imageNamed:@"my_wait_pay_gray_icon"] forState:UIControlStateHighlighted];
    
    [wait_pay_btn setBackgroundColor:[UIColor whiteColor]];
    
    [wait_pay_btn setTitle:@"待付款" forState:UIControlStateNormal];
    
    wait_pay_btn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    
    [wait_pay_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [wait_pay_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    wait_pay_btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [mainview addSubview:wait_pay_btn];
    
    //待发货按钮
    
    UIButton *wait_sip_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    wait_sip_btn = [[UIButton alloc]initWithFrame:CGRectMake(wait_pay_btn.frame.size.width+ self.view.frame.size.width * 0.015,84 + myhead_btn.frame.size.height + 20 + myintegral_btn.frame.size.height + 10 + all_order_label.frame.size.height + 20, self.view.frame.size.width * 0.24, 80)];
    
    [wait_sip_btn setImage:[UIImage imageNamed:@"my_wait_sip_icon"] forState:UIControlStateNormal];
    
    [wait_sip_btn setImage:[UIImage imageNamed:@"my_wait_sip_gray_icon"] forState:UIControlStateHighlighted];
    
    [wait_sip_btn setBackgroundColor:[UIColor whiteColor]];
    
    [wait_sip_btn setTitle:@"待发货" forState:UIControlStateNormal];
    
    wait_sip_btn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    
    [wait_sip_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [wait_sip_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    wait_sip_btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [mainview addSubview:wait_sip_btn];
    
    //待收货按钮
    
    UIButton *wait_receipt_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    wait_receipt_btn = [[UIButton alloc]initWithFrame:CGRectMake(wait_sip_btn.frame.size.width*2 + self.view.frame.size.width * 0.03 ,84 + myhead_btn.frame.size.height + 20 + myintegral_btn.frame.size.height + 10 + all_order_label.frame.size.height + 20, self.view.frame.size.width * 0.24, 80)];
    
    [wait_receipt_btn setImage:[UIImage imageNamed:@"my_wait_receipt_icon"] forState:UIControlStateNormal];
    
    [wait_receipt_btn setImage:[UIImage imageNamed:@"my_wait_receipt_gray_icon"] forState:UIControlStateHighlighted];
    
    [wait_receipt_btn setBackgroundColor:[UIColor whiteColor]];
    
    [wait_receipt_btn setTitle:@"待收货" forState:UIControlStateNormal];
    
    wait_receipt_btn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    
    [wait_receipt_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [wait_receipt_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    wait_receipt_btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [mainview addSubview:wait_receipt_btn];
    
    //待评价按钮
    
    UIButton *wait_appraise_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    wait_appraise_btn = [[UIButton alloc]initWithFrame:CGRectMake(wait_receipt_btn.frame.size.width*3 + self.view.frame.size.width * 0.045 ,84 + myhead_btn.frame.size.height + 20 + myintegral_btn.frame.size.height + 10 + all_order_label.frame.size.height + 20, self.view.frame.size.width * 0.24, 80)];
    
    [wait_appraise_btn setImage:[UIImage imageNamed:@"my_wait_appraise_icon"] forState:UIControlStateNormal];
    
    [wait_appraise_btn setImage:[UIImage imageNamed:@"my_wait_appraise_gray_icon"] forState:UIControlStateHighlighted];
    
    [wait_appraise_btn setBackgroundColor:[UIColor whiteColor]];
    
    [wait_appraise_btn setTitle:@"待评价" forState:UIControlStateNormal];
    
    wait_appraise_btn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    
    [wait_appraise_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [wait_appraise_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    wait_appraise_btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [mainview addSubview:wait_appraise_btn];
    
    //我的设备按钮
    
    UIButton *my_device_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    my_device_btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 84 + myhead_btn.frame.size.height + 20 + myintegral_btn.frame.size.height + 10 + all_order_label.frame.size.height + 20 + wait_pay_btn.frame.size.height + 5, self.view.frame.size.width, self.view.frame.size.height * 0.10)];
    
    [my_device_btn setImage:[UIImage imageNamed:@"my_mydevice_icon"] forState:UIControlStateNormal];
    
    [my_device_btn setImage:[UIImage imageNamed:@"my_mydevice_gray_icon"] forState:UIControlStateHighlighted];
    
    my_device_btn.backgroundColor = [UIColor whiteColor];
    
    [my_device_btn setTitle:@"我的设备" forState:UIControlStateNormal];
    
    my_device_btn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    
    [my_device_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [my_device_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    my_device_btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    [mainview addSubview:my_device_btn];
    
    //我的方案按钮
    
    UIButton *my_scheme_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    my_scheme_btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 84 + myhead_btn.frame.size.height + 20 + myintegral_btn.frame.size.height + 10 + all_order_label.frame.size.height + 20 + wait_pay_btn.frame.size.height + 5 + my_device_btn.frame.size.height + 5, self.view.frame.size.width, self.view.frame.size.height * 0.10)];
    
    [my_scheme_btn setImage:[UIImage imageNamed:@"my_mydevice_icon"] forState:UIControlStateNormal];
    
    [my_scheme_btn setImage:[UIImage imageNamed:@"my_mydevice_gray_icon"] forState:UIControlStateHighlighted];
    
    my_scheme_btn.backgroundColor = [UIColor whiteColor];
    
    [my_scheme_btn setTitle:@"我的方案" forState:UIControlStateNormal];
    
    my_scheme_btn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    
    [my_scheme_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [my_scheme_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    my_scheme_btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    [mainview addSubview:my_scheme_btn];
    
    //会员卡按钮
    
    UIButton *my_member_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    my_member_btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 84 + myhead_btn.frame.size.height + 20 + myintegral_btn.frame.size.height + 10 + all_order_label.frame.size.height + 20 + wait_pay_btn.frame.size.height + 5 + my_device_btn.frame.size.height + 5 + my_scheme_btn.frame.size.height + 5, self.view.frame.size.width, self.view.frame.size.height * 0.10)];
    
    [my_member_btn setImage:[UIImage imageNamed:@"my_mydevice_icon"] forState:UIControlStateNormal];
    
    [my_member_btn setImage:[UIImage imageNamed:@"my_mydevice_gray_icon"] forState:UIControlStateHighlighted];
    
    my_member_btn.backgroundColor = [UIColor whiteColor];
    
    [my_member_btn setTitle:@"我的方案" forState:UIControlStateNormal];
    
    my_member_btn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    
    [my_member_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [my_member_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    my_member_btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    [mainview addSubview:my_member_btn];
    
    //我的健康管理项目按钮
    
    UIButton *my_health_manager_item_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    my_health_manager_item_btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 84 + myhead_btn.frame.size.height + 20 + myintegral_btn.frame.size.height + 10 + all_order_label.frame.size.height + 20 + wait_pay_btn.frame.size.height + 5 + my_device_btn.frame.size.height + 5 + my_scheme_btn.frame.size.height + 5 + my_member_btn.frame.size.height + 5, self.view.frame.size.width, self.view.frame.size.height * 0.10)];
    
    [my_health_manager_item_btn setImage:[UIImage imageNamed:@"my_mydevice_icon"] forState:UIControlStateNormal];
    
    [my_health_manager_item_btn setImage:[UIImage imageNamed:@"my_mydevice_gray_icon"] forState:UIControlStateHighlighted];
    
    my_health_manager_item_btn.backgroundColor = [UIColor whiteColor];
    
    [my_health_manager_item_btn setTitle:@"我的健康管理项目按钮" forState:UIControlStateNormal];
    
    my_health_manager_item_btn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    
    [my_health_manager_item_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [my_health_manager_item_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    my_health_manager_item_btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    [mainview addSubview:my_health_manager_item_btn];
    
 
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    //读取用户uid
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *myuid = [defaults objectForKey:@"uid"];
    
    if (myuid.length > 0) {
        
        [self.hbtn setBackgroundImage:[UIImage imageNamed:@"h4"] forState:UIControlStateNormal];
        
        self.navigationItem.rightBarButtonItem = self.oldbtn;
        
        self.hbtn.userInteractionEnabled = NO;
        
        
    } else {
        
        [self.hbtn setBackgroundImage:[UIImage imageNamed:@"please_login"] forState:UIControlStateNormal];
        
        self.navigationItem.rightBarButtonItem=nil;
        
        self.hbtn.userInteractionEnabled = YES;
        
            }
    
}



- (void)set_btn
{

    //self.hidesBottomBarWhenPushed=YES;
    
    UIViewController *person_vc = [[PersonInformationViewController alloc]init];
    
    [self.navigationController pushViewController:person_vc animated:YES];
    
    //self.hidesBottomBarWhenPushed=NO;

}

-(void)mylogin
{
    LoginViewController *loginvc = [[LoginViewController alloc]init];
    
    [self presentViewController:loginvc animated:YES completion:^{}];

}

@end
