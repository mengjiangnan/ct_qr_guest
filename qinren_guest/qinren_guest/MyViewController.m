//
//  MyViewController.m
//  qinren_guest
//
//  Created by qin_ren on 8/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"登录";
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    //圆形按钮
    
    CGFloat myhead_btn_x = self.view.frame.size.width * 0.5 -60;
    
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
    
    //用户名登录框
    
    CGFloat username_field_x = self.view.frame.size.width * 0.5 - (self.view.frame.size.width * 0.8 * 0.5);
    
    CGFloat username_field_y = myhead_btn_y + myhead_btn.frame.size.height + 25;
    
    CGFloat username_field_width = self.view.frame.size.width * 0.8;
    
    CGFloat username_field_height = 35;
    
    UITextField *username_field = [[UITextField alloc]initWithFrame:CGRectMake(username_field_x, username_field_y, username_field_width, username_field_height)];
    
    [username_field setBorderStyle:UITextBorderStyleRoundedRect];
    
    username_field.placeholder = @"请输入手机号码";
    
    [self.view addSubview:username_field];
    
    //密码输入框
    
    CGFloat pwd_field_x = self.view.frame.size.width * 0.5 - (self.view.frame.size.width * 0.8 * 0.5);
    
    CGFloat pwd_field_y = myhead_btn_y + myhead_btn.frame.size.height + 25 + username_field.frame.size.height + 12.5;
    
    CGFloat pwd_field_width = self.view.frame.size.width * 0.8;
    
    CGFloat pwd_field_height = 35;
    
    UITextField *pwd_field = [[UITextField alloc]initWithFrame:CGRectMake(pwd_field_x, pwd_field_y, pwd_field_width, pwd_field_height)];
    
    [pwd_field setBorderStyle:UITextBorderStyleRoundedRect];
    
    pwd_field.placeholder = @"请输入您的密码";
    
    [self.view addSubview:pwd_field];
    
    
}


@end
