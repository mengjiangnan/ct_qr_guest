//
//  MainTabBarController.m
//  qinren_guest
//
//  Created by qin_ren on 7/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

-(void)setUpVc:(UIViewController *)vc setImage:(NSString *)normal setSelectImage:(NSString *)select setTitle:(NSString *)title;

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*批量设置uitabbaritem文字颜色*/
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    
    attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    NSMutableDictionary *SelectAttrs = [NSMutableDictionary dictionary];
    
    SelectAttrs[NSForegroundColorAttributeName] = [UIColor greenColor];
    
    UITabBarItem *item;
    item= [UITabBarItem appearance];
    
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    
    [item setTitleTextAttributes:SelectAttrs forState:UIControlStateSelected];
    
    
    /*用封装方法设置子视图*/
    
    [self setUpVc:[[UIViewController alloc]init] setImage:@"tab_bar_Image_index_noselect" setSelectImage:@"tab_bar_Image_index_select" setTitle:@"主页"];
    
    [self setUpVc:[[UIViewController alloc]init] setImage:@"tab_bar_Image_exchange_noselect" setSelectImage:@"tab_bar_Image_exchange_select" setTitle:@"交流群"];
    
    [self setUpVc:[[UIViewController alloc]init] setImage:@"tab_bar_Image_shopcar_noselect" setSelectImage:@"tab_bar_Image_shopcar_select" setTitle:@"购物车"];
    
    [self setUpVc:[[UIViewController alloc]init] setImage:@"tab_bar_Image_my_noselect" setSelectImage:@"tab_bar_Image_my_select" setTitle:@"我的"];
    
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


/*封装子视图*/

-(void)setUpVc:(UIViewController *)vc setImage:(NSString *)normal setSelectImage:(NSString *)select setTitle:(NSString *)title

{
    vc.tabBarItem.title = title;
    
    vc.tabBarItem.image = [UIImage imageNamed:normal];
    
    vc.tabBarItem.selectedImage = [UIImage imageNamed:select];
    
    vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
    [self addChildViewController:vc];

    
}




@end
