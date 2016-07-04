//
//  HealthShopIndexViewController.m
//  qinren_guest
//
//  Created by qin_ren on 4/7/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "HealthShopIndexViewController.h"

@interface HealthShopIndexViewController ()

@end

@implementation HealthShopIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"健康商城";
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    UIView *topview = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 180)];
    
    topview.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:topview];
    
    UIButton *gxy_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    gxy_btn.frame = CGRectMake(10, 0, (topview.frame.size.width - 10)/6, topview.frame.size.height/2);
    
    [gxy_btn setImage:[UIImage imageNamed:@"health_shop_gxy"] forState:UIControlStateNormal];
    
    gxy_btn.backgroundColor = [UIColor whiteColor];
    
    [topview addSubview:gxy_btn];
    
    UILabel *gxy_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, gxy_btn.frame.size.width, 10)];
    
    gxy_lab.text = @"高血压";
    
    gxy_lab.font = [UIFont systemFontOfSize:10.0];
    
    gxy_lab.textAlignment = NSTextAlignmentCenter;
    
    [gxy_btn addSubview:gxy_lab];

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
