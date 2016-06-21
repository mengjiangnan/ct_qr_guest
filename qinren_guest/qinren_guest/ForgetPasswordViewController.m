//
//  ForgetPasswordViewController.m
//  qinren_guest
//
//  Created by qin_ren on 20/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "ForgetPasswordViewController.h"

@interface ForgetPasswordViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>

@property (nonatomic,weak) UIPickerView *mypickview;

@property (nonatomic,strong) NSArray *my_security_question_list_array;

@property (nonatomic,weak) UITextField *my_security_question_textfield;

@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"忘记密码";
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
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


    
    //标签的固定x坐标
    
    CGFloat label_x = self.view.frame.size.width * 0.1;
    
    //文本框之间的固定间距
    
    CGFloat space_height = 20;
    
    //标签与文本框之间的固定间距
    
    CGFloat space_width = 5;
    
    //文本框的固定宽
    
    CGFloat textfield_width = self.view.frame.size.width * 0.5;

    
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
    
    //新密码标签
    
    CGFloat new_pwd_label_x = label_x;
    
    CGFloat new_pwd_label_y = member_accounts_label_y + member_accounts_label.frame.size.height + space_height;
    
    CGFloat new_pwd_label_width = 0;
    
    CGFloat new_pwd_label_height = 0;
    
    CGRect  new_pwd_label_rect = CGRectMake(new_pwd_label_x, new_pwd_label_y, new_pwd_label_width, new_pwd_label_height);
    
    UILabel *new_pwd_label = [[UILabel alloc]initWithFrame:new_pwd_label_rect];
    
    new_pwd_label.text = @"新密码:";
    
    new_pwd_label.numberOfLines = 0;
    
    [new_pwd_label sizeToFit];
    
    [self.view addSubview:new_pwd_label];
    
    //新密码输入框
    
    CGFloat new_pwd_textfield_x = label_x + new_pwd_label.frame.size.width + space_width;
    
    CGFloat new_pwd_textfield_y = new_pwd_label_y;
    
    CGFloat new_pwd_textfield_width = textfield_width;
    
    CGFloat new_pwd_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect  new_pwd_textfield_rect = CGRectMake(new_pwd_textfield_x, new_pwd_textfield_y, new_pwd_textfield_width, new_pwd_textfield_height);
    
    UITextField *new_pwd_textfield = [[UITextField alloc]initWithFrame:new_pwd_textfield_rect];
    
    new_pwd_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:new_pwd_textfield];
    
    //密保问题标签
    
    CGFloat security_question_label_x = label_x;
    
    CGFloat security_question_label_y = new_pwd_label_y + new_pwd_label.frame.size.height + space_height;
    
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

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


@end