//
//  MainTabBarController.m
//  qinren_guest
//
//  Created by qin_ren on 7/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIViewController *vc1;
    vc1= [[UIViewController alloc]init];
    
    vc1.view.backgroundColor = [UIColor redColor];
    
    UINavigationController *nav1;
    nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    
    vc1.navigationItem.title = @"主页";
    
    vc1.tabBarItem.title = @"主页";
    
    vc1.tabBarItem.image = [UIImage imageNamed:@"tab_bar_Image_index_noselect"];
    
    vc1.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_bar_Image_index_select"];
    
    NSMutableDictionary *v1attrs = [NSMutableDictionary dictionary];
    
    v1attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    [vc1.tabBarItem setTitleTextAttributes:v1attrs forState:UIControlStateNormal];
    
    NSMutableDictionary *v1SelectAttrs = [NSMutableDictionary dictionary];
    
    v1SelectAttrs[NSForegroundColorAttributeName] = [UIColor greenColor];
    
    [vc1.tabBarItem setTitleTextAttributes:v1SelectAttrs forState:UIControlStateSelected];
    
    [self addChildViewController:nav1];
    
    
    UIViewController *vc2;
    vc2= [[UIViewController alloc]init];
    
    vc2.view.backgroundColor = [UIColor yellowColor];
    
    UINavigationController *nav2;
    nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    
    vc2.navigationItem.title = @"交流群";
    
    vc2.tabBarItem.title = @"交流群";
    
    vc2.tabBarItem.image = [UIImage imageNamed:@"tab_bar_Image_exchange_noselect"];
    
    vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_bar_Image_exchange_select"];
    
    NSMutableDictionary *v2attrs = [NSMutableDictionary dictionary];
    
    v2attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    [vc2.tabBarItem setTitleTextAttributes:v2attrs forState:UIControlStateNormal];
    
    NSMutableDictionary *v2SelectAttrs = [NSMutableDictionary dictionary];
    
    v2SelectAttrs[NSForegroundColorAttributeName] = [UIColor greenColor];
    
    [vc2.tabBarItem setTitleTextAttributes:v2SelectAttrs forState:UIControlStateSelected];
    
    [self addChildViewController:nav2];
    
    
    UIViewController *vc3;
    vc3= [[UIViewController alloc]init];
    
    vc3.view.backgroundColor = [UIColor blueColor];
    
    UINavigationController *nav3;
    nav3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    
    vc3.navigationItem.title = @"购物车";
    
    vc3.tabBarItem.title = @"购物车";
    
    vc3.tabBarItem.image = [UIImage imageNamed:@"tab_bar_Image_shopcar_noselect"];
    
    vc3.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_bar_Image_shopcar_select"];

    NSMutableDictionary *vc3attrs = [NSMutableDictionary dictionary];
    
    vc3attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    [vc3.tabBarItem setTitleTextAttributes:vc3attrs forState:UIControlStateNormal];
    
    NSMutableDictionary *vc3SelectAttrs = [NSMutableDictionary dictionary];
    
    vc3SelectAttrs[NSForegroundColorAttributeName] = [UIColor greenColor];
    
    [vc3.tabBarItem setTitleTextAttributes:vc3SelectAttrs forState:UIControlStateSelected];
    
    [self addChildViewController:nav3];
    
    
    UIViewController *vc4;
    vc4= [[UIViewController alloc]init];
    
    vc4.view.backgroundColor = [UIColor greenColor];
    
    UINavigationController *nav4;
    nav4 = [[UINavigationController alloc]initWithRootViewController:vc4];
    
    vc4.navigationItem.title = @"我的";
    
    vc4.tabBarItem.title = @"我的";
    
    vc4.tabBarItem.image = [UIImage imageNamed:@"tab_bar_Image_my_noselect"];
    
    vc4.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_bar_Image_my_select"];
    
    NSMutableDictionary *vc4attrs = [NSMutableDictionary dictionary];
    
    vc4attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    [vc3.tabBarItem setTitleTextAttributes:vc4attrs forState:UIControlStateNormal];
    
    NSMutableDictionary *vc4SelectAttrs = [NSMutableDictionary dictionary];
    
    vc4SelectAttrs[NSForegroundColorAttributeName] = [UIColor greenColor];
    
    [vc4.tabBarItem setTitleTextAttributes:vc3SelectAttrs forState:UIControlStateSelected];
    
    [self addChildViewController:nav4];
    
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
