//
//  MealProjectViewController.m
//  qinren_guest
//
//  Created by qin_ren on 5/7/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "MealProjectViewController.h"

@interface MealProjectViewController ()

@end

@implementation MealProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"项目套餐";
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    //顶部第一个按钮
    
    UIButton *left_first_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    left_first_btn.frame = CGRectMake(0, 64, self.view.frame.size.width/3, self.view.frame.size.height/18);
    
    left_first_btn.backgroundColor = [UIColor whiteColor];
    
    [left_first_btn setTitle:@"高血压" forState:UIControlStateNormal];
    
    left_first_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [left_first_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [left_first_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [self.view addSubview:left_first_btn];
    
    //顶部第二个按钮
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    UIButton *mid_second_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    mid_second_btn.frame = CGRectMake(left_first_btn.frame.size.width, 64, self.view.frame.size.width/3, self.view.frame.size.height/18);
    
    mid_second_btn.backgroundColor = [UIColor whiteColor];
    
    [mid_second_btn setTitle:@"价格" forState:UIControlStateNormal];
    
    mid_second_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [mid_second_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [mid_second_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [self.view addSubview:mid_second_btn];
    
    //顶部第三个按钮
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    UIButton *last_third_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    last_third_btn.frame = CGRectMake(mid_second_btn.frame.size.width *2, 64, self.view.frame.size.width/3, self.view.frame.size.height/18);
    
    last_third_btn.backgroundColor = [UIColor whiteColor];
    
    [last_third_btn setTitle:@"上架时间" forState:UIControlStateNormal];
    
    last_third_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [last_third_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [last_third_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [self.view addSubview:last_third_btn];

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
