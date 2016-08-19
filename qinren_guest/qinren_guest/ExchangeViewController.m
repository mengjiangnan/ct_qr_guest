//
//  ExchangeViewController.m
//  qinren_guest
//
//  Created by qin_ren on 8/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "ExchangeViewController.h"

#import "HousekeeperExchangeViewController.h"

#import "AdministratorExchangeViewController.h"

#import "ProgressHUD.h"

@interface ExchangeViewController ()<UITableViewDataSource,UITableViewDelegate>

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
    
    UITableView *shop_table_view = [[UITableView alloc]initWithFrame:shop_table_view_rect style:UITableViewStyleGrouped];
    
    shop_table_view.dataSource = self;
    
    shop_table_view.delegate = self;
    
    [self.view addSubview:shop_table_view];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return 2;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"健康管理师群";
    }else if (indexPath.row == 1){
    
        cell.textLabel.text = @"健康管家群";
    }
    
    
    
    cell.imageView.image = [UIImage imageNamed:@"easemob_default_head_img"];
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    if (indexPath.row == 0) {
        
//        self.hidesBottomBarWhenPushed=YES;
//        
//        UIViewController *administrator_exchange_vc = [[AdministratorExchangeViewController alloc]init];
//        
//        [self.navigationController pushViewController:administrator_exchange_vc animated:YES];
//        
//        self.hidesBottomBarWhenPushed=NO;
        
        [ProgressHUD showError: @"对不起您没有交流群的权限！"];
        
    
    }else if (indexPath.row == 1){
        
//        self.hidesBottomBarWhenPushed=YES;
//        
//        UIViewController *housekeeper_exchange_vc = [[HousekeeperExchangeViewController alloc]init];
//        
//        [self.navigationController pushViewController:housekeeper_exchange_vc animated:YES];
//        
//        self.hidesBottomBarWhenPushed=NO;
        
        [ProgressHUD showError: @"对不起您没有交流群的权限！"];
    
    
    }
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
