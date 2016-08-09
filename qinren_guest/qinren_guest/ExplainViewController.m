//
//  ExplainViewController.m
//  qinren_guest
//
//  Created by qin_ren on 16/8/9.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "ExplainViewController.h"

@interface ExplainViewController ()

@end

@implementation ExplainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"使用说明";
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    UIWebView *explainview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    NSURL *url = [[NSURL alloc]initWithString:@"http://www.qrgs360.com:8087/app/healthscore.html"];
    
    [explainview loadRequest:[NSURLRequest requestWithURL:url]];
    
    [self.view addSubview:explainview];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
