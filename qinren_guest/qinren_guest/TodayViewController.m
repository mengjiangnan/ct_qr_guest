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

#import "NSString+toHexString.h"

#import "ProgressHUD.h"

#import "MJExtension.h"

#import "SDWebImageManager.h"

@interface TodayViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *todayfood;

@property(nonatomic,strong)UITableView *nomedical;

@property(nonatomic,strong)UITableView *todaymotion;

@property(nonatomic,strong)NSMutableArray *mygetremindlist;

@end

@implementation TodayViewController

static NSString * const TodayFoodId = @"todayfood";

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
    
    _nomedical.backgroundColor = [UIColor blueColor];
    
    _nomedical.tag = 2;
    
    _nomedical.dataSource = self;
    
    _nomedical.delegate = self;
    
    [self.view addSubview:_nomedical];
    
    _todaymotion = [[UITableView alloc]initWithFrame:CGRectMake(0 - self.view.frame.size.width, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    _todaymotion.backgroundColor = [UIColor redColor];
    
    _todaymotion.tag = 3;
    
    _todaymotion.dataSource = self;
    
    _todaymotion.delegate = self;
    
    [self.view addSubview:_todaymotion];
    
    //今日食谱数据模型
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *myuid = [defaults objectForKey:@"uid"];
    
    NSString *getremindlistmethod = [NSString stringWithFormat:getremindlist];
    
    NSArray *getremindlistkeys = [[NSArray alloc]initWithObjects:@"uid", nil];
    
    NSArray *getremindlistvalues = [[NSArray alloc]initWithObjects:myuid, nil];
    
    NSString *getremindlistjosn = [NSString Key:getremindlistkeys Value:getremindlistvalues];
    
    NSString *getremindlisturl = [NSString NOMethod:getremindlistmethod NOParams:getremindlistjosn];
    
    //今日食谱同步请求
    
    [ProgressHUD show:@"请稍等..."];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:getremindlisturl] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    
    NSData *received = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
    
    NSError *jsonerror;
    
    NSDictionary *getremindlistresponderdic = [NSJSONSerialization JSONObjectWithData:received options:NSJSONReadingAllowFragments error:&jsonerror];
    
    if (!jsonerror) {
        
        [ProgressHUD dismiss];
        
        NSArray *getremindlistarr = [NSArray array];
        
        getremindlistarr = getremindlistresponderdic[@"data"][0];
        
        self.mygetremindlist = [TodayFoodList mj_objectArrayWithKeyValuesArray:getremindlistarr];
        
        [_todayfood reloadData];
        
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
    _todayfood.frame  = CGRectMake(0, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _nomedical.frame = CGRectMake(0 + self.view.frame.size.width, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _todaymotion.frame  = CGRectMake(0 - self.view.frame.size.width, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _todayfood.hidden  = NO;
    
    _nomedical.hidden = YES;
    
    _todaymotion.hidden  = YES;
}

- (void)secondSegment
{
    _todayfood.frame  = CGRectMake(0 - self.view.frame.size.width, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _nomedical.frame = CGRectMake(0, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _todaymotion.frame  = CGRectMake(0 + self.view.frame.size.width, 64 + self.view.frame.size.height * 0.05 + 1, self.view.frame.size.width, self.view.frame.size.height);
    
    _todayfood.hidden  = YES;
    
    _nomedical.hidden = NO;
    
    _todaymotion.hidden  = YES;
}

- (void)threeSegment
{
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
    }
    
    return 0;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
        
        TodayFoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TodayFoodId];
        
        TodayFoodList *foodlist = self.mygetremindlist[indexPath.row];
                
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

        
        return cell;
        
    }else{
    
        TodayFoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TodayFoodId];
    
        return cell;
    
    }

}

//设置Cell高度

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 1)
    
    {
        return self.view.frame.size.height;
        
    }else{
        
        return 44;
        
    }
}


@end
