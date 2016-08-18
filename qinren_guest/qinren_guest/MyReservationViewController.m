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

@property (nonatomic,weak) UIDatePicker *mydatepicker;

@property (nonatomic,weak) UIDatePicker *myenddatepicker;

@property (nonatomic,weak) UITextField *mystarttime;

@property (nonatomic,weak) UITextField *myendtime;

@end

@implementation MyReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"我要预约";
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    //初始化开始时间UIDatePicker
    
    UIDatePicker *datepicker = [[UIDatePicker alloc]init];
    
    datepicker.datePickerMode = UIDatePickerModeDate;
    
    [datepicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    
    self.mydatepicker = datepicker;
    
    //初始化结束时间UIDatePicker
    
    UIDatePicker *enddatepicker = [[UIDatePicker alloc]init];
    
    enddatepicker.datePickerMode = UIDatePickerModeDate;
    
    [enddatepicker addTarget:self action:@selector(enddateChanged:) forControlEvents:UIControlEventValueChanged ];
    
    self.myenddatepicker = enddatepicker;
    
    
    //上部背景view
    
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
    
    //下部背景view
    
    UIView *secondview = [[UIView alloc]initWithFrame:CGRectMake(5, 69 + self.view.frame.size.height * 0.25 + 10, self.view.frame.size.width - 10, self.view.frame.size.height * 0.25)];
    
    secondview.backgroundColor = [UIColor whiteColor];
    
    //将图层的边框设置为圆脚
    
    secondview.layer.cornerRadius = 5;
    
    secondview.layer.masksToBounds = YES;
    
    //给图层添加一个有色边框
    
    secondview.layer.borderWidth = 1;
    
    secondview.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    [self.view addSubview:secondview];
    
    //疗养名称标签
    
    UILabel *recuperatenamelab = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 80, 18)];
    
    recuperatenamelab.text = @"疗养名称:";
    
    [secondview addSubview:recuperatenamelab];
    
    //疗养内容
    
    UILabel *recuperatename = [[UILabel alloc]initWithFrame:CGRectMake(105, 20, 190, 18)];
    
    recuperatename.text = @"盛夏避暑胜地－羊楼洞";
    
    [secondview addSubview:recuperatename];
    
    //分割线
    
    UIView *lineview = [[UIView alloc]initWithFrame:CGRectMake(20, 20 + 18 + 20, self.view.frame.size.width * 0.8, 1)];
    
    lineview.backgroundColor = [UIColor lightGrayColor];
    
    [secondview addSubview:lineview];
    
    //预约开始时间标签
    
    UILabel *starttimelab = [[UILabel alloc]initWithFrame:CGRectMake(20, 59 + 10 + 10, 120, 18)];
    
    starttimelab .text = @"预约开始时间:";
    
    [secondview addSubview:starttimelab];
    
    //预约开始时间内容
    
    UITextField *starttimefield = [[UITextField alloc]initWithFrame:CGRectMake(20 + 120 + 5, 59 + 10 + 10, 140, 18)];
       
    starttimefield.clearButtonMode = UITextFieldViewModeAlways;
    
    starttimefield.placeholder = @"请选择";
    
    starttimefield.inputView = self.mydatepicker;
    
    self.mystarttime = starttimefield;
    
    [secondview addSubview:starttimefield];
       
    //预约结束时间标签
    
    UILabel *endtimelab = [[UILabel alloc]initWithFrame:CGRectMake(20, 69 + 18 +10 + 10 + 10, 120, 18)];
    
    endtimelab .text = @"预约结束时间:";

    [secondview addSubview:endtimelab];
    
    //预约结束时间内容
    
    UITextField *endtimefield = [[UITextField alloc]initWithFrame:CGRectMake(20 + 120 + 5, 69 + 18 +10 + 10 + 10, 140, 18)];
    
    endtimefield.clearButtonMode = UITextFieldViewModeAlways;
    
    endtimefield.placeholder = @"请选择";
    
    endtimefield.inputView = self.myenddatepicker;
    
    self.myendtime = endtimefield;
    
    [secondview addSubview:endtimefield];
    
    //提交按钮
    
    UIButton *submitbtn = [UIButton buttonWithType:UIButtonTypeSystem];

    submitbtn.frame = CGRectMake(5, 69 + self.view.frame.size.height * 0.25 + 10 + self.view.frame.size.height * 0.25 + 10 , self.view.frame.size.width - 10, 30);
    
    [submitbtn setTitle:@"提交" forState:UIControlStateNormal];
    
    [submitbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    submitbtn.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:submitbtn];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*点击日期控件时，将选中的日期填写到文本框中*/

-(void)dateChanged:(id)sender

{
    self.mydatepicker = (UIDatePicker*)sender;
    
    NSDate* date = self.mydatepicker.date;
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    
    [df setDateFormat:@"yyyy-MM-dd"];
    
    NSString* str = [df stringFromDate:date];
    
    self.mystarttime.text = str;
    
}

-(void)enddateChanged:(id)sender

{
    self.myenddatepicker = (UIDatePicker*)sender;
    
    NSDate* date = self.myenddatepicker.date;
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    
    [df setDateFormat:@"yyyy-MM-dd"];
    
    NSString* str = [df stringFromDate:date];
    
    self.myendtime.text = str;
    
}


/*点击空白处，收起输入控件*/

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    [self.view endEditing:YES];

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
