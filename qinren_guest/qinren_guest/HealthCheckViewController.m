//
//  HealthCheckViewController.m
//  qinren_guest
//
//  Created by qin_ren on 16/8/22.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "HealthCheckViewController.h"
#import "HealthCheckTableViewCell.h"
#import "NSString+toHexString.h"
#import "ProgressHUD.h"
#import "HealthCheckList.h"
#import "MJExtension.h"
#import "SDWebImageManager.h"

@interface HealthCheckViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *healthmainindex;

@property(nonatomic,strong)NSMutableArray *healthchecklist;

@end

@implementation HealthCheckViewController

static NSString * const HealthCheckId = @"healthcheck";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"健康检测";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _healthmainindex = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    [_healthmainindex registerNib:[UINib nibWithNibName:NSStringFromClass([HealthCheckTableViewCell class]) bundle:nil] forCellReuseIdentifier:HealthCheckId];
    
    //_todayfood.backgroundColor = [UIColor yellowColor];
    
    _healthmainindex.tag = 1;
    
    _healthmainindex.dataSource = self;
    
    _healthmainindex.delegate = self;
    
    [self.view addSubview:_healthmainindex];
    
    
    //健康检测主页模型
    
    NSString *healthcheckmethod = [NSString stringWithFormat:getmonitorlist];
    
    NSArray *healthcheckkeys = [[NSArray alloc]init];
    
    NSArray *healthcheckvalues = [[NSArray alloc]init];
    
    NSString *healthcheckjosn = [NSString Key:healthcheckkeys Value:healthcheckvalues];
    
    NSString *healthcheckurl = [NSString NOMethod:healthcheckmethod NOParams:healthcheckjosn];
    
    //同步请求
    
    [ProgressHUD show:@"请稍等..."];
    
    NSURLRequest *healthcheckurlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:healthcheckurl] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    
    NSData *healthcheckreceived = [NSURLConnection sendSynchronousRequest:healthcheckurlRequest returningResponse:nil error:nil];
    
    NSError *healthcheckurlRequestjsonerror;
    
    NSDictionary *healthcheckurlRequestresponderdic = [NSJSONSerialization JSONObjectWithData:healthcheckreceived options:NSJSONReadingAllowFragments error:&healthcheckurlRequestjsonerror];
    
    if (!healthcheckurlRequestjsonerror) {
        
        [ProgressHUD dismiss];
        
        NSArray *healthcheckarr = [NSArray array];
        
        healthcheckarr = healthcheckurlRequestresponderdic[@"data"];
        
        self.healthchecklist = [HealthCheckList mj_objectArrayWithKeyValuesArray:healthcheckarr];
        
        [_healthmainindex reloadData];
    }

   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 10;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    HealthCheckTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HealthCheckId];
    
    HealthCheckList *myhealthchecklist = self.healthchecklist[indexPath.row];
    
    cell.heathchektitlelab.text = myhealthchecklist.monitor_name;
    
    NSURL *healthcheck_img_url = [[NSURL alloc]initWithString:myhealthchecklist.monitor_img];
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    [manager downloadImageWithURL:healthcheck_img_url
                          options:0
                         progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                             // progression tracking code
                         }
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                            if (image) {
                                
                                // do something with image
                                
                                cell.healthcheckcellimgview.image =image;
                                
                            }else{
                                
                                cell.healthcheckcellimgview.image = [UIImage imageNamed:@"health_shop_jkyp"];
                                
                            }
                        }];
    
    [cell.healthcheckbtn addTarget:self action:@selector(checkstart) forControlEvents:UIControlEventTouchUpInside];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;


}

//设置Cell高度

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

-(void)checkstart
{

  NSLog(@"start");

}

@end
