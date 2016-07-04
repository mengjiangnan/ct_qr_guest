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
    
    //顶部view
    
    UIView *topview = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 180)];
    
    topview.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:topview];
    
    //高血压按钮
    
    UIButton *gxy_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    gxy_btn.frame = CGRectMake(0, 0, (topview.frame.size.width - 10)/6, topview.frame.size.height/2);
    
    [gxy_btn setImage:[UIImage imageNamed:@"health_shop_gxy"] forState:UIControlStateNormal];
    
    gxy_btn.backgroundColor = [UIColor whiteColor];
    
    [topview addSubview:gxy_btn];
    
    //高血压按钮标签
    
    UILabel *gxy_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, gxy_btn.frame.size.width, 10)];
    
    gxy_lab.text = @"高血压";
    
    gxy_lab.font = [UIFont systemFontOfSize:10.0];
    
    gxy_lab.textAlignment = NSTextAlignmentCenter;
    
    [gxy_btn addSubview:gxy_lab];
    
    //糖尿病按钮
    
    UIButton *tnb_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    tnb_btn.frame = CGRectMake(gxy_btn.frame.size.width, 0, (topview.frame.size.width - 10)/6, topview.frame.size.height/2);
    
    [tnb_btn setImage:[UIImage imageNamed:@"health_shop_tnb"] forState:UIControlStateNormal];
    
    tnb_btn.backgroundColor = [UIColor whiteColor];
    
    [topview addSubview:tnb_btn];
    
    //糖尿病按钮标签
    
    UILabel *tnb_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, gxy_btn.frame.size.width, 10)];
    
    tnb_lab.text = @"糖尿病";
    
    tnb_lab.font = [UIFont systemFontOfSize:10.0];
    
    tnb_lab.textAlignment = NSTextAlignmentCenter;
    
    [tnb_btn addSubview:tnb_lab];
    
    //高血脂按钮
    
    UIButton *gxz_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    gxz_btn.frame = CGRectMake(gxy_btn.frame.size.width *2, 0, (topview.frame.size.width - 10)/6, topview.frame.size.height/2);
    
    [gxz_btn setImage:[UIImage imageNamed:@"health_shop_gxz"] forState:UIControlStateNormal];
    
    gxz_btn.backgroundColor = [UIColor whiteColor];
    
    [topview addSubview:gxz_btn];
    
    //高血脂按钮标签
    
    UILabel *gxz_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, gxy_btn.frame.size.width, 10)];
    
    gxz_lab.text = @"高血脂";
    
    gxz_lab.font = [UIFont systemFontOfSize:10.0];
    
    gxz_lab.textAlignment = NSTextAlignmentCenter;
    
    [gxz_btn addSubview:gxz_lab];
    
    //骨关节按钮
    
    UIButton *ggj_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    ggj_btn.frame = CGRectMake(gxy_btn.frame.size.width *3, 0, (topview.frame.size.width - 10)/6, topview.frame.size.height/2);
    
    [ggj_btn setImage:[UIImage imageNamed:@"health_shop_ggj"] forState:UIControlStateNormal];
    
    ggj_btn.backgroundColor = [UIColor whiteColor];
    
    [topview addSubview:ggj_btn];
    
    //骨关节按钮标签
    
    UILabel *ggj_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, gxy_btn.frame.size.width, 10)];
    
    ggj_lab.text = @"骨关节";
    
    ggj_lab.font = [UIFont systemFontOfSize:10.0];
    
    ggj_lab.textAlignment = NSTextAlignmentCenter;
    
    [ggj_btn addSubview:ggj_lab];
    
    //抗衰老按钮
    
    UIButton *ksl_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    ksl_btn.frame = CGRectMake(gxy_btn.frame.size.width *4, 0, (topview.frame.size.width - 10)/6, topview.frame.size.height/2);
    
    [ksl_btn setImage:[UIImage imageNamed:@"health_shop_ksl"] forState:UIControlStateNormal];
    
    ksl_btn.backgroundColor = [UIColor whiteColor];
    
    [topview addSubview:ksl_btn];
    
    //抗衰老按钮标签
    
    UILabel *ksl_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, gxy_btn.frame.size.width, 10)];
    
    ksl_lab.text = @"抗衰老";
    
    ksl_lab.font = [UIFont systemFontOfSize:10.0];
    
    ksl_lab.textAlignment = NSTextAlignmentCenter;
    
    [ksl_btn addSubview:ksl_lab];
    
    //减肥按钮
    
    UIButton *jf_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    jf_btn.frame = CGRectMake(gxy_btn.frame.size.width *5, 0, (topview.frame.size.width - 10)/6, topview.frame.size.height/2);
    
    [jf_btn setImage:[UIImage imageNamed:@"health_shop_jf"] forState:UIControlStateNormal];
    
    jf_btn.backgroundColor = [UIColor whiteColor];
    
    [topview addSubview:jf_btn];
    
    //减肥按钮标签
    
    UILabel *jf_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, gxy_btn.frame.size.width, 10)];
    
    jf_lab.text = @"减肥";
    
    jf_lab.font = [UIFont systemFontOfSize:10.0];
    
    jf_lab.textAlignment = NSTextAlignmentCenter;
    
    [jf_btn addSubview:jf_lab];
    
    //失眠按钮
    
    UIButton *sm_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    sm_btn.frame = CGRectMake(0, topview.frame.size.height/2, (topview.frame.size.width - 10)/6, topview.frame.size.height/2);
    
    [sm_btn setImage:[UIImage imageNamed:@"health_shop_sm"] forState:UIControlStateNormal];
    
    sm_btn.backgroundColor = [UIColor whiteColor];
    
    [topview addSubview:sm_btn];
    
    //失眠按钮标签
    
    UILabel *sm_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, gxy_btn.frame.size.width, 10)];
    
    sm_lab.text = @"失眠";
    
    sm_lab.font = [UIFont systemFontOfSize:10.0];
    
    sm_lab.textAlignment = NSTextAlignmentCenter;
    
    [sm_btn addSubview:sm_lab];
    
    //抑郁按钮
    
    UIButton *yy_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    yy_btn.frame = CGRectMake(gxy_btn.frame.size.width, topview.frame.size.height/2, (topview.frame.size.width - 10)/6, topview.frame.size.height/2);
    
    [yy_btn setImage:[UIImage imageNamed:@"health_shop_yy"] forState:UIControlStateNormal];
    
    yy_btn.backgroundColor = [UIColor whiteColor];
    
    [topview addSubview:yy_btn];
    
    //抑郁按钮标签
    
    UILabel *yy_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, gxy_btn.frame.size.width, 10)];
    
    yy_lab.text = @"抑郁";
    
    yy_lab.font = [UIFont systemFontOfSize:10.0];
    
    yy_lab.textAlignment = NSTextAlignmentCenter;
    
    [yy_btn addSubview:yy_lab];
    
    //免疫力按钮
    
    UIButton *myl_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    myl_btn.frame = CGRectMake(gxy_btn.frame.size.width *2, topview.frame.size.height/2, (topview.frame.size.width - 10)/6, topview.frame.size.height/2);
    
    [myl_btn setImage:[UIImage imageNamed:@"health_shop_myl"] forState:UIControlStateNormal];
    
    myl_btn.backgroundColor = [UIColor whiteColor];
    
    [topview addSubview:myl_btn];
    
    //免疫力按钮标签
    
    UILabel *myl_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, gxy_btn.frame.size.width, 10)];
    
    myl_lab.text = @"免疫力";
    
    myl_lab.font = [UIFont systemFontOfSize:10.0];
    
    myl_lab.textAlignment = NSTextAlignmentCenter;
    
    [myl_btn addSubview:myl_lab];
    
    //视力保护按钮
    
    UIButton *slbh_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    slbh_btn.frame = CGRectMake(gxy_btn.frame.size.width *3, topview.frame.size.height/2, (topview.frame.size.width - 10)/6, topview.frame.size.height/2);
    
    [slbh_btn setImage:[UIImage imageNamed:@"health_shop_slbh"] forState:UIControlStateNormal];
    
    slbh_btn.backgroundColor = [UIColor whiteColor];
    
    [topview addSubview:slbh_btn];
    
    //视力保护按钮标签
    
    UILabel *slbh_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, gxy_btn.frame.size.width, 10)];
    
    slbh_lab.text = @"视力保护";
    
    slbh_lab.font = [UIFont systemFontOfSize:10.0];
    
    slbh_lab.textAlignment = NSTextAlignmentCenter;
    
    [slbh_btn addSubview:slbh_lab];
    
    //胃肠道按钮
    
    UIButton *wcd_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    wcd_btn.frame = CGRectMake(gxy_btn.frame.size.width *4, topview.frame.size.height/2, (topview.frame.size.width - 10)/6, topview.frame.size.height/2);
    
    [wcd_btn setImage:[UIImage imageNamed:@"health_shop_wcd"] forState:UIControlStateNormal];
    
    wcd_btn.backgroundColor = [UIColor whiteColor];
    
    [topview addSubview:wcd_btn];
    
    //胃肠道按钮标签
    
    UILabel *wcd_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, gxy_btn.frame.size.width, 10)];
    
    wcd_lab.text = @"胃肠道";
    
    wcd_lab.font = [UIFont systemFontOfSize:10.0];
    
    wcd_lab.textAlignment = NSTextAlignmentCenter;
    
    [wcd_btn addSubview:wcd_lab];
    
    //慢阻肺按钮
    
    UIButton *mzf_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    mzf_btn.frame = CGRectMake(gxy_btn.frame.size.width *5, topview.frame.size.height/2, (topview.frame.size.width - 10)/6, topview.frame.size.height/2);
    
    [mzf_btn setImage:[UIImage imageNamed:@"health_shop_mzf"] forState:UIControlStateNormal];
    
    mzf_btn.backgroundColor = [UIColor whiteColor];
    
    [topview addSubview:mzf_btn];
    
    //慢阻肺按钮标签
    
    UILabel *mzf_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, gxy_btn.frame.size.width, 10)];
    
    mzf_lab.text = @"慢阻肺";
    
    mzf_lab.font = [UIFont systemFontOfSize:10.0];
    
    mzf_lab.textAlignment = NSTextAlignmentCenter;
    
    [mzf_btn addSubview:mzf_lab];
    
    //中间的view
    
    UIView *midview = [[UIView alloc]initWithFrame:CGRectMake(0, 64 + topview.frame.size.height+2, self.view.frame.size.width, topview.frame.size.height * 0.65)];
    
    midview.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:midview];
    
    //健康食品按钮
    
    UIButton *jksp_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    jksp_btn.frame = CGRectMake(0, 0, midview.frame.size.width/5, topview.frame.size.height/2);
    
    [jksp_btn setImage:[UIImage imageNamed:@"health_shop_jksp"] forState:UIControlStateNormal];
    
    jksp_btn.backgroundColor = [UIColor whiteColor];
    
    [midview addSubview:jksp_btn];
    
    //健康食品按钮标签
    
    UILabel *jksp_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, jksp_btn.frame.size.width, 10)];
    
    jksp_lab.text = @"健康食品";
    
    jksp_lab.font = [UIFont systemFontOfSize:10.0];
    
    jksp_lab.textAlignment = NSTextAlignmentCenter;
    
    [jksp_btn addSubview:jksp_lab];
    
    //健康用品按钮
    
    UIButton *jkyp_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    jkyp_btn.frame = CGRectMake(jksp_btn.frame.size.width, 0, midview.frame.size.width/5, topview.frame.size.height/2);
    
    [jkyp_btn setImage:[UIImage imageNamed:@"health_shop_jkyp"] forState:UIControlStateNormal];
    
    jkyp_btn.backgroundColor = [UIColor whiteColor];
    
    [midview addSubview:jkyp_btn];
    
    //健康用品按钮标签
    
    UILabel *jkyp_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, jksp_btn.frame.size.width, 10)];
    
    jkyp_lab.text = @"健康用品";
    
    jkyp_lab.font = [UIFont systemFontOfSize:10.0];
    
    jkyp_lab.textAlignment = NSTextAlignmentCenter;
    
    [jkyp_btn addSubview:jkyp_lab];
    
    //健康器材按钮
    
    UIButton *jkqc_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    jkqc_btn.frame = CGRectMake(jksp_btn.frame.size.width*2, 0, midview.frame.size.width/5, topview.frame.size.height/2);
    
    [jkqc_btn setImage:[UIImage imageNamed:@"health_shop_jkqc"] forState:UIControlStateNormal];
    
    jkqc_btn.backgroundColor = [UIColor whiteColor];
    
    [midview addSubview:jkqc_btn];
    
    //健康器材按钮标签
    
    UILabel *jkqc_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, jksp_btn.frame.size.width, 10)];
    
    jkqc_lab.text = @"健康器材";
    
    jkqc_lab.font = [UIFont systemFontOfSize:10.0];
    
    jkqc_lab.textAlignment = NSTextAlignmentCenter;
    
    [jkqc_btn addSubview:jkqc_lab];
    
    //社区团购按钮
    
    UIButton *sqtg_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    sqtg_btn.frame = CGRectMake(jksp_btn.frame.size.width*3, 0, midview.frame.size.width/5, topview.frame.size.height/2);
    
    [sqtg_btn setImage:[UIImage imageNamed:@"health_shop_sqtg"] forState:UIControlStateNormal];
    
    sqtg_btn.backgroundColor = [UIColor whiteColor];
    
    [midview addSubview:sqtg_btn];
    
    //社区团购按钮标签
    
    UILabel *sqtg_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, jksp_btn.frame.size.width, 10)];
    
    sqtg_lab.text = @"社区团购";
    
    sqtg_lab.font = [UIFont systemFontOfSize:10.0];
    
    sqtg_lab.textAlignment = NSTextAlignmentCenter;
    
    [sqtg_btn addSubview:sqtg_lab];
    
    //积分商城按钮
    
    UIButton *jfsc_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    jfsc_btn.frame = CGRectMake(jksp_btn.frame.size.width*4, 0, midview.frame.size.width/5, topview.frame.size.height/2);
    
    [jfsc_btn setImage:[UIImage imageNamed:@"health_shop_jfsc"] forState:UIControlStateNormal];
    
    jfsc_btn.backgroundColor = [UIColor whiteColor];
    
    [midview addSubview:jfsc_btn];
    
    //积分商城按钮标签
    
    UILabel *jfsc_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, jksp_btn.frame.size.width, 10)];
    
    jfsc_lab.text = @"积分商城";
    
    jfsc_lab.font = [UIFont systemFontOfSize:10.0];
    
    jfsc_lab.textAlignment = NSTextAlignmentCenter;
    
    [jfsc_btn addSubview:jfsc_lab];






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
