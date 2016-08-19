//
//  TravelViewController.m
//  qinren_guest
//
//  Created by qin_ren on 16/8/17.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "TravelViewController.h"

#import "RecureTableViewCell.h"

#import "NSString+toHexString.h"

#import "ProgressHUD.h"

#import "MJExtension.h"

#import "TravelList.h"

#import "SDWebImageManager.h"

#import "MyReservationViewController.h"

#import "BirdTableViewCell.h"

@interface TravelViewController ()<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,strong)UITableView *recure;

@property(nonatomic,strong)UITableView *bird;

@property(nonatomic,strong)NSMutableArray *mygetresttypelist;

@property(nonatomic,strong)NSString *myreservationtext;

@property(nonatomic,strong)UIPickerView *citymore;

@property(nonatomic,strong)UIDatePicker *mydatepick;

@property(nonatomic,strong)UITextField *mystarttime;

@end

@implementation TravelViewController

static NSString * const RecureId = @"recure";

static NSString * const BirdId = @"bird";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"候鸟旅游";
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    UISegmentedControl *todaysegment = [[UISegmentedControl alloc]initWithItems:@[@"康复疗养",@"候鸟养生游"]];
    
    // 设置选中的文字颜色
    
    [todaysegment setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor greenColor]} forState:UIControlStateSelected];
    
    todaysegment.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height * 0.05);
    
    [self.view addSubview:todaysegment];
    
    [todaysegment addTarget:self action:@selector(selected:) forControlEvents:UIControlEventValueChanged];
    
    _recure = [[UITableView alloc]initWithFrame:CGRectMake(0, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    [_recure registerNib:[UINib nibWithNibName:NSStringFromClass([RecureTableViewCell class]) bundle:nil] forCellReuseIdentifier:RecureId];
    
    _recure.tag = 1;
    
    _recure.dataSource = self;
    
    _recure.delegate = self;
    
    [self.view addSubview:_recure];
    
    _bird = [[UITableView alloc]initWithFrame:CGRectMake(0 + self.view.frame.size.width, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    [_bird registerNib:[UINib nibWithNibName:NSStringFromClass([BirdTableViewCell class]) bundle:nil] forCellReuseIdentifier:BirdId];
    
    //_nomedical.backgroundColor = [UIColor blueColor];
    
    _bird.tag = 2;
    
    _bird.dataSource = self;
    
    _bird.delegate = self;
    
    [self.view addSubview:_bird];

    
    
    //康复疗养模型
    
    NSNumber *pageindex = [NSNumber numberWithInt:1];
    
    NSNumber *pagesize = [NSNumber numberWithInt:10];
    
    NSString *getresttypelistmethod = [NSString stringWithFormat:getresttypelist];
    
    NSArray *getresttypelistkeys = [[NSArray alloc]initWithObjects:@"pageindex",@"pagesize", nil];
    
    NSArray *getresttypelistvalues = [[NSArray alloc]initWithObjects:pageindex,pagesize, nil];
    
    NSString *getresttypelistjosn = [NSString Key:getresttypelistkeys Value:getresttypelistvalues];
    
    NSString *getresttypelisturl = [NSString NOMethod:getresttypelistmethod NOParams:getresttypelistjosn];
    
    //康复疗养同步请求
    
    [ProgressHUD show:@"请稍等..."];
    
    NSURLRequest *getresttypelisturlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:getresttypelisturl] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    
    NSData *getresttypelistreceived = [NSURLConnection sendSynchronousRequest:getresttypelisturlRequest returningResponse:nil error:nil];
    
    NSError *getresttypelistjsonerror;
    
    NSDictionary *getresttypelistresponderdic = [NSJSONSerialization JSONObjectWithData:getresttypelistreceived options:NSJSONReadingAllowFragments error:&getresttypelistjsonerror];
    
    if (!getresttypelistjsonerror) {
        
        [ProgressHUD dismiss];
        
        NSArray *getresttypelistarr = [NSArray array];
        
        getresttypelistarr = getresttypelistresponderdic[@"data"];
        
        self.mygetresttypelist = [TravelList mj_objectArrayWithKeyValuesArray:getresttypelistarr];
        
        [_recure reloadData];
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)selected:(id)sender{
    
    UISegmentedControl* control = (UISegmentedControl*)sender;
    
    switch (control.selectedSegmentIndex) {
            
        case 0:
            
            [self firstSegment];
            
            break;
            
        case 1:
            
            [self secondSegment];
            
            break;
            
        default:
            
            break;
            
    }
}

- (void)firstSegment
{
    [_recure reloadData];
    
    _recure.frame  = CGRectMake(0, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _bird.frame = CGRectMake(0 + self.view.frame.size.width, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _recure.hidden  = NO;
    
    _bird.hidden = YES;

}

- (void)secondSegment
{
    [_bird reloadData];
    
    _recure.frame  = CGRectMake(0 + self.view.frame.size.width, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _bird.frame = CGRectMake(0, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _recure.hidden  = YES;
    
    _bird.hidden = NO;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1) {
        
        return self.mygetresttypelist.count;
     
    }else{
    
        return 1;
    
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
        
        RecureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RecureId];
        
        TravelList *tlist = self.mygetresttypelist[indexPath.row];
        
        NSURL *travel_img_url = [[NSURL alloc]initWithString:tlist.pic];
        
        SDWebImageManager *recuremanager = [SDWebImageManager sharedManager];
        
        [recuremanager downloadImageWithURL:travel_img_url
                              options:0
                             progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                 // progression tracking code
                             }
                            completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                                if (image) {
                                    
                                    // do something with image
                                    
                                    cell.sceneryimg.image =image;
                                    
                                }else{
                                    
                                    cell.sceneryimg.image = [UIImage imageNamed:@"smallplacehold"];
                                    
                                }
                            }];

        
        cell.travelname.text = tlist.name;
        
        self.myreservationtext = cell.travelname.text;
        
        cell.traveldes.text = tlist.simpledesc;
        
        [cell.reservationbtn addTarget:self action:@selector(reservation) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
        
    }
    
    BirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BirdId];
    
//    cell.citythree.text = @"";
    
//    self.mystarttime = cell.starttime;
//    
//    self.mydatepick = cell.mypickdate;
//    
//    self.mydatepick.datePickerMode = UIDatePickerModeDate;
//    
//    [self.mydatepick addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    
    [cell.checkbtn addTarget:self action:@selector(check) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;

    
}

//设置Cell高度

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 1)
        
    {
        return 330;
        
    }else{
        
        return self.view.frame.size.height;
        
    }
}



-(void)reservation
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *myreservationtext = self.myreservationtext;
    
    [defaults setObject:myreservationtext forKey:@"myreservationtext"];
        
    self.hidesBottomBarWhenPushed=YES;
    
    MyReservationViewController *reservationvc = [[MyReservationViewController alloc]init];
    
    [self.navigationController pushViewController:reservationvc animated:YES];

}

///*点击日期控件时，将选中的日期填写到文本框中*/
//
//-(void)dateChanged:(id)sender
//
//{
//    self.mydatepick = (UIDatePicker*)sender;
//    
//    NSDate* date = self.mydatepick.date;
//    
//    NSDateFormatter *df = [[NSDateFormatter alloc]init];
//    
//    [df setDateFormat:@"yyyy-MM-dd"];
//    
//    NSString* str = [df stringFromDate:date];
//    
//    self.mystarttime.text = str;
//    
//}

//-(void)enddateChanged:(id)sender
//
//{
//    self.myenddatepicker = (UIDatePicker*)sender;
//    
//    NSDate* date = self.myenddatepicker.date;
//    
//    NSDateFormatter *df = [[NSDateFormatter alloc]init];
//    
//    [df setDateFormat:@"yyyy-MM-dd"];
//    
//    NSString* str = [df stringFromDate:date];
//    
//    self.myendtime.text = str;
//    
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)check
{

    [ProgressHUD showError:@"查询内容不存在！"];


}


@end
