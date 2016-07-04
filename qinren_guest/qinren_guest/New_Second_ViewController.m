//
//  New_Second_ViewController.m
//  qinren_guest
//
//  Created by qin_ren on 4/7/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "New_Second_ViewController.h"

@interface New_Second_ViewController ()

@end

@implementation New_Second_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIWebView *webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    NSURL *url_new_01 = [[NSURL alloc]initWithString:@"http://223.4.32.216:8087/app/healthnewsdetail.aspx?id=20160307130926"];
    
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
