//
//  TodayViewController.m
//  qinren_guest
//
//  Created by qin_ren on 16/8/15.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "TodayViewController.h"

#import "TodayFoodTableViewCell.h"

#import "TodayFoodList.h"

#import "TodaySportTableViewCell.h"

#import "TodaySportList.h"

#import "NSString+toHexString.h"

#import "ProgressHUD.h"

#import "MJExtension.h"

#import "SDWebImageManager.h"

#import "NoMedicalList.h"

#import "NoMedicalTableViewCell.h"

#import "RecuperateSchemeViewController.h"

@interface TodayViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *todayfood;

@property(nonatomic,strong)UITableView *nomedical;

@property(nonatomic,strong)UITableView *todaymotion;

@property(nonatomic,strong)NSMutableArray *mygetremindlist;

@property(nonatomic,strong)NSMutableArray *mysportlist;

@property(nonatomic,strong)NSMutableArray *mynomedicallist;

@end

@implementation TodayViewController

static NSString * const TodayFoodId = @"todayfood";

static NSString * const TodaySportId = @"todaysport";

static NSString * const NoMedicalId = @"nomedical";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"今日任务";
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    UISegmentedControl *todaysegment = [[UISegmentedControl alloc]initWithItems:@[@"今日食谱",@"非药物疗法",@"今日运动"]];
    
    // 设置选中的文字颜色
    [todaysegment setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor greenColor]} forState:UIControlStateSelected];
    
    todaysegment.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height * 0.05);
    
    [self.view addSubview:todaysegment];
    
    [todaysegment addTarget:self action:@selector(selected:) forControlEvents:UIControlEventValueChanged];
    
    _todayfood = [[UITableView alloc]initWithFrame:CGRectMake(0, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    [_todayfood registerNib:[UINib nibWithNibName:NSStringFromClass([TodayFoodTableViewCell class]) bundle:nil] forCellReuseIdentifier:TodayFoodId];
    
    //_todayfood.backgroundColor = [UIColor yellowColor];
    
    _todayfood.tag = 1;
    
    _todayfood.dataSource = self;
    
    _todayfood.delegate = self;
    
    [self.view addSubview:_todayfood];
    
    _nomedical = [[UITableView alloc]initWithFrame:CGRectMake(0 + self.view.frame.size.width, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    [_nomedical registerNib:[UINib nibWithNibName:NSStringFromClass([NoMedicalTableViewCell class]) bundle:nil] forCellReuseIdentifier:NoMedicalId];
    
    //_nomedical.backgroundColor = [UIColor blueColor];
    
    _nomedical.tag = 2;
    
    _nomedical.dataSource = self;
    
    _nomedical.delegate = self;
    
    [self.view addSubview:_nomedical];
    
    _todaymotion = [[UITableView alloc]initWithFrame:CGRectMake(0 - self.view.frame.size.width, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    [_todaymotion registerNib:[UINib nibWithNibName:NSStringFromClass([TodaySportTableViewCell class]) bundle:nil] forCellReuseIdentifier:TodaySportId];
    
    //_todaymotion.backgroundColor = [UIColor redColor];
    
    _todaymotion.tag = 3;
    
    _todaymotion.dataSource = self;
    
    _todaymotion.delegate = self;
    
    [self.view addSubview:_todaymotion];
    
    //今日食谱今日运动数据模型
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *myuid = [defaults objectForKey:@"uid"];
    
    NSString *getremindlistmethod = [NSString stringWithFormat:getremindlist];
    
    NSArray *getremindlistkeys = [[NSArray alloc]initWithObjects:@"uid", nil];
    
    NSArray *getremindlistvalues = [[NSArray alloc]initWithObjects:myuid, nil];
    
    NSString *getremindlistjosn = [NSString Key:getremindlistkeys Value:getremindlistvalues];
    
    NSString *getremindlisturl = [NSString NOMethod:getremindlistmethod NOParams:getremindlistjosn];
    
    //今日食谱今日运动同步请求
    
    [ProgressHUD show:@"请稍等..."];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:getremindlisturl] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    
    NSData *received = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
    
    NSError *jsonerror;
    
    NSDictionary *getremindlistresponderdic = [NSJSONSerialization JSONObjectWithData:received options:NSJSONReadingAllowFragments error:&jsonerror];
    
    if (!jsonerror) {
        
        [ProgressHUD dismiss];
        
        NSArray *getremindlistarr = [NSArray array];
        
        NSArray *sportlistarr = [NSArray array];
        
        getremindlistarr = getremindlistresponderdic[@"data"][0];
        
        sportlistarr = getremindlistresponderdic[@"data"][1];
        
        self.mygetremindlist = [TodayFoodList mj_objectArrayWithKeyValuesArray:getremindlistarr];
        
        self.mysportlist = [TodaySportList mj_objectArrayWithKeyValuesArray:sportlistarr];
        
        [_todayfood reloadData];
        
        [_todaymotion reloadData];
        
    }
    
    //非药物疗法模型
    
    NSString *nomedicalmethod = [NSString stringWithFormat:getsolutiontype];
    
    NSArray *nomedicalkeys = [[NSArray alloc]init];
    
    NSArray *nomedicalvalues = [[NSArray alloc]init];
    
    NSString *nomedicaljosn = [NSString Key:nomedicalkeys Value:nomedicalvalues];
    
    NSString *nomedicalurl = [NSString NOMethod:nomedicalmethod NOParams:nomedicaljosn];
    
    //非药物疗法同步请求
    
    [ProgressHUD show:@"请稍等..."];
    
    NSURLRequest *nomedicalurlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:nomedicalurl] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    
    NSData *nomedicalreceived = [NSURLConnection sendSynchronousRequest:nomedicalurlRequest returningResponse:nil error:nil];
    
    NSError *nomedicaljsonerror;
    
    NSDictionary *nomedicalresponderdic = [NSJSONSerialization JSONObjectWithData:nomedicalreceived options:NSJSONReadingAllowFragments error:&nomedicaljsonerror];
    
    if (!nomedicaljsonerror) {
        
        [ProgressHUD dismiss];
        
        NSArray *nomedicalarr = [NSArray array];
        
        nomedicalarr = nomedicalresponderdic[@"data"];
        
        self.mynomedicallist = [NoMedicalList mj_objectArrayWithKeyValuesArray:nomedicalarr];
        
        [_nomedical reloadData];
    }

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


-(void)selected:(id)sender{
    
    UISegmentedControl* control = (UISegmentedControl*)sender;
    
    switch (control.selectedSegmentIndex) {
    
        case 0:
        
            [self firstSegment];
            
            break;
        
        case 1:
            
            [self secondSegment];
            
            break;
        
        case 2:
            
            [self threeSegment];
            
            break;
            
        default:
            
            break;
            
    }
}

- (void)firstSegment
{
    [_todayfood reloadData];
    
    _todayfood.frame  = CGRectMake(0, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _nomedical.frame = CGRectMake(0 + self.view.frame.size.width, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _todaymotion.frame  = CGRectMake(0 - self.view.frame.size.width, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _todayfood.hidden  = NO;
    
    _nomedical.hidden = YES;
    
    _todaymotion.hidden  = YES;
}

- (void)secondSegment
{
    [_nomedical reloadData];
    
    _todayfood.frame  = CGRectMake(0 - self.view.frame.size.width, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _nomedical.frame = CGRectMake(0, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _todaymotion.frame  = CGRectMake(0 + self.view.frame.size.width, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _todayfood.hidden  = YES;
    
    _nomedical.hidden = NO;
    
    _todaymotion.hidden  = YES;
}

- (void)threeSegment
{
    [_todaymotion reloadData];
    
    _todayfood.frame  = CGRectMake(0 + self.view.frame.size.width, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _nomedical.frame = CGRectMake(0 - self.view.frame.size.width, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _todaymotion.frame  = CGRectMake(0, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _todayfood.hidden  = YES;
    
    _nomedical.hidden = YES;
    
    _todaymotion.hidden  = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1) {
        
        return  self.mygetremindlist.count;
    
    }else if (tableView.tag == 3){
    
        return self.mysportlist.count;
      
    }
    
    return self.mynomedicallist.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
        
        TodayFoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TodayFoodId];
        
        TodayFoodList *foodlist = self.mygetremindlist[indexPath.row];
        
        cell.backgroudtext.editable = NO;
                
        cell.foodname.text = foodlist.meal_name;
        
        cell.content.text = foodlist.meal_memo;
        
        NSURL *food_img_url = [[NSURL alloc]initWithString:foodlist.meal_img];
        
        SDWebImageManager *manager = [SDWebImageManager sharedManager];
        
        [manager downloadImageWithURL:food_img_url
                              options:0
                             progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                 // progression tracking code
                             }
                            completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                                if (image) {
                                    
                                    // do something with image
                                    
                                    cell.foodimg.image =image;
                                    
                                }else{
                                    
                                    cell.foodimg.image = [UIImage imageNamed:@"smallplacehold"];
                                    
                                }
                            }];
        
        [cell.change addTarget:self action:@selector(mychange) forControlEvents:UIControlEventTouchUpInside];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }else if(tableView.tag == 3){
    
        TodaySportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TodaySportId];
        
        TodaySportList *sportlist = self.mysportlist[indexPath.row];
        
        cell.mainbackgroud.editable = NO;
        
        cell.sporttitle.text = sportlist.parent_name;
        
        cell.stylecontent.text = sportlist.sport_name;
        
        cell.content.editable = NO;
        
        cell.repeatcontent.text = sportlist.sport_repeat;
        
        cell.sportcontent.editable = NO;
        
        cell.sportcontent.text = sportlist.sport_strength;
        
        cell.sportadvice.editable = NO;
                
        cell.sportadvice.text = sportlist.sport_advice;
        
        //将图层的边框设置为圆脚
        
        cell.content.layer.cornerRadius = 5;
        
        cell.content.layer.masksToBounds = YES;
        
        //给图层添加一个有色边框
        
        cell.content.layer.borderWidth = 1;
        
        cell.content.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    
    }else{
        
        NoMedicalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NoMedicalId];
        
        NoMedicalList *medicallist = self.mynomedicallist[indexPath.row];
        
        cell.textLabel.text = medicallist.st_name;
        
        NSURL *no_medical_img_url = [[NSURL alloc]initWithString:medicallist.st_img];
        
        SDWebImageManager *nomedicalmanager = [SDWebImageManager sharedManager];
        
        [nomedicalmanager downloadImageWithURL:no_medical_img_url
        
        options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            // progression tracking code
        }
        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (image) {
            
            // do something with image
            
            cell.imageView.image =image;
            
        }else{
            
            cell.imageView.image = [UIImage imageNamed:@"smallplacehold"];
            
        }
    }];

        
        return cell;
       
    }

}

//设置Cell高度

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 1)
    
    {
        return self.view.frame.size.height;
        
    }else if (tableView.tag == 3){
    
        
        return 300;
    
    
    }
    else{
        
        return 60;
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView.tag == 2) {
        
        NSArray *solutionarr = [NSArray arrayWithObjects:@"http://www.qrgs360.com:8087/app/solution.aspx?sid=null&st_id=ST2014061100001",@"http://www.qrgs360.com:8087/app/solution.aspx?sid=null&st_id=ST2014061100002",@"http://www.qrgs360.com:8087/app/solution.aspx?sid=null&st_id=ST2014061100003",@"http://www.qrgs360.com:8087/app/solution.aspx?sid=null&st_id=ST2014061100004",@"http://www.qrgs360.com:8087/app/solution.aspx?sid=null&st_id=ST2014061100005",@"http://www.qrgs360.com:8087/app/solution.aspx?sid=null&st_id=ST2014061100006",@"http://www.qrgs360.com:8087/app/solution.aspx?sid=null&st_id=ST2014061100007",@"http://www.qrgs360.com:8087/app/solution.aspx?sid=null&st_id=ST2014061100008", nil];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [solutionarr objectAtIndex:indexPath.row];
        
        NSString *solutionstr = [NSString stringWithFormat:@"%@",solutionarr[indexPath.row]];
        
        [defaults setObject:solutionstr forKey:@"solutioninfo"];
        
        self.hidesBottomBarWhenPushed=YES;
        
        RecuperateSchemeViewController *rs_vc = [[RecuperateSchemeViewController alloc]init];
        
        [self.navigationController pushViewController:rs_vc animated:YES];
        
        self.hidesBottomBarWhenPushed=NO;
        
    }



}


-(void)mychange
{
    //换一换数据模型
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *myuid = [defaults objectForKey:@"uid"];
    
    NSString *searchremindlistmethod = [NSString stringWithFormat:searchremindlist];
    
    NSArray *searchremindlistkeys = [[NSArray alloc]initWithObjects:@"uid", nil];
    
    NSArray *searchremindlistvalues = [[NSArray alloc]initWithObjects:myuid, nil];
    
    NSString *searchremindlistjosn = [NSString Key:searchremindlistkeys Value:searchremindlistvalues];
    
    NSString *searchremindlisturl = [NSString NOMethod:searchremindlistmethod NOParams:searchremindlistjosn];
    
    //换一换同步请求
    
    [ProgressHUD show:@"请稍等..."];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:searchremindlisturl] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    
    NSData *received = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
    
    NSError *jsonerror;
    
    NSDictionary *searchremindlistresponderdic = [NSJSONSerialization JSONObjectWithData:received options:NSJSONReadingAllowFragments error:&jsonerror];

    if (!jsonerror) {
        
        [ProgressHUD dismiss];
        
        NSArray *searchremindlistarr = [NSArray array];
        
        searchremindlistarr = searchremindlistresponderdic[@"data"][0];
        
        NSArray *sportlistarr = [NSArray array];
        
        sportlistarr = searchremindlistresponderdic[@"data"][1];
        
        self.mygetremindlist = [TodayFoodList mj_objectArrayWithKeyValuesArray:searchremindlistarr];
        
        self.mysportlist = [TodaySportList mj_objectArrayWithKeyValuesArray:sportlistarr];
        
        [_todayfood reloadData];
        
        [_todaymotion reloadData];
            
    }

}

@end
