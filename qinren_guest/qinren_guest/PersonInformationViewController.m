//
//  PersonInformationViewController.m
//  qinren_guest
//
//  Created by qin_ren on 23/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "PersonInformationViewController.h"

@interface PersonInformationViewController ()

@end

@implementation PersonInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"个人信息";
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    UIButton *my_information_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    CGFloat my_information_btn_x = 0;
    
    CGFloat my_information_btn_y = 84;
    
    CGFloat my_information_btn_width = self.view.frame.size.width;
    
    CGFloat my_information_btn_height = self.view.frame.size.height * 0.15;
    
    CGRect my_information_btn_rect = CGRectMake(my_information_btn_x, my_information_btn_y, my_information_btn_width, my_information_btn_height);
    
    my_information_btn = [[UIButton alloc]initWithFrame:my_information_btn_rect];
    
    my_information_btn.backgroundColor = [UIColor whiteColor];
    
    [my_information_btn setImage:[UIImage imageNamed:@"myset_my_head_img"] forState:UIControlStateNormal];
    
    my_information_btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, self.view.frame.size.width * 0.2);
    
    [my_information_btn setTitle:@"罗忠 手机号:18808680413" forState:UIControlStateNormal];
    
    my_information_btn.titleLabel.font = [UIFont systemFontOfSize:10.0];
    
    [my_information_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [my_information_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [self.view addSubview:my_information_btn];
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

@end
