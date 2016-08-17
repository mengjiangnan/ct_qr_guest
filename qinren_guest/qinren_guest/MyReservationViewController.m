//
//  MyReservationViewController.m
//  qinren_guest
//
//  Created by qin_ren on 16/8/17.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "MyReservationViewController.h"

#import "SDWebImageManager.h"

@interface MyReservationViewController ()

@end

@implementation MyReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"我要预约";
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    UIView *reservationview = [[UIView alloc]initWithFrame:CGRectMake(5, 69, self.view.frame.size.width - 10, self.view.frame.size.height * 0.25)];
    
    reservationview.backgroundColor = [UIColor whiteColor];
    
    //将图层的边框设置为圆脚
    
    reservationview.layer.cornerRadius = 5;
    
    reservationview.layer.masksToBounds = YES;
    
    //给图层添加一个有色边框
    
    reservationview.layer.borderWidth = 1;
    
    reservationview.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    [self.view addSubview:reservationview];
    
    //头像图片
    
    UIImageView *myhead = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 70, 70)];
    
    NSURL *myreservation_url = [[NSURL alloc]initWithString:@"http://www.qrgs360.com:8087/Picture/201608/061a2059-cb4c-4d1c-9c9a-1efdc985c386.jpg"];
    
    SDWebImageManager *myreservationmanager = [SDWebImageManager sharedManager];
    
    [myreservationmanager downloadImageWithURL:myreservation_url
                                options:0
                               progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                   // progression tracking code
                               }
                              completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                                  if (image) {
                                      
                                      // do something with image
                                      
                                      myhead.image =image;
                                      
                                  }else{
                                      
                                      myhead.image = [UIImage imageNamed:@"smallplacehold"];
                                      
                                  }
                              }];

    
    
    [reservationview addSubview:myhead];
    
    //姓名标签
    
    UILabel *namelab = [[UILabel alloc]initWithFrame:CGRectMake(20+70+30, 20, 40, 18)];
    
    namelab.text = @"姓名:";
    
    [reservationview addSubview:namelab];
    
    //姓名内容
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(165, 20, 80, 18)];
    
    name.text = @"";
    
    [reservationview addSubview:name];
    
    //性别标签
    
    UILabel *sexlab = [[UILabel alloc]initWithFrame:CGRectMake(120, 20+18+10, 40, 18)];
    
    sexlab.text = @"性别:";
    
    [reservationview addSubview:sexlab];
    
    //性别内容
    
    UILabel *sex = [[UILabel alloc]initWithFrame:CGRectMake(165, 48, 20, 18)];
    
    sex.text = @"";
    
    [reservationview addSubview:sex];
    
    //会员卡号标签
    
    UILabel *remlab = [[UILabel alloc]initWithFrame:CGRectMake(120, 48+18+10, 80, 18)];
    
    remlab.text = @"会员卡号:";
    
    [reservationview addSubview:remlab];
    
    //会员卡号内容
    
    UILabel *rem = [[UILabel alloc]initWithFrame:CGRectMake(120+80+5, 48+18+10, 150, 18)];
    
    rem.text = @"";
    
    [reservationview addSubview:rem];

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
