//
//  MealProjectViewController.m
//  qinren_guest
//
//  Created by qin_ren on 5/7/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "MealProjectViewController.h"

#import "GTMBase64.h"

#import <CommonCrypto/CommonCrypto.h>

#import "ProgressHUD.h"

#import "NSString+toHexString.h"

#import "NSDictionary+toDic.h"

#import "MJExtension.h"

#import "LeftCategoryList.h"

#import "RightCategoryList.h"

#import "ShopLeftCategoryTableViewCell.h"

#import "ShopRightCategoryTableViewCell.h"

@interface MealProjectViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *goodsclasslist;

@property(nonatomic,strong)NSMutableArray *goodslist;

@property(nonatomic,weak)UITableView *lefttableview;

@property(nonatomic,weak)UITableView *righttableview;

@end

@implementation MealProjectViewController

static NSString * const LeftCategoryId = @"leftcategory";

static NSString * const RightCategoryId = @"rightcategory";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"项目套餐";
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    //顶部第一个按钮
    
    UIButton *left_first_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    left_first_btn.frame = CGRectMake(0, 64, self.view.frame.size.width/3, self.view.frame.size.height/18);
    
    left_first_btn.backgroundColor = [UIColor whiteColor];
    
    [left_first_btn setTitle:@"高血压" forState:UIControlStateNormal];
    
    left_first_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [left_first_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [left_first_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [left_first_btn addTarget:self action:@selector(firstaction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:left_first_btn];
    
    //顶部第二个按钮
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    UIButton *mid_second_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    mid_second_btn.frame = CGRectMake(left_first_btn.frame.size.width, 64, self.view.frame.size.width/3, self.view.frame.size.height/18);
    
    mid_second_btn.backgroundColor = [UIColor whiteColor];
    
    [mid_second_btn setTitle:@"价格" forState:UIControlStateNormal];
    
    mid_second_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [mid_second_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [mid_second_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [self.view addSubview:mid_second_btn];
    
    //顶部第三个按钮
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    UIButton *last_third_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    last_third_btn.frame = CGRectMake(mid_second_btn.frame.size.width *2, 64, self.view.frame.size.width/3, self.view.frame.size.height/18);
    
    last_third_btn.backgroundColor = [UIColor whiteColor];
    
    [last_third_btn setTitle:@"上架时间" forState:UIControlStateNormal];
    
    last_third_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [last_third_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [last_third_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [self.view addSubview:last_third_btn];
    
    //右边类别列表
    
    UITableView *right_category_list = [[UITableView alloc]initWithFrame:CGRectMake(0, 64 +  self.view.frame.size.height/18 + 2, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    //右边类别列表注册
    
    [right_category_list registerNib:[UINib nibWithNibName:NSStringFromClass([ShopRightCategoryTableViewCell class]) bundle:nil] forCellReuseIdentifier:RightCategoryId];
    
    self.righttableview = right_category_list;
    
    self.righttableview.delegate = self;
    
    self.righttableview.dataSource = self;
    
    self.righttableview.tag = 1;
    
    [self.view addSubview:self.righttableview];
    
    //左边数据模型
    
    NSString *goodsclasslistmethod = [NSString stringWithFormat:getgoodsclasslist];
    
    //NSArray *goodsclasslistkeys = [[NSArray alloc]initWithObjects:@"", nil];
    
    //NSArray *goodsclasslistvalues = [[NSArray alloc]initWithObjects:@"", nil];
    
    //NSString *goodsclasslistjosn = [NSString Key:goodsclasslistkeys Value:goodsclasslistvalues];
    
    NSString *goodsclasslisturl = [NSString Method:goodsclasslistmethod Params:nil];
    
    //左边类别列表
    
    UITableView *left_category_list = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, left_first_btn.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    //左边类别列表注册
    
    [left_category_list registerNib:[UINib nibWithNibName:NSStringFromClass([ShopLeftCategoryTableViewCell class]) bundle:nil] forCellReuseIdentifier:LeftCategoryId];
    
    self.lefttableview = left_category_list;
    
    self.lefttableview.delegate = self;
    
    self.lefttableview.dataSource = self;
    
    self.lefttableview.tag = 0;
    
    [self.righttableview addSubview:self.lefttableview];
    
    //左边类别列表设置隐藏
    
    self.lefttableview.hidden = YES;

    
    
    
    //列表数据网络请求
    
    //[ProgressHUD show:@"请稍等..."];
    
    // 快捷方式获得左边列表的session对象
    
    NSURLSession *leftsession = [NSURLSession sharedSession];
    
    NSURL *lefturl = [NSURL URLWithString:goodsclasslisturl];
    
    // 通过URL初始化task,在block内部可以直接对返回的数据进行处理
    
    NSURLSessionTask *lefttask = [leftsession dataTaskWithURL:lefturl
                              
                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                        
                                       //[ProgressHUD dismiss];
                                        
                                       NSString *goodsclasslistresponderjsonstr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                       
                                       NSString *newgoodsclasslistresponderjsonstr =[NSString decryptUseDES:goodsclasslistresponderjsonstr key:mykey];
                                       
                                       NSDictionary *leftresponder = [NSString parseJSONStringToNSDictionary:newgoodsclasslistresponderjsonstr];
                                       
                                       self.goodsclasslist = [LeftCategoryList mj_objectArrayWithKeyValuesArray:leftresponder[@"data"]];
                                        
                                       [self.lefttableview reloadData];
                                        
                                   }];
    
    // 启动左边任务
    [lefttask resume];
    
    //右边数据模型
    
    NSString *goodslistmethod = [NSString stringWithFormat:getgoodslist];
    
    NSArray *goodslistkeys = [[NSArray alloc]initWithObjects:@"classid",@"goodstype",@"pageindex",@"pagesize", nil];
    
    int onenum = 1;
    
    NSNumber *onenumber = [NSNumber numberWithInt:onenum];
    
    int tennum = 10;
    
    NSNumber *tennumber = [NSNumber numberWithInt:tennum];
    
    NSArray *goodslistvalues = [[NSArray alloc]initWithObjects:@"10",@"7",onenumber,tennumber, nil];
    
    //NSDictionary *goodslistjosndic = [NSDictionary Key:goodslistkeys Value:goodslistvalues];
    
    NSString *goodslistjosn = [NSString Key:goodslistkeys Value:goodslistvalues];
    
    NSString *goodslisturl = [NSString Method:goodslistmethod Params:goodslistjosn];
    
    //NSString *goodslisturl = [NSString DicMethod:goodslistmethod Params:goodslistjosndic];
    
    //快捷方式获得右边列表的session对象
    
    [ProgressHUD show:@"请稍等..."];
    
    NSURLSession *rightsession = [NSURLSession sharedSession];
    
    NSURL *righturl = [NSURL URLWithString:goodslisturl];
    
    NSURLSessionTask *righttask = [rightsession dataTaskWithURL:righturl
    
                                              completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                                  
                                                  [ProgressHUD dismiss];
                                              
                                                  NSString *goodslistresponderjsonstr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                                                  
                                                  NSString *newgoodslistresponderjsonstr = [NSString decryptUseDES:goodslistresponderjsonstr key:mykey];
                                                  
                                                  NSDictionary *rightresponder = [NSString parseJSONStringToNSDictionary:newgoodslistresponderjsonstr];
                                                  
                                                  self.goodslist = [RightCategoryList mj_objectArrayWithKeyValuesArray:rightresponder[@"data"]];
                                                  
                                                  [self.righttableview reloadData];
                                                  
                                              }];
    //启动右边任务
    [righttask resume];
  
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView.tag == 0) {
        
        return self.goodsclasslist.count;
    
    }else{
        
        return self.goodslist.count;
    
    
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView.tag == 0) {
        
        ShopLeftCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LeftCategoryId];
        
        LeftCategoryList *mylist = self.goodsclasslist[indexPath.row];
        
        cell.textLabel.text = mylist.catename;
        
        return cell;
    
    } else {
        
        ShopRightCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RightCategoryId];
        
        RightCategoryList *mylist = self.goodslist[indexPath.row];
        
        cell.textLabel.text = mylist.id;
        
        return cell;
      
    }

}

-(void)firstaction{
    
    [self.lefttableview reloadData];
    
    if (self.lefttableview.hidden==YES) {
        
        //显示列表
        self.lefttableview.hidden = NO;
    
    }else  {
        
        //隐藏列表
        self.lefttableview.hidden = YES;
     
    }
  
}

@end
