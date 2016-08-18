//
//  PersonInformationViewController.m
//  qinren_guest
//
//  Created by qin_ren on 23/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "PersonInformationViewController.h"

#import "MyViewController.h"

#import "ProgressHUD.h"

@interface PersonInformationViewController ()

@end

@implementation PersonInformationViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"个人信息";
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    //按钮间的固定高度
    
    CGFloat const_height = 5;
    
    //按钮固定宽度
    
    CGFloat btn_const_width = self.view.frame.size.width;
    
    //按钮固定高度
    
    CGFloat btn_const_height = self.view.frame.size.height * 0.1;
    
    //按钮固定x值
    
    CGFloat btn_const_x = 0;
    
    //个人信息按钮
    
    UIButton *my_information_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    CGFloat my_information_btn_x = btn_const_x;
    
    CGFloat my_information_btn_y = 84;
    
    CGFloat my_information_btn_width = btn_const_width;
    
    CGFloat my_information_btn_height = self.view.frame.size.height * 0.15;
    
    CGRect my_information_btn_rect = CGRectMake(my_information_btn_x, my_information_btn_y, my_information_btn_width, my_information_btn_height);
    
    my_information_btn = [[UIButton alloc]initWithFrame:my_information_btn_rect];
    
    my_information_btn.backgroundColor = [UIColor whiteColor];
    
    [my_information_btn setImage:[UIImage imageNamed:@"myset_my_head_img"] forState:UIControlStateNormal];
    
    my_information_btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, btn_const_height * 0.2);
    
    //个人信息获取
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *nickname = [defaults objectForKey:@"nickname"];
    
    NSString *phone = [defaults objectForKey:@"phone"];
    
    NSString *info = [NSString stringWithFormat:@"%@ 手机号:%@",nickname,phone];
    
    [my_information_btn setTitle:info forState:UIControlStateNormal];
    
    my_information_btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    
    [my_information_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [my_information_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [self.view addSubview:my_information_btn];
    
    //个性签名按钮
    
    UIButton *signature_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    CGFloat signature_btn_x = btn_const_x;
    
    CGFloat signature_btn_y = my_information_btn_y + my_information_btn.frame.size.height + const_height;
    
    CGFloat signature_btn_width = btn_const_width;
    
    CGFloat signature_btn_height = btn_const_height;
    
    CGRect signature_btn_rect = CGRectMake(signature_btn_x, signature_btn_y, signature_btn_width, signature_btn_height);
    
    signature_btn = [[UIButton alloc]initWithFrame:signature_btn_rect];
    
    signature_btn.backgroundColor = [UIColor whiteColor];
    
    [signature_btn setTitle:@"个性签名:大家发财" forState:UIControlStateNormal];
    
    signature_btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    
    [signature_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [signature_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [self.view addSubview:signature_btn];
    
    //修改密码按钮
    
    UIButton *change_pwd_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    CGFloat change_pwd_btn_x = btn_const_x;
    
    CGFloat change_pwd_btn_y = signature_btn_y + btn_const_height + const_height;
    
    CGFloat change_pwd_btn_width =btn_const_width;
    
    CGFloat change_pwd_btn_height = btn_const_height;
    
    CGRect change_pwd_btn_rect = CGRectMake(change_pwd_btn_x, change_pwd_btn_y, change_pwd_btn_width, change_pwd_btn_height);
    
    change_pwd_btn = [[UIButton alloc]initWithFrame:change_pwd_btn_rect];
    
    change_pwd_btn.backgroundColor = [UIColor whiteColor];
    
    [change_pwd_btn setTitle:@"修改密码" forState:UIControlStateNormal];
    
    change_pwd_btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    
    [change_pwd_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [change_pwd_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [change_pwd_btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:change_pwd_btn];
    
    //关于乐活小管家按钮
    
    UIButton *about_me_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    CGFloat about_me_btn_x = btn_const_x;
    
    CGFloat about_me_btn_y = change_pwd_btn_y + btn_const_height + const_height;
    
    CGFloat about_me_btn_width = btn_const_width;
    
    CGFloat about_me_btn_height = btn_const_height;
    
    CGRect about_me_btn_rect = CGRectMake(about_me_btn_x, about_me_btn_y, about_me_btn_width, about_me_btn_height);
    
    about_me_btn = [[UIButton alloc]initWithFrame:about_me_btn_rect];
    
    about_me_btn.backgroundColor = [UIColor whiteColor];
    
    [about_me_btn setTitle:@"关于乐活小管家" forState:UIControlStateNormal];
    
    about_me_btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    
    [about_me_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [about_me_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [about_me_btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:about_me_btn];
    
    //退出登录按钮
    
    UIButton *logout_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    CGFloat logout_btn_x = btn_const_x;
    
    CGFloat logout_btn_y = about_me_btn_y + btn_const_height + const_height;
    
    CGFloat logout_btn_width = btn_const_width;
    
    CGFloat logout_btn_height = btn_const_height;
    
    CGRect logout_btn_rect = CGRectMake(logout_btn_x, logout_btn_y, logout_btn_width, logout_btn_height);
    
    logout_btn = [[UIButton alloc]initWithFrame:logout_btn_rect];
    
    logout_btn.backgroundColor = [UIColor redColor];
    
    [logout_btn setTitle:@"退出登录" forState:UIControlStateNormal];
    
    logout_btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    
    [logout_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [logout_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [logout_btn addTarget:self action:@selector(loginout) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:logout_btn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//退出登录

-(void)loginout{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    //移除uid
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"uid"];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"nickname"];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"phone"];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"emissary_phone"];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"housekeeper_phone"];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"realname"];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"sex"];
      
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)test
{
    
    [ProgressHUD showError: @"此功能下一版本开放！"];


}

@end
