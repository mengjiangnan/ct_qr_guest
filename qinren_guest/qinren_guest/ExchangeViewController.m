//
//  ExchangeViewController.m
//  qinren_guest
//
//  Created by qin_ren on 8/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "ExchangeViewController.h"

@interface ExchangeViewController ()

@end

@implementation ExchangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"交流";
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    CGFloat shop_table_view_x = 0;
    
    CGFloat shop_table_view_y = 0;
    
    CGFloat shop_table_view_width = self.view.frame.size.width;
    
    CGFloat shop_table_view_height = self.view.frame.size.height + 30;
    
    CGRect shop_table_view_rect = CGRectMake(shop_table_view_x, shop_table_view_y, shop_table_view_width, shop_table_view_height);
    
    UITableView *shop_table_view = [[UITableView alloc]initWithFrame:shop_table_view_rect style:UITableViewStylePlain];
    
    [self.view addSubview:shop_table_view];

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
