//
//  RegisterViewController.m
//  qinren_guest
//
//  Created by qin_ren on 16/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,weak) UIPickerView *mypickview;

@property (nonatomic,weak) UITextField *my_security_question_textfield;

@property (nonatomic,strong) NSArray *my_security_question_list_array;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.mypickview.delegate = self;
    
    self.mypickview.dataSource = self;
    
    CGFloat textfield_width = self.view.frame.size.width * 0.5;
    
    CGFloat space_height = 20;
    
    CGFloat space_width = 5;
    
    CGFloat label_x = self.view.frame.size.width * 0.1;
    
    self.navigationItem.title = @"注册";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    //会员帐号标签
    
    CGFloat member_accounts_label_x = label_x;
    
    CGFloat member_accounts_label_y = 84;
    
    CGFloat member_accounts_label_width = 0;
    
    CGFloat member_accounts_label_height = 0;
    
    CGRect  member_accounts_label_rect = CGRectMake(member_accounts_label_x, member_accounts_label_y, member_accounts_label_width, member_accounts_label_height);
    
    UILabel *member_accounts_label = [[UILabel alloc]initWithFrame:member_accounts_label_rect];
    
    member_accounts_label.text = @"会员帐号:";
    
    member_accounts_label.numberOfLines = 0;
    
    [member_accounts_label sizeToFit];
    
    [self.view addSubview:member_accounts_label];
    
    //会员帐号输入框
    
    CGFloat member_accounts_textfield_x = label_x + member_accounts_label.frame.size.width + space_width;
    
    CGFloat member_accounts_textfield_y = 84;
    
    CGFloat member_accounts_textfield_width = textfield_width;
    
    CGFloat member_accounts_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect  member_accounts_textfield_rect = CGRectMake(member_accounts_textfield_x, member_accounts_textfield_y, member_accounts_textfield_width,
                                                        member_accounts_textfield_height);
    
    UITextField *member_accounts_textfield = [[UITextField alloc]initWithFrame:member_accounts_textfield_rect];
    
    member_accounts_textfield.placeholder = @"手机号/用户名/会员卡号";
    
    [self.view addSubview:member_accounts_textfield];
    
    //昵称标签
    
    CGFloat nickname_label_x = label_x;
    
    CGFloat nickname_label_y = member_accounts_label_y + member_accounts_label.frame.size.height + space_height;
    
    CGFloat nickname_label_width = 0;
    
    CGFloat nickname_label_height = 0;
    
    CGRect  nickname_label_rect = CGRectMake(nickname_label_x, nickname_label_y, nickname_label_width, nickname_label_height);
    
    UILabel *nickname_label = [[UILabel alloc]initWithFrame:nickname_label_rect];
    
    nickname_label.text = @"昵称:";
    
    nickname_label.numberOfLines = 0;
    
    [nickname_label sizeToFit];
    
    [self.view addSubview:nickname_label];
    
    //昵称输入框
    
    CGFloat nickname_textfield_x = label_x + nickname_label.frame.size.width + space_width;
    
    CGFloat nickname_textfield_y = nickname_label_y;
    
    CGFloat nickname_textfield_width = textfield_width;
    
    CGFloat nickname_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect  nickname_textfield_rect = CGRectMake(nickname_textfield_x, nickname_textfield_y, nickname_textfield_width, nickname_textfield_height);
    
    UITextField *nickname_textfield = [[UITextField alloc]initWithFrame:nickname_textfield_rect];
    
    [self.view addSubview:nickname_textfield];
    
    
    //性别标签
    
    CGFloat sex_label_x = label_x;
    
    CGFloat sex_label_y = nickname_label_y + nickname_label.frame.size.height + space_height;
    
    CGFloat sex_label_width = 0;
    
    CGFloat sex_label_height = 0;
    
    CGRect sex_label_rect = CGRectMake(sex_label_x, sex_label_y, sex_label_width, sex_label_height);
    
    UILabel *sex_label = [[UILabel alloc]initWithFrame:sex_label_rect];
    
    sex_label.text = @"性别:";
    
    sex_label.numberOfLines = 0;
    
    [sex_label sizeToFit];
    
    [self.view addSubview:sex_label];
    
    //性别输入框
    
    CGFloat sex_textfield_x = label_x + sex_label.frame.size.width + space_width;
    
    CGFloat sex_textfield_y = sex_label_y;
    
    CGFloat sex_textfield_widht = textfield_width;
    
    CGFloat sex_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect sex_textfield_rect = CGRectMake(sex_textfield_x, sex_textfield_y, sex_textfield_widht, sex_textfield_height);
    
    UITextField *sex_textfield = [[UITextField alloc]initWithFrame:sex_textfield_rect];
    
    [self.view addSubview:sex_textfield];
    
    //密码标签
    
    CGFloat pwd_label_x = label_x;
    
    CGFloat pwd_label_y = sex_label_y + sex_label.frame.size.height + space_height;
    
    CGFloat pwd_label_width = 0;
    
    CGFloat pwd_label_height = 0;
    
    CGRect pwd_label_rect = CGRectMake(pwd_label_x, pwd_label_y, pwd_label_width, pwd_label_height);
    
    UILabel *pwd_label = [[UILabel alloc]initWithFrame:pwd_label_rect];
    
    pwd_label.text = @"密码:";
    
    pwd_label.numberOfLines = 0;
    
    [pwd_label sizeToFit];
    
    [self.view addSubview:pwd_label];
    
    //密码输入框
    
    CGFloat pwd_textfield_x = label_x + pwd_label.frame.size.width + space_width;
    
    CGFloat pwd_textfield_y = pwd_label_y;
    
    CGFloat pwd_textfield_width = textfield_width;
    
    CGFloat pwd_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect pwd_textfield_rect = CGRectMake(pwd_textfield_x, pwd_textfield_y, pwd_textfield_width, pwd_textfield_height);
    
    UITextField *pwd_textfield = [[UITextField alloc]initWithFrame:pwd_textfield_rect];
    
    [self.view addSubview:pwd_textfield];
    
    //确认密码标签
    
    CGFloat confirm_pwd_label_x = label_x;
    
    CGFloat confirm_pwd_label_y = pwd_label_y + pwd_label.frame.size.height + space_height;
    
    CGFloat confirm_pwd_label_width = 0;
    
    CGFloat confirm_pwd_label_height = 0;
    
    CGRect confirm_pwd_label_rect = CGRectMake(confirm_pwd_label_x, confirm_pwd_label_y, confirm_pwd_label_width, confirm_pwd_label_height);
    
    UILabel *confirm_pwd_label = [[UILabel alloc]initWithFrame:confirm_pwd_label_rect];
    
    confirm_pwd_label.text = @"确认密码:";
    
    confirm_pwd_label.numberOfLines = 0;
    
    [confirm_pwd_label sizeToFit];
    
    [self.view addSubview:confirm_pwd_label];
    
    //确认密码输入框
    
    CGFloat confirm_pwd_textfield_x = label_x + member_accounts_label.frame.size.width + space_width;
    
    CGFloat confirm_pwd_textfield_y = confirm_pwd_label_y;
    
    CGFloat confirm_pwd_textfield_width = textfield_width;
    
    CGFloat confirm_pwd_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect confirm_pwd_textfield_rect = CGRectMake(confirm_pwd_textfield_x, confirm_pwd_textfield_y, confirm_pwd_textfield_width, confirm_pwd_textfield_height);
    
    UITextField *confirm_pwd_textfield = [[UITextField alloc]initWithFrame:confirm_pwd_textfield_rect];
    
    [self.view addSubview:confirm_pwd_textfield];
    
    //密保问题标签
    
    CGFloat security_question_label_x = label_x;
    
    CGFloat security_question_label_y = confirm_pwd_label_y + confirm_pwd_label.frame.size.height + space_height;
    
    CGFloat security_question_label_width = 0;
    
    CGFloat security_question_label_height = 0;
    
    CGRect security_question_label_rect = CGRectMake(security_question_label_x, security_question_label_y, security_question_label_width, security_question_label_height);
    
    UILabel *security_question_label = [[UILabel alloc]initWithFrame:security_question_label_rect];
    
    security_question_label.text = @"密保问题:";
    
    security_question_label.numberOfLines = 0;
    
    [security_question_label sizeToFit];
    
    [self.view addSubview:security_question_label];
    
    //密保问题选择输入框
    
    CGFloat security_question_textfield_x = label_x + member_accounts_label.frame.size.width + space_width;
    
    CGFloat security_question_textfield_y = security_question_label_y;
    
    CGFloat security_question_textfield_width = textfield_width;
    
    CGFloat security_question_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect security_question_textfield_rect = CGRectMake(security_question_textfield_x, security_question_textfield_y, security_question_textfield_width, security_question_textfield_height);
    
    UITextField *security_question_textfield = [[UITextField alloc]initWithFrame:security_question_textfield_rect];
    
    security_question_textfield.placeholder = @"请选择";
    
    self.my_security_question_textfield = security_question_textfield;
    
    [self.view addSubview:self.my_security_question_textfield];
    
    NSString *path =[[NSBundle mainBundle]pathForResource:@"Qin Ren Security Questions" ofType:@"plist"];
    
    NSLog(@"%@",path); //null???


}

//为了说明,在UIPickerView中有多少列

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;

}

//为了说明每列有多少行

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.my_security_question_list_array.count;

}

//每行每列显示的内容(NSString*) -- 返回一个字符串;系统一运行,就会调用这个方法;

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    NSArray *countArray = self.my_security_question_list_array[component];
    
     NSString *rowString =countArray[row];
    
    return rowString;

}

//选中UIPickerView中的哪行哪列,通过这个方法,可以将选中的数据赋值给UILabel上,让其显示出来(void) -- 无返回值.当你只要一滑动UIPickerView,就会调用这个方法;

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    self.my_security_question_textfield = self.my_security_question_list_array[component][row];


}

-(NSArray *)security_question_list_array

{
    if (self.my_security_question_list_array == nil) {
        
        NSString *path =[[NSBundle mainBundle]pathForResource:@"Qin Ren Security Questions" ofType:@"plist"];
        
        NSLog(@"%@",path);//null???
        
        self.my_security_question_list_array=[NSArray arrayWithContentsOfFile:path];
        
    }
    
    return self.my_security_question_list_array;
}











@end