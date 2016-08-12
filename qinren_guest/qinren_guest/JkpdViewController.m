//
//  JkpdViewController.m
//  qinren_guest
//
//  Created by qin_ren on 16/8/12.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "JkpdViewController.h"

@interface JkpdViewController ()

@end

@implementation JkpdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"健康频道";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIWebView *webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    NSURL *url_new_01 = [[NSURL alloc]initWithString:@"http://www.qrgs360.com:8087/app/healthnews.aspx"];
    
    [webview loadRequest:[NSURLRequest requestWithURL:url_new_01]];
    
    [self.view addSubview:webview];

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