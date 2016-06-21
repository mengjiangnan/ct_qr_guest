//
//  MyViewController.m
//  qinren_guest
//
//  Created by qin_ren on 21/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()



@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的信息";
    
    //设置整个项目的item状态
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置item普通状态
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain
                                                                             target:self action:@selector(set_btn)];
    
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
    
    //[myhead_btn setTitleColor:[UIColor greenColor]forState:UIControlStateNormal];
    
    [myhead_btn setBackgroundImage:[UIImage imageNamed:@"h4"] forState:UIControlStateNormal];
    
    [self.view addSubview:myhead_btn];
    
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
    
    [self.view addSubview:mycollect_btn];

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

    [self.view addSubview:myintegral_btn];
    
    //全部订单标签
    
    UILabel *all_order_label = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width *0.1, 84 + myhead_btn.frame.size.height + 20 + myintegral_btn.frame.size.height +10, 0, 0)];
    
    all_order_label.text = @"全部订单";
    
    all_order_label.numberOfLines = 0;
    
    [all_order_label sizeToFit];

    [self.view addSubview:all_order_label];
    
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
    
    [self.view addSubview:wait_pay_btn];
    
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
    
    [self.view addSubview:wait_sip_btn];
    
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
    
    [self.view addSubview:wait_receipt_btn];
    
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
    
    [self.view addSubview:wait_appraise_btn];




}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)set_btn
{

    NSLog(@"set_btn");
}

@end
