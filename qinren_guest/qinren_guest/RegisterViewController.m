//
//  RegisterViewController.m
//  qinren_guest
//
//  Created by qin_ren on 16/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"注册";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    //会员帐号标签
    
    CGFloat member_accounts_label_x = self.view.frame.size.width * 0.1;
    
    CGFloat member_accounts_label_y = 84;
    
    CGFloat member_accounts_label_width = 0;
    
    CGFloat member_accounts_label_height = 0;
    
    CGRect  member_accounts_label_rect = CGRectMake(member_accounts_label_x, member_accounts_label_y, member_accounts_label_width, member_accounts_label_height);
    
    UILabel *member_accounts_label = [[UILabel alloc]initWithFrame:member_accounts_label_rect];
    
    member_accounts_label.text = @"会员帐号:";
    
    member_accounts_label.numberOfLines = 0;
    
    [member_accounts_label sizeToFit];
    
    [self.view addSubview:member_accounts_label];
    
    //会员帐号输入框
    
    CGFloat member_accounts_textfield_x = member_accounts_label_x + member_accounts_label.frame.size.width + 5;
    
    CGFloat member_accounts_textfield_y = 84;
    
    CGFloat member_accounts_textfield_width = self.view.frame.size.width * 0.5;
    
    CGFloat member_accounts_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect  member_accounts_textfield_rect = CGRectMake(member_accounts_textfield_x, member_accounts_textfield_y, member_accounts_textfield_width,
                                                        member_accounts_textfield_height);
    
    UITextField *member_accounts_textfield = [[UITextField alloc]initWithFrame:member_accounts_textfield_rect];
    
    member_accounts_textfield.placeholder = @"手机号/用户名/会员卡号";
    
    [self.view addSubview:member_accounts_textfield];

}


@end
