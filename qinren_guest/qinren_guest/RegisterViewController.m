//
//  RegisterViewController.m
//  qinren_guest
//
//  Created by qin_ren on 16/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>

@property (nonatomic,weak) UIPickerView *mypickview;

@property (nonatomic,weak) UITextField *my_security_question_textfield;

@property (nonatomic,weak) UITextField *my_birthday_textfield;

@property (nonatomic,weak) UITextField *my_identity_card_num_textfield;

@property (nonatomic,strong) NSArray *my_security_question_list_array;

@property (nonatomic,weak) UIDatePicker *mydatepicker;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //初始化UIDatePicker
    
    UIDatePicker *datepicker = [[UIDatePicker alloc]init];
    
    datepicker.datePickerMode = UIDatePickerModeDate;
    
    [datepicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    
    self.mydatepicker = datepicker;
    
    //初始化密保问题选项数组
    
    NSString *q1 = [NSString stringWithFormat:@"我的出生地?"];
    
    NSString *q2 = [NSString stringWithFormat:@"我的生日?"];
    
    NSString *q3 = [NSString stringWithFormat:@"我父亲的姓名?"];
    
    NSString *q4 = [NSString stringWithFormat:@"我母亲的姓名?"];
    
    NSArray *questions = [[NSArray alloc]initWithObjects:q1,q2,q3,q4, nil];
    
    self.my_security_question_list_array = questions;
    
    //初始化UIDatePicker
    
    CGFloat pickview_x = 0;
    
    CGFloat pickview_y = 0;
    
    CGFloat pickview_widht = 100;
    
    CGFloat pickview_height =100;
    
    CGRect pickview_rect = CGRectMake(pickview_x, pickview_y, pickview_widht, pickview_height);
    
    UIPickerView *pickview = [[UIPickerView alloc]initWithFrame:pickview_rect];
    
    pickview.delegate = self;
    
    pickview.dataSource = self;
    
    self.mypickview = pickview;
    
    //文本框的固定宽
    
    CGFloat textfield_width = self.view.frame.size.width * 0.5;
    
    //文本框之间的固定间距
    
    CGFloat space_height = 20;
    
    //标签与文本框之间的固定间距
    
    CGFloat space_width = 5;
    
    //标签的固定x坐标
    
    CGFloat label_x = self.view.frame.size.width * 0.1;
    
    //导航栏的标题
    
    self.navigationItem.title = @"注册";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航栏左右按钮的颜色
    
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
    
    member_accounts_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
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
    
    nickname_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
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
    
    sex_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
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
    
    pwd_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
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
    
    confirm_pwd_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
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
    
    security_question_textfield.delegate = self;
    
    security_question_textfield.placeholder = @"请选择";
    
    security_question_textfield.inputView = self.mypickview;
    
    security_question_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
    self.my_security_question_textfield = security_question_textfield;
    
    [self.view addSubview:self.my_security_question_textfield];
    
    //密保答案标签
    
    CGFloat security_answer_label_x = label_x;
    
    CGFloat security_answer_label_y = security_question_label_y + security_question_label.frame.size.height + space_height;
    
    CGFloat security_answer_label_width = 0;
    
    CGFloat security_answer_label_height = 0;
    
    CGRect security_answer_label_rect = CGRectMake(security_answer_label_x, security_answer_label_y, security_answer_label_width, security_answer_label_height);
    
    UILabel *security_answer_label = [[UILabel alloc]initWithFrame:security_answer_label_rect];
    
    security_answer_label.text = @"密保答案:";
    
    security_answer_label.numberOfLines = 0;
    
    [security_answer_label sizeToFit];
    
    [self.view addSubview:security_answer_label];
    
    //密保答案输入框
    
    CGFloat security_answer_textfield_x = label_x + member_accounts_label.frame.size.width + space_width;
    
    CGFloat security_answer_textfield_y = security_answer_label_y;
    
    CGFloat security_answer_textfield_width = textfield_width;
    
    CGFloat security_answer_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect security_answer_textfield_rect = CGRectMake(security_answer_textfield_x, security_answer_textfield_y, security_answer_textfield_width, security_answer_textfield_height);
    
    UITextField *security_answer_textfield = [[UITextField alloc]initWithFrame:security_answer_textfield_rect];
    
    security_answer_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:security_answer_textfield];
    
    //出生日期标签
    
    CGFloat birthday_label_x = label_x;
    
    CGFloat birthday_label_y = security_answer_label_y + security_answer_label.frame.size.height + space_height;
    
    CGFloat birthday_label_width = 0;
    
    CGFloat birthday_label_height = 0;
    
    CGRect birthday_label_rect = CGRectMake(birthday_label_x, birthday_label_y, birthday_label_width, birthday_label_height);
    
    UILabel *birthday_label = [[UILabel alloc]initWithFrame:birthday_label_rect];
    
    birthday_label.text = @"出生日期:";
    
    birthday_label.numberOfLines = 0;
    
    [birthday_label sizeToFit];
    
    [self.view addSubview:birthday_label];
    
    //出生日期输入框
    
    CGFloat birthday_textfield_x = label_x + member_accounts_label.frame.size.width + space_width;
    
    CGFloat birthday_textfield_y = birthday_label_y;
    
    CGFloat birthday_textfield_width = textfield_width;
    
    CGFloat birthday_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect birthday_textfield_rect = CGRectMake(birthday_textfield_x, birthday_textfield_y, birthday_textfield_width, birthday_textfield_height);
    
    UITextField *birthday_textfield = [[UITextField alloc]initWithFrame:birthday_textfield_rect];
    
    birthday_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
    birthday_textfield.placeholder = @"请选择";
    
    birthday_textfield.inputView = self.mydatepicker;
    
    self.my_birthday_textfield = birthday_textfield;
    
    [self.view addSubview:birthday_textfield];
    
    //真实姓名标签
    
    CGFloat real_name_label_x = label_x;
    
    CGFloat real_name_label_y = birthday_label_y + birthday_label.frame.size.height + space_height;
    
    CGFloat real_name_label_width = 0;
    
    CGFloat real_name_label_height = 0;
    
    CGRect real_name_label_rect = CGRectMake(real_name_label_x, real_name_label_y, real_name_label_width, real_name_label_height);
    
    UILabel *real_name_label = [[UILabel alloc]initWithFrame:real_name_label_rect];
    
    real_name_label.text = @"真实姓名:";
    
    real_name_label.numberOfLines = 0;
    
    [real_name_label sizeToFit];
    
    [self.view addSubview:real_name_label];
    
    //真实姓名输入框
    
    CGFloat real_name_textfield_x = label_x + member_accounts_label.frame.size.width + space_width;
    
    CGFloat real_name_textfield_y = real_name_label_y;
    
    CGFloat real_name_textfield_width = textfield_width;
    
    CGFloat real_name_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect real_name_textfield_rect = CGRectMake(real_name_textfield_x, real_name_textfield_y, real_name_textfield_width, real_name_textfield_height);
    
    UITextField *real_name_textfield = [[UITextField alloc]initWithFrame:real_name_textfield_rect];
    
    real_name_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:real_name_textfield];
    
    //身份证号标签
    
    CGFloat identity_card_num_label_x = label_x;
    
    CGFloat identity_card_num_label_y = real_name_label_y + real_name_label.frame.size.height + space_height;
    
    CGFloat identity_card_num_label_width = 0;
    
    CGFloat identity_card_num_label_height = 0;
    
    CGRect identity_card_num_label_rect = CGRectMake(identity_card_num_label_x, identity_card_num_label_y, identity_card_num_label_width, identity_card_num_label_height);
    
    UILabel *identity_card_num_label = [[UILabel alloc]initWithFrame:identity_card_num_label_rect];
    
    identity_card_num_label.text = @"身份证号:";
    
    identity_card_num_label.numberOfLines = 0;
    
    [identity_card_num_label sizeToFit];
    
    [self.view addSubview:identity_card_num_label];
    
    //身份证号输入框
    
    /*每隔0.1秒验证身份证输入框*/
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(checkCardInfoInput) userInfo:nil repeats:YES];
    
    CGFloat identity_card_num_textfield_x = label_x + member_accounts_label.frame.size.width + space_width;
    
    CGFloat identity_card_num_textfield_y = identity_card_num_label_y;
    
    CGFloat identity_card_num_textfield_width = textfield_width;
    
    CGFloat identity_card_num_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect identity_card_num_textfield_rect = CGRectMake(identity_card_num_textfield_x, identity_card_num_textfield_y, identity_card_num_textfield_width, identity_card_num_textfield_height);
    
    UITextField *identity_card_num_textfield = [[UITextField alloc]initWithFrame:identity_card_num_textfield_rect];
    
    identity_card_num_textfield.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    
    identity_card_num_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
    self.my_identity_card_num_textfield = identity_card_num_textfield;
    
    [self.view addSubview:self.my_identity_card_num_textfield];
    
    //联系电话标签
    
    CGFloat contact_phone_label_x = label_x;
    
    CGFloat contact_phone_label_y = identity_card_num_label_y + identity_card_num_label.frame.size.height + space_height;
    
    CGFloat contact_phone_label_width = 0;
    
    CGFloat contact_phone_label_height = 0;
    
    CGRect contact_phone_label_rect = CGRectMake(contact_phone_label_x, contact_phone_label_y, contact_phone_label_width, contact_phone_label_height);
    
    UILabel *contact_phone_label = [[UILabel alloc]initWithFrame:contact_phone_label_rect];
    
    contact_phone_label.text = @"联系电话:";
    
    contact_phone_label.numberOfLines = 0;
    
    [contact_phone_label sizeToFit];
    
    [self.view addSubview:contact_phone_label];
    
    //联系电话输入框
    
    CGFloat contact_phone_textfield_x = label_x + member_accounts_label.frame.size.width + space_width;
    
    CGFloat contact_phone_textfield_y = contact_phone_label_y;
    
    CGFloat contact_phone_textfield_width = textfield_width;
    
    CGFloat contact_phone_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect contact_phone_textfield_rect = CGRectMake(contact_phone_textfield_x, contact_phone_textfield_y, contact_phone_textfield_width,
                                                     contact_phone_textfield_height);
    
    UITextField *contact_phone_textfield = [[UITextField alloc]initWithFrame:contact_phone_textfield_rect];
    
    contact_phone_textfield.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    
    contact_phone_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:contact_phone_textfield];
    
    //健康管家标签
    
    CGFloat health_manager_label_x = label_x;
    
    CGFloat health_manager_label_y = contact_phone_label_y + contact_phone_label.frame.size.height + space_height;
    
    CGFloat health_manager_label_width = 0;
    
    CGFloat health_manager_label_height = 0;
    
    CGRect health_manager_label_rect = CGRectMake(health_manager_label_x, health_manager_label_y, health_manager_label_width,
                                                  health_manager_label_height);
    
    UILabel *health_manager_label = [[UILabel alloc]initWithFrame:health_manager_label_rect];
    
    health_manager_label.text = @"健康管家:";
    
    health_manager_label.numberOfLines = 0;
    
    [health_manager_label sizeToFit];
    
    [self.view addSubview:health_manager_label];
    
    //健康管家输入框
    
    CGFloat health_manager_textfield_x = label_x + member_accounts_label.frame.size.width + space_width;
    
    CGFloat health_manager_textfield_y = health_manager_label_y;
    
    CGFloat health_manager_textfield_width = textfield_width;
    
    CGFloat health_manager_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect health_manager_textfield_rect = CGRectMake(health_manager_textfield_x, health_manager_textfield_y, health_manager_textfield_width,
                                                      health_manager_textfield_height);
    
    UITextField *health_manager_textfield = [[UITextField alloc]initWithFrame:health_manager_textfield_rect];
    
    health_manager_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:health_manager_textfield];
    
    //我的健康管理项目标签
    
    CGFloat my_health_manager_item_label_x = label_x;
    
    CGFloat my_health_manager_item_label_y = health_manager_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat my_health_manager_item_label_width = 0;
    
    CGFloat my_health_manager_item_label_height = 0;
    
    CGRect my_health_manager_item_label_rect = CGRectMake(my_health_manager_item_label_x, my_health_manager_item_label_y,
                                                          my_health_manager_item_label_width,my_health_manager_item_label_height);
    
    UILabel *my_health_manager_item_label = [[UILabel alloc]initWithFrame:my_health_manager_item_label_rect];
    
    my_health_manager_item_label.text = @"我的健康管理项目:";
    
    my_health_manager_item_label.numberOfLines = 0;
    
    [my_health_manager_item_label sizeToFit];
    
    [self.view addSubview:my_health_manager_item_label];




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
        
     NSString *rowString =self.my_security_question_list_array[row];
    
    return rowString;

}

//选中UIPickerView中的哪行哪列,通过这个方法,可以将选中的数据赋值给UItextfield上,让其显示出来(void) -- 无返回值.当你只要一滑动UIPickerView,就会调用这个方法;

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    
    self.my_security_question_textfield.text = self.my_security_question_list_array[row];


}

/*点击空白处，收起输入控件*/

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    [self.view endEditing:YES];
    
}

/*点击文本框，开始编辑时，文本框的内容改成“我的出生地”*/

-(void)textFieldDidBeginEditing:(UITextField *)textField

{
  self.my_security_question_textfield.text = @"我的出生地?";
   
}

/*点击文本框，结束编辑以后。验证身份证号码是不是15位或18位*/


/*点击日期控件时，将选中的日期填写到文本框中*/

-(void)dateChanged:(id)sender

{
    self.mydatepicker = (UIDatePicker*)sender;
    
    NSDate* date = self.mydatepicker.date;
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    
    [df setDateFormat:@"yyyy-MM-dd"];
    
    NSString* str = [df stringFromDate:date];
    
    self.my_birthday_textfield.text = str;

}

/*验证身份证号码是否为15或18位，如果不是输入的号码将变成红色*/

-(void)checkCardInfoInput
{
    BOOL isValid = YES;
    
    if ((self.my_identity_card_num_textfield.text.length == 15)||(self.my_identity_card_num_textfield.text.length == 18)){
        
        self.my_identity_card_num_textfield.textColor = [UIColor blackColor];
        
        self.my_identity_card_num_textfield.text?[self.my_identity_card_num_textfield.text substringWithRange:NSMakeRange(0, 15)]:[self.my_identity_card_num_textfield.text substringWithRange:NSMakeRange(0, 18)];
    
       }
    
    else{
        
        self.my_identity_card_num_textfield.textColor = [UIColor redColor];
        
        isValid = NO;
    }
}


@end
