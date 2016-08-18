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

@interface TravelViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *recure;

@property(nonatomic,strong)UITableView *bird;

@property(nonatomic,strong)NSMutableArray *mygetresttypelist;

@property(nonatomic,strong)NSString *myreservationtext;

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
    }
 
    return 0;

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
    
    RecureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RecureId];

    return cell;

}

//设置Cell高度

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 1)
        
    {
        return 330;
        
    }else{
        
        return 60;
        
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
