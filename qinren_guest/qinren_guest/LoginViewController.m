//
//  MyViewController.m
//  qinren_guest
//
//  Created by qin_ren on 8/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "LoginViewController.h"

#import "RegisterViewController.h"

#import "ForgetPasswordViewController.h"

#import "NSString+toHexString.h"

#import "ProgressHUD.h"

#import "userinfo.h"

#import "MJExtension.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property (nonatomic,weak) UITextField *my_username_field;

@property (nonatomic,weak) UITextField *my_pwd_field;

@property (nonatomic,weak) UIButton *my_login_btn;

@property (nonatomic,weak) UIButton *my_reg_btn;

@property (nonatomic,weak) UIButton *my_forget_forget_pwd_btn;

@property (nonatomic,strong) NSMutableArray *getuserloginlistarr;

@property (nonatomic,strong) NSMutableDictionary *getuserloginlistdic;

@property (nonatomic,strong) NSArray *testarr;

@property (nonatomic,strong) NSString *teststr;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"登录";
    
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0];
    
    //圆形按钮
    
    CGFloat myhead_btn_x = self.view.frame.size.width * 0.5 -60;
    
    CGFloat myhead_btn_y = 84;
    
    UIButton *myhead_btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    myhead_btn.frame = CGRectMake(myhead_btn_x, myhead_btn_y, 120, 120);
    
    //[myhead_btn setTitle:@"启动" forState:UIControlStateNormal];
    
    myhead_btn.layer.borderWidth = 1;
    
    myhead_btn.layer.borderColor = [UIColor greenColor].CGColor;
    
    myhead_btn.layer.cornerRadius = 60;
    
    myhead_btn.layer.masksToBounds = YES;
    
    //[myhead_btn setTitleColor:[UIColor greenColor]forState:UIControlStateNormal];
    
    [myhead_btn setBackgroundImage:[UIImage imageNamed:@"h4"] forState:UIControlStateNormal];
    
    [self.view addSubview:myhead_btn];
    
    //用户名登录框
    
    CGFloat username_field_x = self.view.frame.size.width * 0.5 - (self.view.frame.size.width * 0.8 * 0.5);
    
    CGFloat username_field_y = myhead_btn_y + myhead_btn.frame.size.height + 25;
    
    CGFloat username_field_width = self.view.frame.size.width * 0.8;
    
    CGFloat username_field_height = 35;
    
    UITextField *username_field = [[UITextField alloc]initWithFrame:CGRectMake(username_field_x, username_field_y, username_field_width, username_field_height)];
    
    [username_field setBorderStyle:UITextBorderStyleRoundedRect];
    
    username_field.placeholder = @"请输入您的帐号";
    
    username_field.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    
    username_field.returnKeyType = UIReturnKeyNext;
    
    username_field.tintColor = [UIColor greenColor];
    
    self.my_username_field = username_field;
    
    [self.view addSubview:self.my_username_field];
    
    //密码输入框
    
    CGFloat pwd_field_x = self.view.frame.size.width * 0.5 - (self.view.frame.size.width * 0.8 * 0.5);
    
    CGFloat pwd_field_y = myhead_btn_y + myhead_btn.frame.size.height + 25 + username_field.frame.size.height + 12.5;
    
    CGFloat pwd_field_width = self.view.frame.size.width * 0.8;
    
    CGFloat pwd_field_height = 35;
    
    UITextField *pwd_field = [[UITextField alloc]initWithFrame:CGRectMake(pwd_field_x, pwd_field_y, pwd_field_width, pwd_field_height)];
    
    [pwd_field setBorderStyle:UITextBorderStyleRoundedRect];
    
    pwd_field.placeholder = @"请输入您的密码";
    
    pwd_field.secureTextEntry = YES;
    
    pwd_field.tintColor = [UIColor greenColor];
    
    self.my_pwd_field = pwd_field;
    
    [self.view addSubview:self.my_pwd_field];
    
    
    
    username_field.delegate = self;
    
    pwd_field.delegate = self;
    
    //登陆按钮
    
    UIButton *login_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    login_btn.layer.cornerRadius = 5.0;
    
    CGFloat login_btn_x = username_field_x;
    
    CGFloat login_btn_y = pwd_field_y + pwd_field_height + 25;
    
    CGFloat login_btn_width = pwd_field_width*0.4;
    
    CGFloat login_btn_height = pwd_field_height;
    
    login_btn.frame = CGRectMake(login_btn_x, login_btn_y, login_btn_width, login_btn_height);
    
    [login_btn setTitle:@"登录" forState:UIControlStateNormal];
    
    [login_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [login_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    login_btn.backgroundColor = [UIColor greenColor];
    
    self.my_login_btn = login_btn;
    
    [self.my_login_btn addTarget:self action:@selector(mylogin) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.my_login_btn];
    
    //注册按钮
    
    UIButton *reg_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    reg_btn.layer.cornerRadius = 5.0;
    
    CGFloat reg_btn_x = username_field_x + login_btn_width + self.view.frame.size.width * 0.15;
    
    CGFloat reg_btn_y = pwd_field_y + pwd_field_height + 25;
    
    CGFloat reg_btn_width = pwd_field_width*0.4;
    
    CGFloat reg_btn_height = pwd_field_height;
    
    reg_btn.frame = CGRectMake(reg_btn_x, reg_btn_y, reg_btn_width, reg_btn_height);
    
    [reg_btn setTitle:@"注册" forState:UIControlStateNormal];
    
    [reg_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [reg_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    reg_btn.backgroundColor = [UIColor whiteColor];
    
    self.my_reg_btn = reg_btn;
    
    [self.my_reg_btn addTarget:self action:@selector(myreg) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.my_reg_btn];

    //忘记密码按钮
    
    UIButton *forget_pwd_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGFloat forget_pwd_btn_x = (username_field_x + username_field_width) * 0.8;
    
    CGFloat forget_pwd_btn_y = username_field_y - 20;
    
    CGFloat forget_pwd_btn_width = 60;
    
    CGFloat forget_pwd_btn_height = 15;
    
    forget_pwd_btn.frame = CGRectMake(forget_pwd_btn_x, forget_pwd_btn_y, forget_pwd_btn_width, forget_pwd_btn_height);
    
    forget_pwd_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [forget_pwd_btn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    
    [forget_pwd_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [forget_pwd_btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    self.my_forget_forget_pwd_btn = forget_pwd_btn;
    
    [self.my_forget_forget_pwd_btn addTarget:self action:@selector(myforget) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.my_forget_forget_pwd_btn];
    
    //关闭按钮
    
    UIButton *close_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGFloat close_btn_x = self.view.frame.size.width - 50;
    
    CGFloat close_btn_y =  30;
    
    CGFloat close_btn_width = 15;
    
    CGFloat close_btn_height = 15;
    
    close_btn.frame = CGRectMake(close_btn_x, close_btn_y, close_btn_width, close_btn_height);
    
    [close_btn setBackgroundImage:[UIImage imageNamed:@"close_btn_bg"] forState:UIControlStateNormal];
    
    [close_btn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:close_btn];
    
}

// textfield 代理方法 实现return键，键盘隐藏。

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
     if (textField == self.my_username_field) {
    
       [self.my_username_field resignFirstResponder];
         
       [self.my_pwd_field becomeFirstResponder];
         
     } else if(textField == self.my_pwd_field){
         
       [self.my_pwd_field resignFirstResponder];
         
       [self.my_login_btn sendActionsForControlEvents:UIControlEventTouchUpInside];
         
         }
     
    
    return YES;
    
    
}

-(void)mylogin

{
   
    //网络登陆请求
    
    NSString *getuserloginmethod = [NSString stringWithFormat:getuserlogin];
    
    NSArray *getuserloginkeys = [[NSArray alloc]initWithObjects:@"username",@"password", nil];
    
    NSArray *getuserloginvalues = [[NSArray alloc]initWithObjects:self.my_username_field.text,self.my_pwd_field.text, nil];
    
    NSString *getuserloginjosn = [NSString Key:getuserloginkeys Value:getuserloginvalues];
    
    //加密url拼接
    
    //NSString *getuserloginurl = [NSString Method:getuserloginmethod Params:getuserloginjosn];
    
    //不加密url拼接
    
    NSString *getuserloginurl = [NSString NOMethod:getuserloginmethod NOParams:getuserloginjosn];
    
    //同步请求
    
    [ProgressHUD show:@"请稍等..."];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:getuserloginurl] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    
    NSData *received = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
    
    NSString *getuserloginresponderjsonstr = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    
    [ProgressHUD dismiss];
    
   // NSString *newgetuserloginresponderjsonstr = [NSString decryptUseDES:getuserloginresponderjsonstr key:mykey];
    
   // NSDictionary *getuserloginresponder = [NSString parseJSONStringToNSDictionary:newgetuserloginresponderjsonstr];
    
    NSDictionary *getuserloginresponder = [NSString parseJSONStringToNSDictionary:getuserloginresponderjsonstr];
    
    NSLog(@"%@",getuserloginresponder[@"data"]);
    
    self.getuserloginlistarr = [userinfo mj_objectArrayWithKeyValuesArray:getuserloginresponder[@"data"]];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    for (userinfo *user in self.getuserloginlistarr) {
        
        NSString *uid = user.uid;
        
        self.teststr = user.msg;
        
        NSString *nickname = user.nickname;
        
        NSString *phone = user.phone;
        
        [defaults setObject:uid forKey:@"uid"];
        
        [defaults setObject:nickname forKey:@"nickname"];
        
        [defaults setObject:phone forKey:@"phone"];
        
    }
    
    //初始化提示框；
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:self.teststr preferredStyle:
                                UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnullaction) {
        
        //点击按钮的响应事件；
        
        if ([self.teststr isEqualToString:@"登录成功"]) {
            
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }
        
    }]];
    
    //弹出提示框；
    
    [self presentViewController:alert animated:true completion:nil];
 
}


-(void)myreg

{
    
    
    UIViewController *reg_vc = [[RegisterViewController alloc]init];
    
    [self presentViewController:reg_vc animated:YES completion:nil];
    
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    [self.view endEditing:YES];
    
}

-(void)myforget

{
    
    
    UIViewController *forget_pwd_vc = [[ForgetPasswordViewController alloc]init];
    
    [self presentViewController:forget_pwd_vc animated:YES completion:nil];
    
    

}

-(void)close

{
    
    [self dismissViewControllerAnimated:YES completion:nil];



}

@end
