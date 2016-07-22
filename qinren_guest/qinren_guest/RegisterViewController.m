//
//  RegisterViewController.m
//  qinren_guest
//
//  Created by qin_ren on 16/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "RegisterViewController.h"

#import "NSString+toHexString.h"

#import "ProgressHUD.h"

@interface RegisterViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate,NSURLSessionDataDelegate>

@property (nonatomic,weak) UIPickerView *mypickview;

@property (nonatomic,weak) UITextField *my_security_question_textfield;

@property (nonatomic,weak) UITextField *my_birthday_textfield;

@property (nonatomic,weak) UITextField *my_identity_card_num_textfield;

@property (nonatomic,strong) NSArray *my_security_question_list_array;

@property (nonatomic,weak) UIDatePicker *mydatepicker;

@property (nonatomic,strong) UITextField *myusername;

@property (nonatomic,strong) UITextField *mypassword;

@property (nonatomic,strong) UITextField *myrealname;

@property (nonatomic,strong) UITextField *myquestion_id;

@property (nonatomic,strong) UITextField *mynickname;

@property (nonatomic,strong) UITextField *mymobile;

@property (nonatomic,strong) UITextField *myhousekeeper;

@property (nonatomic,strong) UITextField *myanswer;

@property (nonatomic,strong) NSString *registerstatus;

@property (nonatomic,weak) UIButton *myregisterbtn;

@property (nonatomic,assign) CGRect myscorllviewrect;

@end

@implementation RegisterViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UISwitch *myswitch = [[UISwitch alloc]init];
    
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
    
    //添加全屏子控件scrollview
    
    UIScrollView *mainview;
    
    CGFloat mainview_x = 0;
    
    CGFloat mainview_y = -64;
    
    CGFloat mainview_width = self.view.frame.size.width;
    
    CGFloat mainview_height = self.view.frame.size.height;
    
    CGRect  mainview_rect = CGRectMake(mainview_x, mainview_y, mainview_width, mainview_height);
    
    self.myscorllviewrect = mainview_rect;
    
    mainview = [[UIScrollView alloc] initWithFrame:mainview_rect];
    
    mainview.contentSize = CGSizeMake(self.view.frame.size.width, space_height*72);
    
    [self.view addSubview:mainview];
    
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
    
    [mainview addSubview:member_accounts_label];
    
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
    
    [mainview addSubview:member_accounts_textfield];
    
    self.myusername = member_accounts_textfield;
    
    [self.myusername addTarget:self action:@selector(textchange) forControlEvents:UIControlEventEditingDidEnd];
    
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
    
    [mainview addSubview:nickname_label];
    
    //昵称输入框
    
    CGFloat nickname_textfield_x = label_x + nickname_label.frame.size.width + space_width;
    
    CGFloat nickname_textfield_y = nickname_label_y;
    
    CGFloat nickname_textfield_width = textfield_width;
    
    CGFloat nickname_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect  nickname_textfield_rect = CGRectMake(nickname_textfield_x, nickname_textfield_y, nickname_textfield_width, nickname_textfield_height);
    
    UITextField *nickname_textfield = [[UITextField alloc]initWithFrame:nickname_textfield_rect];
    
    nickname_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
    [mainview addSubview:nickname_textfield];
    
    self.mynickname = nickname_textfield;
    
    
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
    
    [mainview addSubview:sex_label];
    
    //性别输入框
    
    CGFloat sex_textfield_x = label_x + sex_label.frame.size.width + space_width;
    
    CGFloat sex_textfield_y = sex_label_y;
    
    CGFloat sex_textfield_widht = textfield_width;
    
    CGFloat sex_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect sex_textfield_rect = CGRectMake(sex_textfield_x, sex_textfield_y, sex_textfield_widht, sex_textfield_height);
    
    UITextField *sex_textfield = [[UITextField alloc]initWithFrame:sex_textfield_rect];
    
    sex_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
    [mainview addSubview:sex_textfield];
    
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
    
    [mainview addSubview:pwd_label];
    
    //密码输入框
    
    CGFloat pwd_textfield_x = label_x + pwd_label.frame.size.width + space_width;
    
    CGFloat pwd_textfield_y = pwd_label_y;
    
    CGFloat pwd_textfield_width = textfield_width;
    
    CGFloat pwd_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect pwd_textfield_rect = CGRectMake(pwd_textfield_x, pwd_textfield_y, pwd_textfield_width, pwd_textfield_height);
    
    UITextField *pwd_textfield = [[UITextField alloc]initWithFrame:pwd_textfield_rect];
    
    pwd_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
    [mainview addSubview:pwd_textfield];
    
    self.mypassword = pwd_textfield;
    
    [self.mypassword addTarget:self action:@selector(textchange) forControlEvents:UIControlEventEditingDidEnd];
    
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
    
    [mainview addSubview:confirm_pwd_label];
    
    //确认密码输入框
    
    CGFloat confirm_pwd_textfield_x = label_x + member_accounts_label.frame.size.width + space_width;
    
    CGFloat confirm_pwd_textfield_y = confirm_pwd_label_y;
    
    CGFloat confirm_pwd_textfield_width = textfield_width;
    
    CGFloat confirm_pwd_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect confirm_pwd_textfield_rect = CGRectMake(confirm_pwd_textfield_x, confirm_pwd_textfield_y, confirm_pwd_textfield_width, confirm_pwd_textfield_height);
    
    UITextField *confirm_pwd_textfield = [[UITextField alloc]initWithFrame:confirm_pwd_textfield_rect];
    
    confirm_pwd_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
    [mainview addSubview:confirm_pwd_textfield];
    
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
    
    [mainview addSubview:security_question_label];
    
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
    
    [mainview addSubview:self.my_security_question_textfield];
    
    
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
    
    [mainview addSubview:security_answer_label];
    
    //密保答案输入框
    
    CGFloat security_answer_textfield_x = label_x + member_accounts_label.frame.size.width + space_width;
    
    CGFloat security_answer_textfield_y = security_answer_label_y;
    
    CGFloat security_answer_textfield_width = textfield_width;
    
    CGFloat security_answer_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect security_answer_textfield_rect = CGRectMake(security_answer_textfield_x, security_answer_textfield_y, security_answer_textfield_width, security_answer_textfield_height);
    
    UITextField *security_answer_textfield = [[UITextField alloc]initWithFrame:security_answer_textfield_rect];
    
    security_answer_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
    [mainview addSubview:security_answer_textfield];
    
    self.myanswer = security_answer_textfield;
    
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
    
    [mainview addSubview:birthday_label];
    
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
    
    [mainview addSubview:birthday_textfield];
    
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
    
    [mainview addSubview:real_name_label];
    
    //真实姓名输入框
    
    CGFloat real_name_textfield_x = label_x + member_accounts_label.frame.size.width + space_width;
    
    CGFloat real_name_textfield_y = real_name_label_y;
    
    CGFloat real_name_textfield_width = textfield_width;
    
    CGFloat real_name_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect real_name_textfield_rect = CGRectMake(real_name_textfield_x, real_name_textfield_y, real_name_textfield_width, real_name_textfield_height);
    
    UITextField *real_name_textfield = [[UITextField alloc]initWithFrame:real_name_textfield_rect];
    
    real_name_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
    [mainview addSubview:real_name_textfield];
    
    self.myrealname = real_name_textfield;
    
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
    
    [mainview addSubview:identity_card_num_label];
    
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
    
    [mainview addSubview:self.my_identity_card_num_textfield];
    
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
    
    [mainview addSubview:contact_phone_label];
    
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
    
    [mainview addSubview:contact_phone_textfield];
    
    self.mymobile = contact_phone_textfield;
    
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
    
    [mainview addSubview:health_manager_label];
    
    //健康管家输入框
    
    CGFloat health_manager_textfield_x = label_x + member_accounts_label.frame.size.width + space_width;
    
    CGFloat health_manager_textfield_y = health_manager_label_y;
    
    CGFloat health_manager_textfield_width = textfield_width;
    
    CGFloat health_manager_textfield_height = member_accounts_label.frame.size.height;
    
    CGRect health_manager_textfield_rect = CGRectMake(health_manager_textfield_x, health_manager_textfield_y, health_manager_textfield_width,
                                                      health_manager_textfield_height);
    
    UITextField *health_manager_textfield = [[UITextField alloc]initWithFrame:health_manager_textfield_rect];
    
    health_manager_textfield.clearButtonMode = UITextFieldViewModeAlways;
    
    [mainview addSubview:health_manager_textfield];
    
    self.myhousekeeper = health_manager_textfield;
    
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
    
    [mainview addSubview:my_health_manager_item_label];
    
    //高血压标签
    
    CGFloat hypertension_label_x = label_x;
    
    CGFloat hypertension_label_y = my_health_manager_item_label_y + my_health_manager_item_label.frame.size.height + space_height;
    
    CGFloat hypertension_label_width = 0;
    
    CGFloat hypertension_label_height = 0;
    
    CGRect hypertension_label_rect = CGRectMake(hypertension_label_x, hypertension_label_y,
                                                          hypertension_label_width,hypertension_label_height);
    
    UILabel *hypertension_label = [[UILabel alloc]initWithFrame:hypertension_label_rect];
    
    hypertension_label.text = @"高血压";
    
   hypertension_label.numberOfLines = 0;
    
    [hypertension_label sizeToFit];
    
    [mainview addSubview:hypertension_label];
    
    //高血压单选按钮
    
    CGFloat hypertension_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat hypertension_switch_btn_y = hypertension_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat hypertension_switch_btn_width = 0;
    
    CGFloat hypertension_switch_btn_height = 0;
    
    CGRect hypertension_switch_btn_rect = CGRectMake(hypertension_switch_btn_x, hypertension_switch_btn_y,
                                                hypertension_switch_btn_width,hypertension_switch_btn_height);
    
    UISwitch *hypertension_switch = [[UISwitch alloc]initWithFrame:hypertension_switch_btn_rect];
    
    [mainview addSubview:hypertension_switch];
    
    //血脂异常标签
    
    CGFloat dyslipidemia_label_x = label_x;
    
    CGFloat dyslipidemia_label_y = hypertension_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat dyslipidemia_label_width = 0;
    
    CGFloat dyslipidemia_label_height = 0;
    
    CGRect dyslipidemia_label_rect = CGRectMake(dyslipidemia_label_x, dyslipidemia_label_y,
                                                dyslipidemia_label_width,dyslipidemia_label_height);
    
    UILabel *dyslipidemia_label = [[UILabel alloc]initWithFrame:dyslipidemia_label_rect];
    
    dyslipidemia_label.text = @"血脂异常";
    
    dyslipidemia_label.numberOfLines = 0;
    
    [dyslipidemia_label sizeToFit];
    
    [mainview addSubview:dyslipidemia_label];
    
    //血脂异常单选按钮
    
    CGFloat dyslipidemia_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat dyslipidemia_switch_btn_y = dyslipidemia_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat dyslipidemia_switch_btn_width = 0;
    
    CGFloat dyslipidemia_switch_btn_height = 0;
    
    CGRect dyslipidemia_switch_btn_rect = CGRectMake(dyslipidemia_switch_btn_x, dyslipidemia_switch_btn_y,
                                                     dyslipidemia_switch_btn_width,dyslipidemia_switch_btn_height);
    
    UISwitch *dyslipidemia_switch = [[UISwitch alloc]initWithFrame:dyslipidemia_switch_btn_rect];
    
    [mainview addSubview:dyslipidemia_switch];
    
    //糖尿病标签
    
    CGFloat diabetes_label_x = label_x;
    
    CGFloat diabetes_label_y = dyslipidemia_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat diabetes_label_width = 0;
    
    CGFloat diabetes_label_height = 0;
    
    CGRect diabetes_label_rect = CGRectMake(diabetes_label_x, diabetes_label_y,
                                                diabetes_label_width,diabetes_label_height);
    
    UILabel *diabetes_label = [[UILabel alloc]initWithFrame:diabetes_label_rect];
    
    diabetes_label.text = @"糖尿病";
    
    diabetes_label.numberOfLines = 0;
    
    [diabetes_label sizeToFit];
    
    [mainview addSubview:diabetes_label];
    
    //糖尿病单选按钮
    
    CGFloat diabetes_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat diabetes_switch_btn_y = diabetes_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat diabetes_switch_btn_width = 0;
    
    CGFloat diabetes_switch_btn_height = 0;
    
    CGRect diabetes_switch_btn_rect = CGRectMake(diabetes_switch_btn_x, diabetes_switch_btn_y,
                                                     diabetes_switch_btn_width,diabetes_switch_btn_height);
    
    UISwitch *diabetes_switch = [[UISwitch alloc]initWithFrame:diabetes_switch_btn_rect];
    
    [mainview addSubview:diabetes_switch];
    
    //肥胖症标签
    
    CGFloat obesity_label_x = label_x;
    
    CGFloat obesity_label_y = diabetes_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat obesity_label_width = 0;
    
    CGFloat obesity_label_height = 0;
    
    CGRect obesity_label_rect = CGRectMake(obesity_label_x, obesity_label_y,
                                            obesity_label_width,obesity_label_height);
    
    UILabel *obesity_label = [[UILabel alloc]initWithFrame:obesity_label_rect];
    
    obesity_label.text = @"肥胖症";
    
    obesity_label.numberOfLines = 0;
    
    [obesity_label sizeToFit];
    
    [mainview addSubview:obesity_label];
    
    //肥胖症单选按钮
    
    CGFloat obesity_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat obesity_switch_btn_y = obesity_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat obesity_switch_btn_width = 0;
    
    CGFloat obesity_switch_btn_height = 0;
    
    CGRect obesity_switch_btn_rect = CGRectMake(obesity_switch_btn_x, obesity_switch_btn_y,
                                                 obesity_switch_btn_width,obesity_switch_btn_height);
    
    UISwitch *obesity_switch = [[UISwitch alloc]initWithFrame:obesity_switch_btn_rect];
    
    [mainview addSubview:obesity_switch];
    
    //肺癌标签
    
    CGFloat lung_cancer_label_x = label_x;
    
    CGFloat lung_cancer_label_y = obesity_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat lung_cancer_label_width = 0;
    
    CGFloat lung_cancer_label_height = 0;
    
    CGRect lung_cancer_label_rect = CGRectMake(lung_cancer_label_x, lung_cancer_label_y,
                                           lung_cancer_label_width,lung_cancer_label_height);
    
    UILabel *lung_cancer_label = [[UILabel alloc]initWithFrame:lung_cancer_label_rect];
    
    lung_cancer_label.text = @"肺癌";
    
    lung_cancer_label.numberOfLines = 0;
    
    [lung_cancer_label sizeToFit];
    
    [mainview addSubview:lung_cancer_label];
    
    //肺癌单选按钮
    
    CGFloat lung_cancer_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat lung_cancer_switch_btn_y = lung_cancer_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat lung_cancer_switch_btn_width = 0;
    
    CGFloat lung_cancer_switch_btn_height = 0;
    
    CGRect lung_cancer_switch_btn_rect = CGRectMake(lung_cancer_switch_btn_x, lung_cancer_switch_btn_y,
                                                lung_cancer_switch_btn_width,lung_cancer_switch_btn_height);
    
    UISwitch *lung_cancer_switch = [[UISwitch alloc]initWithFrame:lung_cancer_switch_btn_rect];
    
    [mainview addSubview:lung_cancer_switch];
    
    //缺血性心血管标签
    
    CGFloat ischaemic_heart_disease_label_x = label_x;
    
    CGFloat ischaemic_heart_disease_label_y = lung_cancer_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat ischaemic_heart_disease_label_width = 0;
    
    CGFloat ischaemic_heart_disease_label_height = 0;
    
    CGRect ischaemic_heart_disease_label_rect = CGRectMake(ischaemic_heart_disease_label_x, ischaemic_heart_disease_label_y,
                                               ischaemic_heart_disease_label_width,ischaemic_heart_disease_label_height);
    
    UILabel *ischaemic_heart_disease_label = [[UILabel alloc]initWithFrame:ischaemic_heart_disease_label_rect];
    
    ischaemic_heart_disease_label.text = @"缺血性心血管";
    
    ischaemic_heart_disease_label.numberOfLines = 0;
    
    [ischaemic_heart_disease_label sizeToFit];
    
    [mainview addSubview:ischaemic_heart_disease_label];
    
    //缺血性心血管单选按钮
    
    CGFloat ischaemic_heart_disease_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat ischaemic_heart_disease_switch_btn_y = ischaemic_heart_disease_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat ischaemic_heart_disease_switch_btn_width = 0;
    
    CGFloat ischaemic_heart_disease_switch_btn_height = 0;
    
    CGRect ischaemic_heart_disease_switch_btn_rect = CGRectMake(ischaemic_heart_disease_switch_btn_x, ischaemic_heart_disease_switch_btn_y,
                                                    ischaemic_heart_disease_switch_btn_width,ischaemic_heart_disease_switch_btn_height);
    
    UISwitch *ischaemic_heart_disease_switch = [[UISwitch alloc]initWithFrame:ischaemic_heart_disease_switch_btn_rect];
    
    [mainview addSubview:ischaemic_heart_disease_switch];
    
    //骨质疏松症标签
    
    CGFloat Osteoporosis_label_x = label_x;
    
    CGFloat Osteoporosis_label_y = ischaemic_heart_disease_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat Osteoporosis_label_width = 0;
    
    CGFloat Osteoporosis_label_height = 0;
    
    CGRect Osteoporosis_label_rect = CGRectMake(Osteoporosis_label_x, Osteoporosis_label_y,
                                                           Osteoporosis_label_width,Osteoporosis_label_height);
    
    UILabel *Osteoporosis_label = [[UILabel alloc]initWithFrame:Osteoporosis_label_rect];
    
    Osteoporosis_label.text = @"骨质疏松症";
    
    Osteoporosis_label.numberOfLines = 0;
    
    [Osteoporosis_label sizeToFit];
    
    [mainview addSubview:Osteoporosis_label];
    
    //骨质疏松症单选按钮
    
    CGFloat Osteoporosis_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat Osteoporosis_switch_btn_y = Osteoporosis_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat Osteoporosis_switch_btn_width = 0;
    
    CGFloat Osteoporosis_switch_btn_height = 0;
    
    CGRect Osteoporosis_switch_btn_rect = CGRectMake(Osteoporosis_switch_btn_x, Osteoporosis_switch_btn_y,
                                                                Osteoporosis_switch_btn_width,Osteoporosis_switch_btn_height);
    
    UISwitch *Osteoporosis_switch = [[UISwitch alloc]initWithFrame:Osteoporosis_switch_btn_rect];
    
    [mainview addSubview:Osteoporosis_switch];
    
    //乳腺癌标签
    
    CGFloat breast_cancer_label_x = label_x;
    
    CGFloat breast_cancer_label_y = Osteoporosis_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat breast_cancer_label_width = 0;
    
    CGFloat breast_cancer_label_height = 0;
    
    CGRect breast_cancer_label_rect = CGRectMake(breast_cancer_label_x, breast_cancer_label_y,
                                                breast_cancer_label_width,breast_cancer_label_height);
    
    UILabel *breast_cancer_label = [[UILabel alloc]initWithFrame:breast_cancer_label_rect];
    
    breast_cancer_label.text = @"乳腺癌";
    
    breast_cancer_label.numberOfLines = 0;
    
    [breast_cancer_label sizeToFit];
    
    [mainview addSubview:breast_cancer_label];
    
    //乳腺癌单选按钮
    
    CGFloat breast_cancer_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat breast_cancer_switch_btn_y = breast_cancer_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat breast_cancer_switch_btn_width = 0;
    
    CGFloat breast_cancer_switch_btn_height = 0;
    
    CGRect breast_cancer_switch_btn_rect = CGRectMake(breast_cancer_switch_btn_x, breast_cancer_switch_btn_y,
                                                     breast_cancer_switch_btn_width,breast_cancer_switch_btn_height);
    
    UISwitch *breast_cancer_switch = [[UISwitch alloc]initWithFrame:breast_cancer_switch_btn_rect];
    
    [mainview addSubview:breast_cancer_switch];
    
    //前列腺癌标签
    
    CGFloat prostate_cancer_label_x = label_x;
    
    CGFloat prostate_cancer_label_y = breast_cancer_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat prostate_cancer_label_width = 0;
    
    CGFloat prostate_cancer_label_height = 0;
    
    CGRect prostate_cancer_label_rect = CGRectMake(prostate_cancer_label_x, prostate_cancer_label_y,
                                                 prostate_cancer_label_width,prostate_cancer_label_height);
    
    UILabel *prostate_cancer_label = [[UILabel alloc]initWithFrame:prostate_cancer_label_rect];
    
    prostate_cancer_label.text = @"前列腺癌";
    
    prostate_cancer_label.numberOfLines = 0;
    
    [prostate_cancer_label sizeToFit];
    
    [mainview addSubview:prostate_cancer_label];
    
    //前列腺癌单选按钮
    
    CGFloat prostate_cancer_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat prostate_cancer_switch_btn_y = prostate_cancer_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat prostate_cancer_switch_btn_width = 0;
    
    CGFloat prostate_cancer_switch_btn_height = 0;
    
    CGRect prostate_cancer_switch_btn_rect = CGRectMake(prostate_cancer_switch_btn_x, prostate_cancer_switch_btn_y,
                                                      prostate_cancer_switch_btn_width,prostate_cancer_switch_btn_height);
    
    UISwitch *prostate_cancer_switch = [[UISwitch alloc]initWithFrame:prostate_cancer_switch_btn_rect];
    
    [mainview addSubview:prostate_cancer_switch];
    
    //代谢综合症标签
    
    CGFloat metabolic_syndrome_label_x = label_x;
    
    CGFloat metabolic_syndrome_label_y = prostate_cancer_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat metabolic_syndrome_label_width = 0;
    
    CGFloat metabolic_syndrome_label_height = 0;
    
    CGRect metabolic_syndrome_label_rect = CGRectMake(metabolic_syndrome_label_x, metabolic_syndrome_label_y,
                                                   metabolic_syndrome_label_width,metabolic_syndrome_label_height);
    
    UILabel *metabolic_syndrome_label = [[UILabel alloc]initWithFrame:metabolic_syndrome_label_rect];
    
    metabolic_syndrome_label.text = @"代谢综合症";
    
    metabolic_syndrome_label.numberOfLines = 0;
    
    [metabolic_syndrome_label sizeToFit];
    
    [mainview addSubview:metabolic_syndrome_label];
    
    //代谢综合症单选按钮
    
    CGFloat metabolic_syndrome_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat metabolic_syndrome_switch_btn_y = metabolic_syndrome_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat metabolic_syndrome_switch_btn_width = 0;
    
    CGFloat metabolic_syndrome_switch_btn_height = 0;
    
    CGRect metabolic_syndrome_switch_btn_rect = CGRectMake(metabolic_syndrome_switch_btn_x, metabolic_syndrome_switch_btn_y,
                                                        metabolic_syndrome_switch_btn_width,metabolic_syndrome_switch_btn_height);
    
    UISwitch *metabolic_syndrome_switch = [[UISwitch alloc]initWithFrame:metabolic_syndrome_switch_btn_rect];
    
    [mainview addSubview:metabolic_syndrome_switch];
    
    //尼古丁成瘾标签
    
    CGFloat nicotine_addiction_label_x = label_x;
    
    CGFloat nicotine_addiction_label_y = metabolic_syndrome_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat nicotine_addiction_label_width = 0;
    
    CGFloat nicotine_addiction_label_height = 0;
    
    CGRect nicotine_addiction_label_rect = CGRectMake(nicotine_addiction_label_x, nicotine_addiction_label_y,
                                                      nicotine_addiction_label_width,nicotine_addiction_label_height);
    
    UILabel *nicotine_addiction_label = [[UILabel alloc]initWithFrame:nicotine_addiction_label_rect];
    
    nicotine_addiction_label.text = @"尼古丁成瘾";
    
    nicotine_addiction_label.numberOfLines = 0;
    
    [nicotine_addiction_label sizeToFit];
    
    [mainview addSubview:nicotine_addiction_label];
    
    //尼古丁成瘾单选按钮
    
    CGFloat nicotine_addiction_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat nicotine_addiction_switch_btn_y = nicotine_addiction_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat nicotine_addiction_switch_btn_width = 0;
    
    CGFloat nicotine_addiction_switch_btn_height = 0;
    
    CGRect nicotine_addiction_switch_btn_rect = CGRectMake(nicotine_addiction_switch_btn_x, nicotine_addiction_switch_btn_y,
                                                           nicotine_addiction_switch_btn_width,nicotine_addiction_switch_btn_height);
    
    UISwitch *nicotine_addiction_switch = [[UISwitch alloc]initWithFrame:nicotine_addiction_switch_btn_rect];
    
    [mainview addSubview:nicotine_addiction_switch];
    
    //心血管疾病标签
    
    CGFloat CVD_label_x = label_x;
    
    CGFloat CVD_label_y = nicotine_addiction_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat CVD_label_width = 0;
    
    CGFloat CVD_label_height = 0;
    
    CGRect CVD_label_rect = CGRectMake(CVD_label_x, CVD_label_y,CVD_label_width,CVD_label_height);
    
    UILabel *CVD_label = [[UILabel alloc]initWithFrame:CVD_label_rect];
    
    CVD_label.text = @"心血管疾病";
    
    CVD_label.numberOfLines = 0;
    
    [CVD_label sizeToFit];
    
    [mainview addSubview:CVD_label];
    
    //心血管疾病单选按钮
    
    CGFloat CVD_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat CVD_switch_btn_y = CVD_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat CVD_switch_btn_width = 0;
    
    CGFloat CVD_switch_btn_height = 0;
    
    CGRect CVD_switch_btn_rect = CGRectMake(CVD_switch_btn_x, CVD_switch_btn_y,CVD_switch_btn_width,CVD_switch_btn_height);
    
    UISwitch *CVD_switch = [[UISwitch alloc]initWithFrame:CVD_switch_btn_rect];
    
    [mainview addSubview:CVD_switch];
    
    //女性更年期标签
    
    CGFloat menopause_label_x = label_x;
    
    CGFloat menopause_label_y = CVD_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat menopause_label_width = 0;
    
    CGFloat menopause_label_height = 0;
    
    CGRect menopause_label_rect = CGRectMake(menopause_label_x, menopause_label_y,menopause_label_width,menopause_label_height);
    
    UILabel *menopause_label = [[UILabel alloc]initWithFrame:menopause_label_rect];
    
    menopause_label.text = @"女性更年期";
    
    menopause_label.numberOfLines = 0;
    
    [menopause_label sizeToFit];
    
    [mainview addSubview:menopause_label];
    
    //女性更年期单选按钮
    
    CGFloat menopause_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat menopause_switch_btn_y = menopause_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat menopause_switch_btn_width = 0;
    
    CGFloat menopause_switch_btn_height = 0;
    
    CGRect menopause_switch_btn_rect = CGRectMake(menopause_switch_btn_x, menopause_switch_btn_y,menopause_switch_btn_width,menopause_switch_btn_height);
    
    UISwitch *menopause_switch = [[UISwitch alloc]initWithFrame:menopause_switch_btn_rect];
    
    [mainview addSubview:menopause_switch];
    
    //老年痴呆标签
    
    CGFloat senile_dementia_label_x = label_x;
    
    CGFloat senile_dementia_label_y = menopause_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat senile_dementia_label_width = 0;
    
    CGFloat senile_dementia_label_height = 0;
    
    CGRect senile_dementia_label_rect = CGRectMake(senile_dementia_label_x, senile_dementia_label_y,senile_dementia_label_width,senile_dementia_label_height);
    
    UILabel *senile_dementia_label = [[UILabel alloc]initWithFrame:senile_dementia_label_rect];
    
    senile_dementia_label.text = @"老年痴呆";
    
    senile_dementia_label.numberOfLines = 0;
    
    [senile_dementia_label sizeToFit];
    
    [mainview addSubview:senile_dementia_label];
    
    //老年痴呆单选按钮
    
    CGFloat senile_dementia_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat senile_dementia_switch_btn_y = senile_dementia_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat senile_dementia_switch_btn_width = 0;
    
    CGFloat senile_dementia_switch_btn_height = 0;
    
    CGRect senile_dementia_switch_btn_rect = CGRectMake(senile_dementia_switch_btn_x, senile_dementia_switch_btn_y,senile_dementia_switch_btn_width,senile_dementia_switch_btn_height);
    
    UISwitch *senile_dementia_switch = [[UISwitch alloc]initWithFrame:senile_dementia_switch_btn_rect];
    
    [mainview addSubview:senile_dementia_switch];
    
    //眼科疾病标签
    
    CGFloat eye_disorders_label_x = label_x;
    
    CGFloat eye_disorders_label_y = senile_dementia_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat eye_disorders_label_width = 0;
    
    CGFloat eye_disorders_label_height = 0;
    
    CGRect eye_disorders_label_rect = CGRectMake(eye_disorders_label_x, eye_disorders_label_y,eye_disorders_label_width,eye_disorders_label_height);
    
    UILabel *eye_disorders_label = [[UILabel alloc]initWithFrame:eye_disorders_label_rect];
    
    eye_disorders_label.text = @"眼科疾病";
    
    eye_disorders_label.numberOfLines = 0;
    
    [eye_disorders_label sizeToFit];
    
    [mainview addSubview:eye_disorders_label];
    
    //眼科疾病单选按钮
    
    CGFloat eye_disorders_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat eye_disorders_switch_btn_y = eye_disorders_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat eye_disorders_switch_btn_width = 0;
    
    CGFloat eye_disorders_switch_btn_height = 0;
    
    CGRect eye_disorders_switch_btn_rect = CGRectMake(eye_disorders_switch_btn_x, eye_disorders_switch_btn_y,eye_disorders_switch_btn_width,eye_disorders_switch_btn_height);
    
    UISwitch *eye_disorders_switch = [[UISwitch alloc]initWithFrame:eye_disorders_switch_btn_rect];
    
    [mainview addSubview:eye_disorders_switch];
    
    //肠胃疾病标签
    
    CGFloat stomach_disease_label_x = label_x;
    
    CGFloat stomach_disease_label_y = eye_disorders_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat stomach_disease_label_width = 0;
    
    CGFloat stomach_disease_label_height = 0;
    
    CGRect stomach_disease_label_rect = CGRectMake(stomach_disease_label_x, stomach_disease_label_y,stomach_disease_label_width,stomach_disease_label_height);
    
    UILabel *stomach_disease_label = [[UILabel alloc]initWithFrame:stomach_disease_label_rect];
    
    stomach_disease_label.text = @"肠胃疾病";
    
    stomach_disease_label.numberOfLines = 0;
    
    [stomach_disease_label sizeToFit];
    
    [mainview addSubview:stomach_disease_label];
    
    //肠胃疾病单选按钮
    
    CGFloat stomach_disease_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat stomach_disease_switch_btn_y = stomach_disease_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat stomach_disease_switch_btn_width = 0;
    
    CGFloat stomach_disease_switch_btn_height = 0;
    
    CGRect stomach_disease_switch_btn_rect = CGRectMake(stomach_disease_switch_btn_x, stomach_disease_switch_btn_y,stomach_disease_switch_btn_width,stomach_disease_switch_btn_height);
    
    UISwitch *stomach_disease_switch = [[UISwitch alloc]initWithFrame:stomach_disease_switch_btn_rect];
    
    [mainview addSubview:stomach_disease_switch];
    
    //失眠抑郁标签
    
    CGFloat depression_label_x = label_x;
    
    CGFloat depression_label_y = stomach_disease_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat depression_label_width = 0;
    
    CGFloat depression_label_height = 0;
    
    CGRect depression_label_rect = CGRectMake(depression_label_x, depression_label_y,depression_label_width,depression_label_height);
    
    UILabel *depression_label = [[UILabel alloc]initWithFrame:depression_label_rect];
    
    depression_label.text = @"失眠抑郁";
    
    depression_label.numberOfLines = 0;
    
    [depression_label sizeToFit];
    
    [mainview addSubview:depression_label];
    
    //失眠抑郁单选按钮
    
    CGFloat depression_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat depression_switch_btn_y = depression_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat depression_switch_btn_width = 0;
    
    CGFloat depression_switch_btn_height = 0;
    
    CGRect depression_switch_btn_rect = CGRectMake(depression_switch_btn_x, depression_switch_btn_y,depression_switch_btn_width,depression_switch_btn_height);
    
    UISwitch *depression_switch = [[UISwitch alloc]initWithFrame:depression_switch_btn_rect];
    
    [mainview addSubview:depression_switch];
    
    //肝胆疾病标签
    
    CGFloat ALT_label_x = label_x;
    
    CGFloat ALT_label_y = depression_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat ALT_label_width = 0;
    
    CGFloat ALT_label_height = 0;
    
    CGRect ALT_label_rect = CGRectMake(ALT_label_x, ALT_label_y,ALT_label_width,ALT_label_height);
    
    UILabel *ALT_label = [[UILabel alloc]initWithFrame:ALT_label_rect];
    
    ALT_label.text = @"肝胆疾病";
    
    ALT_label.numberOfLines = 0;
    
    [ALT_label sizeToFit];
    
    [mainview addSubview:ALT_label];
    
    //肝胆疾病单选按钮
    
    CGFloat ALT_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat ALT_switch_btn_y = ALT_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat ALT_switch_btn_width = 0;
    
    CGFloat ALT_switch_btn_height = 0;
    
    CGRect ALT_switch_btn_rect = CGRectMake(ALT_switch_btn_x, ALT_switch_btn_y,ALT_switch_btn_width,ALT_switch_btn_height);
    
    UISwitch *ALT_switch = [[UISwitch alloc]initWithFrame:ALT_switch_btn_rect];
    
    [mainview addSubview:ALT_switch];
    
    //慢性肺塞性肺炎标签
    
    CGFloat obstructive_pulmonary_emphysema_label_x = label_x;
    
    CGFloat obstructive_pulmonary_emphysema_label_y = ALT_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat obstructive_pulmonary_emphysema_label_width = 0;
    
    CGFloat obstructive_pulmonary_emphysema_label_height = 0;
    
    CGRect obstructive_pulmonary_emphysema_label_rect = CGRectMake(obstructive_pulmonary_emphysema_label_x, obstructive_pulmonary_emphysema_label_y,obstructive_pulmonary_emphysema_label_width,
                                                                   obstructive_pulmonary_emphysema_label_height);
    
    UILabel *obstructive_pulmonary_emphysema_label = [[UILabel alloc]initWithFrame:obstructive_pulmonary_emphysema_label_rect];
    
    obstructive_pulmonary_emphysema_label.text = @"慢性肺塞性肺炎";
    
    obstructive_pulmonary_emphysema_label.numberOfLines = 0;
    
    [obstructive_pulmonary_emphysema_label sizeToFit];
    
    [mainview addSubview:obstructive_pulmonary_emphysema_label];
    
    //慢性肺塞性肺炎单选按钮
    
    CGFloat obstructive_pulmonary_emphysema_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat obstructive_pulmonary_emphysema_switch_btn_y = obstructive_pulmonary_emphysema_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat obstructive_pulmonary_emphysema_switch_btn_width = 0;
    
    CGFloat obstructive_pulmonary_emphysema_switch_btn_height = 0;
    
    CGRect obstructive_pulmonary_emphysema_switch_btn_rect = CGRectMake(obstructive_pulmonary_emphysema_switch_btn_x, obstructive_pulmonary_emphysema_switch_btn_y,
                                                                        obstructive_pulmonary_emphysema_switch_btn_width,obstructive_pulmonary_emphysema_switch_btn_height);
    
    UISwitch *obstructive_pulmonary_emphysema_switch = [[UISwitch alloc]initWithFrame:obstructive_pulmonary_emphysema_switch_btn_rect];
    
    [mainview addSubview:obstructive_pulmonary_emphysema_switch];
    
    //138食疗计划标签
    
    CGFloat diet_label_x = label_x;
    
    CGFloat diet_label_y = obstructive_pulmonary_emphysema_label_y + health_manager_label.frame.size.height + space_height;
    
    CGFloat diet_label_width = 0;
    
    CGFloat diet_label_height = 0;
    
    CGRect diet_label_rect = CGRectMake(diet_label_x, diet_label_y,diet_label_width,diet_label_height);
    
    UILabel *diet_label = [[UILabel alloc]initWithFrame:diet_label_rect];
    
    diet_label.text = @"138食疗计划";
    
    diet_label.numberOfLines = 0;
    
    [diet_label sizeToFit];
    
    [mainview addSubview:diet_label];
    
    //138食疗计划单选按钮
    
    CGFloat diet_switch_btn_x = self.view.frame.size.width - myswitch.frame.size.width - label_x;
    
    CGFloat diet_switch_btn_y = diet_label_y - member_accounts_label.frame.size.height * 0.25;
    
    CGFloat diet_switch_btn_width = 0;
    
    CGFloat diet_switch_btn_height = 0;
    
    CGRect diet_switch_btn_rect = CGRectMake(diet_switch_btn_x, diet_switch_btn_y,diet_switch_btn_width,diet_switch_btn_height);
    
    UISwitch *diet_switch = [[UISwitch alloc]initWithFrame:diet_switch_btn_rect];
    
    [mainview addSubview:diet_switch];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    
    tapGr.cancelsTouchesInView = NO;
    
    [mainview addGestureRecognizer:tapGr];
    
    //提交注册按钮
    
    UIButton *reg_btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    CGFloat reg_btn_x = self.view.frame.size.width * 0.25;
    
    CGFloat reg_btn_y = self.view.frame.size.height - 50;
    
    CGFloat reg_btn_width = self.view.frame.size.width * 0.5;
    
    CGFloat reg_btn_height = 30;
    
    CGRect reg_btn_rect = CGRectMake(reg_btn_x, reg_btn_y, reg_btn_width, reg_btn_height);
    
    reg_btn = [[UIButton alloc]initWithFrame:reg_btn_rect];
    
    reg_btn.backgroundColor = [UIColor greenColor];
    
    [reg_btn setTitle:@"提交注册" forState:UIControlStateNormal];
    
    [reg_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [reg_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [reg_btn addTarget:self action:@selector(myregister) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:reg_btn];
    
    reg_btn.userInteractionEnabled = NO;
    
    reg_btn.alpha = 0.4;
    
    self.myregisterbtn = reg_btn;
    
    
    
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

///*点击空白处，收起输入控件*/
//
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//
//{
//    [self.view endEditing:YES];
//    
//}


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

//注册提交

-(void)myregister{
    
    NSString *myquestion_id = [[NSString alloc]init];
    
    if ([self.my_security_question_textfield.text  isEqual: @"我的出生地?"]) {
        
        myquestion_id = @"1";
    
    }else if ([self.my_security_question_textfield.text  isEqual: @"我的生日?"]){
        
    
        myquestion_id = @"2";
        
    }else if ([self.my_security_question_textfield.text  isEqual: @"我父亲的姓名?"]){
        
        
        myquestion_id = @"3";
        
    }else{
        
        
        myquestion_id = @"4";
    
    
    
    }

    NSString *mymedicalhistory = @"D00003,D00001,D00002";
   
    
        //网络注册请求
    
        NSString *setuserregistermethod = [NSString stringWithFormat:setuserregister];
    
        NSArray *registerlistkeys = [[NSArray alloc]initWithObjects:@"username",@"pwd",@"realname",@"question_id",@"nickname",@"mobile",@"medicalhistory",@"idcard",@"housekeeper",@"birthtime",@"answer", nil];
    
        NSArray *registerlistvalues = [[NSArray alloc]initWithObjects:self.myusername.text,self.mypassword.text,self.myrealname.text,myquestion_id,self.mynickname.text,self.mymobile.text
                                    ,mymedicalhistory,self.my_identity_card_num_textfield.text,self.myhousekeeper.text,self.my_birthday_textfield.text,self.myanswer.text, nil];
    
        //NSDictionary *goodslistjosndic = [NSDictionary Key:goodslistkeys Value:goodslistvalues];
    
        NSString *registerlistjosn = [NSString Key:registerlistkeys Value:registerlistvalues];
    
        NSString *registerlisturl = [NSString Method:setuserregistermethod Params:registerlistjosn];
    
        //NSString *goodslisturl = [NSString DicMethod:goodslistmethod Params:goodslistjosndic];
    
    //同步请求
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:registerlisturl] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    
    NSData *received = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
    
    NSString *goodslistresponderjsonstr = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    
    NSString *newgoodslistresponderjsonstr = [NSString decryptUseDES:goodslistresponderjsonstr key:mykey];
    
    NSDictionary *registerresponder = [NSString parseJSONStringToNSDictionary:newgoodslistresponderjsonstr];
    
    if ([registerresponder[@"error"] isEqualToString:@"注册成功！"]) {
        
        self.registerstatus = @"注册成功";
        
    }else if (registerresponder[@"error"] == nil){
        
        self.registerstatus = @"注册失败";
        
    }else{
        
        self.registerstatus = registerresponder[@"error"];
        
    }

    
    
    
//    //快捷方式获得注册提交的session对象
//    
//        NSURLSession *registersession = [NSURLSession sharedSession];
//    
//        NSURL *registerurl = [NSURL URLWithString:registerlisturl];
//    
//        NSURLSessionTask *registertask = [registersession dataTaskWithURL:registerurl
//    
//                                                  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
//                                                      
//                                                      NSString *goodslistresponderjsonstr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//    
//                                                      NSString *newgoodslistresponderjsonstr = [NSString decryptUseDES:goodslistresponderjsonstr key:mykey];
//    
//                                                      NSDictionary *registerresponder = [NSString parseJSONStringToNSDictionary:newgoodslistresponderjsonstr];
//                                                      
//                                                      if ([registerresponder[@"error"] isEqualToString:@"注册成功！"]) {
//                                                          
//                                                          self.registerstatus = @"注册成功";
//                                                          
//                                                      }else if (registerresponder[@"error"] == nil){
//                                                          
//                                                          self.registerstatus = @"注册失败";
//                                                          
//                                                      }else{
//                                                          
//                                                          self.registerstatus = registerresponder[@"error"];
//                                                          
//                                                      }
//                                                      
//                                                      
//                                                  }];
//        //启动右边任务
//        [registertask resume];
//    
    //初始化提示框；
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:self.registerstatus preferredStyle:
                                UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnullaction) {
        
        //点击按钮的响应事件；
        
    }]];
    
    //弹出提示框；
    
    [self presentViewController:alert animated:true completion:nil];

}

-(void)textchange
{
    if (self.myusername.text.length == 0 || self.mypassword.text.length == 0) {
        
        
        self.myregisterbtn.userInteractionEnabled = NO;
        
        self.myregisterbtn.alpha = 0.4;
        
   
       }else{
        
        
        self.myregisterbtn.userInteractionEnabled = YES;
           
        self.myregisterbtn.alpha = 1;
    
    
    }
    
    NSLog(@"%@--%@",self.myusername.text,self.mypassword.text);


}

-(void)viewTapped:(UITapGestureRecognizer*)tapGr
{
    [self.myusername resignFirstResponder];
    
    [self.mypassword resignFirstResponder];
}

@end
