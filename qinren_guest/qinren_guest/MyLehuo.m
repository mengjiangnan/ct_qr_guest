//
//  MyLehuo.m
//  qinren_guest
//
//  Created by qin_ren on 16/8/9.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "MyLehuo.h"

#import "ExplainViewController.h"

#import "NSString+toHexString.h"

#import "MyLehuoList.h"

#import "MJExtension.h"

@interface MyLehuo ()

@property(nonatomic,strong)NSMutableArray *getusersigninarrm;

@property(nonatomic,strong)UILabel *mytotallehuofld;

@property(nonatomic,strong)UILabel *mydayfld;

@property(nonatomic,strong)UILabel *mynumberfld;

@property(nonatomic,strong)NSNumber *listcount;

@end

@implementation MyLehuo

-(void)viewDidLoad

{
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的乐活币";
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    //总乐活币标签
    
    UILabel *totallehuolab = [[UILabel alloc]initWithFrame:CGRectMake(10, 64+20, 80, 15)];
    
    totallehuolab.text = @"总乐活币:";
    
    totallehuolab.font = [UIFont systemFontOfSize:15.0];
    
    totallehuolab.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:totallehuolab];
    
    //总乐活币数量标签
    
    UILabel *totallehuofld = [[UILabel alloc]initWithFrame:CGRectMake(100, 64+20, 80, 15)];
    
    totallehuofld.textColor = [UIColor redColor];
    
    //totallehuofld.text = @"129R";
    
    totallehuofld.font = [UIFont systemFontOfSize:15.0];
    
    totallehuofld.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:totallehuofld];
    
    self.mytotallehuofld = totallehuofld;
    
    //使用说明按钮
    
    UIButton *explain_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    explain_btn.frame = CGRectMake(self.view.frame.size.width - 100, 64+20, 80, 15);
    
    explain_btn.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    [explain_btn setTitle:@"使用说明" forState:UIControlStateNormal];
    
    [explain_btn addTarget:self action:@selector(explain) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:explain_btn];
    
    //连续签到标签
    
    UILabel *signlab = [[UILabel alloc]initWithFrame:CGRectMake(10, 64+20+15+10, 80, 15)];
    
    signlab.text = @"连续签到:";
    
    signlab.font = [UIFont systemFontOfSize:15.0];
    
    signlab.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:signlab];
    
    //连续签到天数标签
    
    UILabel *dayfld = [[UILabel alloc]initWithFrame:CGRectMake(100, 64+20+15+10, 80, 15)];
    
    //dayfld.text = @"0天";
    
    dayfld.font = [UIFont systemFontOfSize:15.0];
    
    dayfld.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:dayfld];
    
    self.mydayfld = dayfld;

    //今日领取标签
    
    UILabel *getlab = [[UILabel alloc]initWithFrame:CGRectMake(10, 64+20+15+10+15+10, 80, 15)];
    
    getlab.text = @"今日领取:";
    
    getlab.font = [UIFont systemFontOfSize:15.0];
    
    getlab.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:getlab];
    
    //今日领取乐活币数量标签
    
    UILabel *numberfld = [[UILabel alloc]initWithFrame:CGRectMake(100, 64+20+15+10+15+10, 80, 15)];
    
    //numberfld.text = @"+8R";
    
    numberfld.font = [UIFont systemFontOfSize:15.0];
    
    numberfld.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:numberfld];
    
    self.mynumberfld = numberfld;
    
    //分割线
    
    UIView *lineview = [[UIView alloc]initWithFrame:CGRectMake(0, 64+20+15+10+15+10+15+20, self.view.frame.size.width, 1)];
    
    lineview.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:lineview];
    
    //签到按钮
    
    UIButton *signone_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    signone_btn.frame = CGRectMake(self.view.frame.size.width * 0.1, 64+20+15+10+15+10+15+20+20, 45, 45);
    
    [signone_btn setBackgroundImage:[UIImage imageNamed: @"hongbao"] forState:UIControlStateNormal];
    
    [signone_btn setTitle:@"签到" forState:UIControlStateNormal];
    
    [signone_btn addTarget:self action:@selector(signone) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:signone_btn];
    
    UIButton *signtwo_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    signtwo_btn.frame = CGRectMake(self.view.frame.size.width - self.view.frame.size.width * 0.1 - 45, 64+20+15+10+15+10+15+20+20, 45, 45);
    
    [signtwo_btn setBackgroundImage:[UIImage imageNamed: @"hongbao"] forState:UIControlStateNormal];
    
    [signtwo_btn setTitle:@"签到" forState:UIControlStateNormal];
    
    [self.view addSubview:signtwo_btn];
    
    UIButton *signthree_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    signthree_btn.frame = CGRectMake(self.view.frame.size.width * 0.1, 64+20+15+10+15+10+15+20+20+45+30, 45, 45);
    
    [signthree_btn setBackgroundImage:[UIImage imageNamed: @"hongbao"] forState:UIControlStateNormal];
    
    [signthree_btn setTitle:@"签到" forState:UIControlStateNormal];
    
    [self.view addSubview:signthree_btn];
    
    UIButton *signfour_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    signfour_btn.frame = CGRectMake(self.view.frame.size.width - self.view.frame.size.width * 0.1 - 45, 64+20+15+10+15+10+15+20+20+45+30, 45, 45);
    
    [signfour_btn setBackgroundImage:[UIImage imageNamed: @"hongbao"] forState:UIControlStateNormal];
    
    [signfour_btn setTitle:@"签到" forState:UIControlStateNormal];
    
    [self.view addSubview:signfour_btn];
    
    UIButton *signfive_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    signfive_btn.frame = CGRectMake(self.view.frame.size.width * 0.5 - 45 -20, 64+20+15+10+15+10+15+20+20, 45, 45);
    
    [signfive_btn setBackgroundImage:[UIImage imageNamed: @"hongbao"] forState:UIControlStateNormal];
    
    [signfive_btn setTitle:@"签到" forState:UIControlStateNormal];
    
    [self.view addSubview:signfive_btn];

    
    UIButton *signsix_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    signsix_btn.frame = CGRectMake(self.view.frame.size.width * 0.5 + 20, 64+20+15+10+15+10+15+20+20, 45, 45);
    
    [signsix_btn setBackgroundImage:[UIImage imageNamed: @"hongbao"] forState:UIControlStateNormal];
    
    [signsix_btn setTitle:@"签到" forState:UIControlStateNormal];
    
    [self.view addSubview:signsix_btn];
    
    
    UIButton *signseven_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    signseven_btn.frame = CGRectMake(self.view.frame.size.width * 0.5 - 45 -20, 64+20+15+10+15+10+15+20+20+45+30, 45, 45);
    
    [signseven_btn setBackgroundImage:[UIImage imageNamed: @"hongbao"] forState:UIControlStateNormal];
    
    [signseven_btn setTitle:@"签到" forState:UIControlStateNormal];
    
    [self.view addSubview:signseven_btn];
    
    
    UIButton *signeight_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    signeight_btn.frame = CGRectMake(self.view.frame.size.width * 0.5 + 20, 64+20+15+10+15+10+15+20+20+45+30, 45, 45);
    
    [signeight_btn setBackgroundImage:[UIImage imageNamed: @"hongbao"] forState:UIControlStateNormal];
    
    [signeight_btn setTitle:@"签到" forState:UIControlStateNormal];
    
    [self.view addSubview:signeight_btn];

    
    //读取用户uid
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *myuid = [defaults objectForKey:@"uid"];
    
    //网络请求
    
    NSString *getusersigninmethod = [NSString stringWithFormat:getusersignin];
    
    NSArray *getusersigninkeys = [[NSArray alloc]initWithObjects:@"uid", nil];
    
    NSArray *getusersigninvalues = [[NSArray alloc]initWithObjects:myuid, nil];
    
    NSString *getusersigninjson = [NSString Key:getusersigninkeys Value:getusersigninvalues];
    
    NSString *getusersigninurl = [NSString NOMethod:getusersigninmethod NOParams:getusersigninjson];
    
    // 快捷方式获得购物车列表的session对象
    
    NSURLSession *getusersigninsession = [NSURLSession sharedSession];
    
    NSURL *mysigninurl = [NSURL URLWithString:getusersigninurl];
    
    //[ProgressHUD show:@"请稍等..."];
    
    // 通过URL初始化task,在block内部可以直接对返回的数据进行处理
    
    NSURLSessionTask *getusersignintask = [getusersigninsession dataTaskWithURL:mysigninurl
                                             
                                                                  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                                      
                                                                      if (!error) {
                                                                          
                                                                          //[ProgressHUD dismiss];
                                                                          
                                                                          NSError *jsonerror;
                                                                          
                                                                          NSDictionary *getusersigninresponderdic = [NSJSONSerialization JSONObjectWithData:data options:  NSJSONReadingAllowFragments error:&jsonerror];
                                                                          
                                                                          if (!jsonerror) {
                                                                              
                                                                              self.getusersigninarrm = [MyLehuoList mj_objectArrayWithKeyValuesArray:getusersigninresponderdic[@"data"]];
                                                                              
                                                                              self.listcount = getusersigninresponderdic[@"total"];
                                                                              
                                                                              for (int i = 0; i < [self.listcount intValue]; i++) {
                                                                                  
                                                                                  MyLehuoList *mylehuolist = self.getusersigninarrm[i];
                                                                                  
                                                                                  self.mytotallehuofld.text = [NSString stringWithFormat:@"%@R",mylehuolist.customer_credits];
                                                                                  
                                                                                  self.mydayfld.text = [NSString stringWithFormat:@"%@天", mylehuolist.signnum];
                                                                                  
                                                                                  self.mynumberfld.text = [NSString stringWithFormat:@"%@R", mylehuolist.score];
                                                                                  
                                                                              }

                                                                              
                                                                          } else {
                                                                              
                                                                              NSString *getusersigninresponderjsonstr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                                              
                                                                              NSString *newgetusersigninresponderjsonstr =[NSString decryptUseDES:getusersigninresponderjsonstr key:mykey];
                                                                              
                                                                              NSDictionary *getusersigninresponderdic = [NSString parseJSONStringToNSDictionary:newgetusersigninresponderjsonstr];
                                                                              
                                                                              self.getusersigninarrm = [MyLehuoList mj_objectArrayWithKeyValuesArray:getusersigninresponderdic[@"data"]];
                                                                              
                                                                              
                                                                              
                                                                          }
                                                                      }
                                                                      
                                                                  }];
    
    // 启动左边任务
    [getusersignintask resume];

}


-(void)explain
{
    self.hidesBottomBarWhenPushed=YES;
    
    ExplainViewController *explain_vc = [[ExplainViewController alloc]init];
    
    [self.navigationController pushViewController:explain_vc animated:YES];
    
    self.hidesBottomBarWhenPushed=NO;

}

-(void)signone

{
    //读取用户uid
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *myuid = [defaults objectForKey:@"uid"];
    
    //网络请求
    
    NSString *getusersigninmethod = [NSString stringWithFormat:getusersignin];
    
    NSArray *getusersigninkeys = [[NSArray alloc]initWithObjects:@"integral",@"uid", nil];
    
    NSArray *getusersigninvalues = [[NSArray alloc]initWithObjects:@"8",myuid, nil];
    
    NSString *getusersigninjson = [NSString Key:getusersigninkeys Value:getusersigninvalues];
    
    NSString *getusersigninurl = [NSString NOMethod:getusersigninmethod NOParams:getusersigninjson];
    
    //同步请求
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:getusersigninurl] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    
    NSData *received = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
    
    NSString *getusersigninresponderjsonstr = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    
    NSDictionary *getusersigninresponder = [NSString parseJSONStringToNSDictionary:getusersigninresponderjsonstr];
    
    NSLog(@"%@",getusersigninresponder);



}

@end
