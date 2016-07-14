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

@interface MealProjectViewController ()

@end

@implementation MealProjectViewController

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
    
    //左边类别列表
    
    UITableView *left_category_list = [[UITableView alloc]initWithFrame:CGRectMake(0, 64 + left_first_btn.frame.size.height + 2, left_first_btn.frame.size.width, self.view.frame.size.height) style:
                                       UITableViewStylePlain];
    
    [self.view addSubview:left_category_list];
    
    //列表数据网络请求
    
    // 快捷方式获得session对象
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://223.4.32.216:8087/index.aspx?Method=get.goodsclass.list&Params=94D5A18EFA02559A&Sign=1483B6D1CE4822FA47DC27770720F9A2"];
    // 通过URL初始化task,在block内部可以直接对返回的数据进行处理
    NSURLSessionTask *task = [session dataTaskWithURL:url
                                   completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                       
                                       NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                       
                                       NSString *keyString = @"SDFL#)@F";
                                       
                                       NSString *JIE = [self decryptUseDES:str key:keyString];
                                       
                                       NSLog(@"%@",str);
                                       //NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
                                   }];
    
    // 启动任务
    [task resume];
    
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

//解密
- (NSString *) decryptUseDES:(NSString*)cipherText key:(NSString*)key
{
    NSData* cipherData = [GTMBase64 decodeString:cipherText];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    Byte iv[] = {1,2,3,4,5,6,7,8};
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText;
}

@end
