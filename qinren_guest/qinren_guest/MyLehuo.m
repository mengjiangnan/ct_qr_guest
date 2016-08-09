//
//  MyLehuo.m
//  qinren_guest
//
//  Created by qin_ren on 16/8/9.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "MyLehuo.h"

@implementation MyLehuo

-(void)viewDidLoad

{
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
    
    totallehuofld.text = @"129R";
    
    totallehuofld.font = [UIFont systemFontOfSize:15.0];
    
    totallehuofld.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:totallehuofld];
    
    //连续签到标签
    
    UILabel *signlab = [[UILabel alloc]initWithFrame:CGRectMake(10, 64+20+15+10, 80, 15)];
    
    signlab.text = @"连续签到:";
    
    signlab.font = [UIFont systemFontOfSize:15.0];
    
    signlab.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:signlab];
    
    //连续签到天数标签
    
    UILabel *dayfld = [[UILabel alloc]initWithFrame:CGRectMake(100, 64+20+15+10, 80, 15)];
    
    dayfld.text = @"0天";
    
    dayfld.font = [UIFont systemFontOfSize:15.0];
    
    dayfld.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:dayfld];

    //今日领取标签
    
    UILabel *getlab = [[UILabel alloc]initWithFrame:CGRectMake(10, 64+20+15+10+15+10, 80, 15)];
    
    getlab.text = @"今日领取:";
    
    getlab.font = [UIFont systemFontOfSize:15.0];
    
    getlab.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:getlab];
    
    //今日领取乐活币数量标签
    
    UILabel *numberfld = [[UILabel alloc]initWithFrame:CGRectMake(100, 64+20+15+10+15+10, 80, 15)];
    
    numberfld.text = @"+8R";
    
    numberfld.font = [UIFont systemFontOfSize:15.0];
    
    numberfld.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:numberfld];


}


@end
